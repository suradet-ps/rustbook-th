param(
    [string]$Orig = '',
    [string]$Trans = (Join-Path $PSScriptRoot '..\book\src'),
    [string]$BookDir = (Join-Path $PSScriptRoot '..\book\book')
)

# Rewrites in-page and cross-page anchor links from the upstream English slugs
# to the anchor ids mdbook actually emitted for the translated headings.
# The built HTML is the source of truth, so the Thai slug rules of mdbook
# (which strips tone marks but keeps vowel signs) never have to be guessed.
#
# The rewrite is positional: the Nth heading of an upstream file maps to the
# Nth heading id of the built page for the translated file. Run
# `mdbook build book` first, then this script, then `check-links.ps1`.

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$trans = [System.IO.Path]::GetFullPath($Trans)
$book = [System.IO.Path]::GetFullPath($BookDir)

if ([string]::IsNullOrWhiteSpace($Orig)) {
    $candidates = @(
        (Join-Path $PSScriptRoot '..\..\book\src'),
        (Join-Path $PSScriptRoot '..\book-upstream\src'),
        (Join-Path (Get-Location) 'book-upstream\src')
    )
    foreach ($cand in $candidates) {
        if (Test-Path -LiteralPath $cand) {
            $Orig = $cand
            break
        }
    }
}

if ([string]::IsNullOrWhiteSpace($Orig) -or (-not (Test-Path -LiteralPath $Orig))) {
    Write-Error "Cannot find upstream book/src directory.`nPlease provide the path using: ./scripts/rewrite-anchors.ps1 -Orig <path-to-rust-lang-book/src>"
    exit 1
}

$orig = [System.IO.Path]::GetFullPath($Orig)

if (-not (Test-Path -LiteralPath $book)) {
    Write-Error "Cannot find the built book at $book.`nRun 'mdbook build book' first."
    exit 1
}

function Get-Slug([string]$text) {
    $sb = [System.Text.StringBuilder]::new()
    foreach ($ch in $text.ToLowerInvariant().ToCharArray()) {
        if ($ch -eq ' ') { [void]$sb.Append('-'); continue }
        if ($ch -eq '-' -or $ch -eq '_' -or ($ch -match '^[a-z0-9]$')) { [void]$sb.Append($ch); continue }
    }
    return $sb.ToString()
}

function Read-Normalized($path) {
    return ([System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)).Replace("`r`n", "`n")
}

function Get-Headings($path) {
    $lines = (Read-Normalized $path) -split "`n"
    $inFence = $false
    $inComment = $false
    $res = @()
    foreach ($line in $lines) {
        $stripped = $line -replace '^(\s*>\s?)+', ''
        if ($inFence) {
            if ($stripped -match '^```') { $inFence = $false }
            continue
        }
        if ($inComment) {
            if ($line -match '-->') { $inComment = $false }
            continue
        }
        if ($stripped -match '^```') { $inFence = $true; continue }
        if ($line -match '<!--') {
            if ($line -notmatch '-->') { $inComment = $true }
            continue
        }
        if ($stripped -match '^#{1,6}\s+(.*)$') { $res += $Matches[1].Trim() }
    }
    return ,$res
}

# Map translated page name (file.md) -> (upstream heading slug -> built anchor id)
$anchorMaps = @{}
foreach ($f in (Get-ChildItem -Recurse -File $orig -Filter *.md)) {
    $rel = $f.FullName.Substring($orig.Length + 1).Replace('\', '/')
    $tPath = Join-Path $trans $rel
    $htmlPath = Join-Path $book (([System.IO.Path]::GetFileNameWithoutExtension($f.Name)) + '.html')
    if (-not (Test-Path -LiteralPath $tPath) -or -not (Test-Path -LiteralPath $htmlPath)) { continue }

    $oh = Get-Headings $f.FullName
    $html = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)
    $ids = @([regex]::Matches($html, '<h[1-6] id="([^"]+)"') | ForEach-Object { $_.Groups[1].Value })

    $map = @{}
    $count = [Math]::Min($oh.Count, $ids.Count)
    for ($i = 0; $i -lt $count; $i++) {
        $from = Get-Slug $oh[$i]
        if ($from -ne '' -and -not $map.ContainsKey($from)) {
            $map[$from] = $ids[$i]
        }
    }
    $anchorMaps[$rel] = $map
}

$changed = 0
$rewrites = @()

foreach ($rel in ($anchorMaps.Keys | Sort-Object)) {
    $tPath = Join-Path $trans $rel
    $content = Read-Normalized $tPath
    $lines = $content -split "`n"
    $inFence = $false
    $changedLines = 0

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -match '^\s*```') { $inFence = -not $inFence; continue }
        if ($inFence) { continue }

        $newLine = [regex]::Replace($line, '(?<![\w/.-])([A-Za-z0-9][A-Za-z0-9_.-]*\.(?:html|md))#([A-Za-z0-9_-]+)', {
            param($m)
            $page = ($m.Groups[1].Value -replace '\.html$', '.md')
            if ($anchorMaps.ContainsKey($page)) {
                $anchor = $m.Groups[2].Value
                $map = $anchorMaps[$page]
                if ($map.ContainsKey($anchor)) {
                    return $m.Groups[1].Value + '#' + $map[$anchor]
                }
            }
            return $m.Value
        })

        $own = $anchorMaps[$rel]
        $newLine = [regex]::Replace($newLine, '\]\(#([A-Za-z0-9_-]+)\)', {
            param($m)
            $anchor = $m.Groups[1].Value
            if ($null -ne $own -and $own.ContainsKey($anchor)) {
                return '](#' + $own[$anchor] + ')'
            }
            return $m.Value
        })
        # Reference definitions whose target is an in-page anchor, e.g.
        # [access]: #accessing-values-in-a-hash-map
        $newLine = [regex]::Replace($newLine, '^(\s*\[[^\]]+\]:\s+)#([A-Za-z0-9_-]+)', {
            param($m)
            $anchor = $m.Groups[2].Value
            if ($null -ne $own -and $own.ContainsKey($anchor)) {
                return $m.Groups[1].Value + '#' + $own[$anchor]
            }
            return $m.Value
        })

        if ($newLine -cne $line) {
            $lines[$i] = $newLine
            $changedLines++
            $rewrites += "$rel : $($line.Trim())  =>  $($newLine.Trim())"
        }
    }

    if ($changedLines -gt 0) {
        $changed += $changedLines
        [System.IO.File]::WriteAllText($tPath, ($lines -join "`n"), (New-Object System.Text.UTF8Encoding($false)))
    }
}

Write-Output "Rewrote $changed anchor link(s)."
$rewrites | ForEach-Object { Write-Output "  $_" }
