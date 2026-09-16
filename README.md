# rustbook-th

```
██████╗  ██╗   ██╗ ███████╗ ████████╗ ██████╗   ██████╗   ██████╗  ██╗  ██╗    ████████╗ ██╗  ██╗
██╔══██╗ ██║   ██║ ██╔════╝ ╚══██╔══╝ ██╔══██╗ ██╔═══██╗ ██╔═══██╗ ██║ ██╔╝    ╚══██╔══╝ ██║  ██║
██████╔╝ ██║   ██║ ███████╗    ██║    ██████╔╝ ██║   ██║ ██║   ██║ █████╔╝        ██║    ███████║
██╔══██╗ ██║   ██║ ╚════██║    ██║    ██╔══██╗ ██║   ██║ ██║   ██║ ██╔═██╗        ██║    ██╔══██║
██║  ██║ ╚██████╔╝ ███████║    ██║    ██████╔╝ ╚██████╔╝ ╚██████╔╝ ██║  ██╗       ██║    ██║  ██║
╚═╝  ╚═╝  ╚═════╝  ╚══════╝    ╚═╝    ╚═════╝   ╚═════╝   ╚═════╝  ╚═╝  ╚═╝       ╚═╝    ╚═╝  ╚═╝
```

---

## ◆ PULSE

[![GitHub Pages](https://img.shields.io/badge/Pages-live-2ea44f)](https://suradet-ps.github.io/rustbook-th/)
[![License](https://img.shields.io/badge/license-MIT%20OR%20Apache--2.0-blue.svg)](#-anatomy)

The compiler has a gatekeeper, and the borrow checker has a law -
rustbook-th is the Thai bridge to working alongside both. This is the
complete Thai translation of the official Rust book: 21 chapters plus
seven appendixes built with mdbook, terminology locked by a single
glossary, and every code block byte-identical to the original. The
structure mirrors the upstream repo file-for-file, the include
directives still resolve against the untouched `listings/`, and the
license travels with the text. Built for the Thai-speaking Rustacean:
[suradet-ps.github.io/rustbook-th](https://suradet-ps.github.io/rustbook-th/).

| 112 files translated ▣ | Glossary, one canon per term ▣ | 2,239 anchor links OK ▣ | Build passing ▣ |
|---|---|---|---|
| 21 chapters + 7 appendixes | chosen once, reused everywhere | checked on the built book | code blocks byte-exact |

*v1.0.0 - translation, glossary, verification, and the static build
are all sealed.*

> Built with mdbook 0.5 + Markdown, translated from
> [rust-lang/book](https://github.com/rust-lang/book), verified by
> script and rendered as static HTML - a book with the borrow checker
> on the page.
>
> **suradet-ps**, artifact keeper

---

## ◆ IGNITION

One runtime, three commands.

```
⟫ git clone https://github.com/suradet-ps/rustbook-th.git
⟫ cd rustbook-th
⟫ cargo install mdbook
⟫ mdbook serve book --open
```

Open [http://localhost:3000](http://localhost:3000).

```
⟫ mdbook build book                             # static HTML into book/book
⟫ powershell scripts/rewrite-anchors.ps1        # map upstream anchors to the built Thai ids (after a build)
⟫ powershell scripts/check-links.ps1            # all anchors in the built book (pwsh on Linux/macOS)
⟫ powershell scripts/verify-translation.ps1     # byte-exact check vs upstream
```

> On Linux or macOS, run the verification scripts using `pwsh scripts/<script>.ps1`.
> `verify-translation.ps1` checks against `rust-lang/book` in adjacent directories or via `-Orig <path>`.
> The build also compiles the upstream `mdbook-trpl` preprocessors from
> `book/packages/mdbook-trpl`, so `cargo` must be available.
> Links that escape the book (`../std/...`, `../reference/...`) point at the host
> documentation on doc.rust-lang.org and are kept as upstream wrote them.

<details>
<summary>Translating a chapter</summary>

A chapter is a file: `book/src/<chapter>.md`, listed in
`book/src/SUMMARY.md`. The glossary lives in `GLOSSARY.md` - a term
is chosen once and reused everywhere. Code blocks, commands, include
directives (`{{#include}}`, `{{#rustdoc_include}}`), links, and
filenames stay verbatim; only prose and headings are translated. A
`<Listing>` tag keeps its `number` and `file-name`; only the
`caption` is translated. Heading anchors follow mdbook's slug rules
(Thai tone marks are stripped, vowel signs are kept), so anchors are
taken from the built HTML by `scripts/rewrite-anchors.ps1`, never
guessed.

</details>

---

## ◆ ANATOMY

One stack, zero custom JS, several quiet helpers.

- **Translates** - the complete book: introduction, getting started,
  the 21-chapter path from "Hello, world!" to a multithreaded web
  server, and all seven appendixes - Thai prose over untouched code.
- **Glossaries** - `GLOSSARY.md` locks the vocabulary (one Thai
  term per concept, chosen once and reused), so chapter nine agrees
  with chapter two.
- **Verifies** - `scripts/verify-translation.ps1` diffs every code
  block (956 of them), heading level, and link target against
  upstream `rust-lang/book` - byte-exact or it does not pass.
- **Checks** - `scripts/check-links.ps1` walks the built book and
  resolves every anchor link (2,239 of them) against real heading
  ids - including the Thai slugs that mdbook derives from translated
  headings.
- **Builds** - mdbook renders static HTML into `book/book/` with the
  upstream `mdbook-trpl` listing and note preprocessors, localized
  with Thai labels (ลิสติ้ง, ชื่อไฟล์, หมายเหตุ), and the original
  `listings/` kept beside them so every include resolves.
- **Licenses** - MIT OR Apache-2.0, inherited from upstream, with the
  LICENSE files shipped beside the text.

---

## ◆ RITUALS

**The core ceremony** - the translation pass:

1. Open a chapter in `book/src/`. The upstream `rust-lang/book`
   repo sits beside it (clone
   `https://github.com/rust-lang/book` alongside `rustbook-th`)
   - structure is a contract.
2. Translate the prose; keep every code block, command, and include
   directive as the original wrote it.
3. Consult `GLOSSARY.md` for every term that already has a canon.
   New terms get proposed in the glossary first.
4. Build, rewrite anchors, verify, check. The book builds clean, the
   diff is byte-exact, and the anchors resolve.

**The ceremony of the anchor** - mdbook slugs strip Thai tone marks
but keep vowel signs, so a heading's anchor is never its plain
spelling. `scripts/rewrite-anchors.ps1` maps each upstream heading
positionally to the id mdbook actually emitted in the built page,
then writes it into the source - a guessed anchor is a broken link
waiting to happen.

**The ceremony of the code block** - an include directive is code
too. A translated `{{#rustdoc_include}}` path or a reflowed console
transcript is a regression, not a translation. The verifier is the
conscience of the repo.

---

## ◆ ECHOES

**Where this artifact is heading**

```
P1 ▸ bootstrap, glossary, book config, assets ─────────────────────── ▸ sealed
P2 ▸ front matter + chapter 1 ─────────────────────────────────────── ▸ sealed
P3 ▸ chapters 2-9 ─────────────────────────────────────────────────── ▸ sealed
P4 ▸ chapters 10-16 ───────────────────────────────────────────────── ▸ sealed
P5 ▸ chapters 17-21 + appendixes ──────────────────────────────────── ▸ sealed
P6 ▸ full-book verification + anchor localization + Pages build ───── ▸ sealed
```

**Raising the artifact** - the honest path lives in `GLOSSARY.md`
(term canon), `scripts/` (the verification gate and the anchor
rewriter), and `book/book.toml` (book config). New chapters follow
the frontmatter-free contract of the SUMMARY. Open an issue first to
discuss a change.

**Status** - on every change: `mdbook build book` must pass, the
translation verifier must report byte-exact code blocks across all
112 files, and the link checker must report `ALL ANCHOR LINKS OK`.
[Watch the gates](scripts).

---

```
  ─────────────────────────────────────────
   Every compiler has its borrow checker
   Every book has its first page
  ─────────────────────────────────────────
```

Translated from [The Rust Programming Language](https://github.com/rust-lang/book),
which is licensed under [MIT](LICENSE-MIT) OR [Apache-2.0](LICENSE-APACHE).
