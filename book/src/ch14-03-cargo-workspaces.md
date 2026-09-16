## เวิร์กสเปซของ Cargo

ในบทที่ 12 เราได้สร้างแพ็กเกจ (package) ที่ประกอบด้วยเครตไบนารี (binary crate) และเครตไลบรารี (library crate) เมื่อโปรเจกต์ของคุณพัฒนาขึ้น คุณอาจพบว่าเครตไลบรารีเติบโตขึ้นเรื่อยๆ และคุณต้องการแยกแพ็กเกจของคุณออกเป็นเครตไลบรารีหลายตัว Cargo มีฟีเจอร์ที่เรียกว่า_เวิร์กสเปซ_ (workspace) ที่ช่วยจัดการแพ็กเกจที่เกี่ยวข้องกันหลายแพ็กเกจซึ่งพัฒนาควบคู่กันได้

### การสร้างเวิร์กสเปซ

_เวิร์กสเปซ_ หนึ่งๆ คือชุดของแพ็กเกจที่ใช้ _Cargo.lock_ และไดเรกทอรีเอาต์พุตเดียวกัน มาสร้างโปรเจกต์ที่ใช้เวิร์กสเปซกัน—เราจะใช้โค้ดง่ายๆ เพื่อให้เรามุ่งความสนใจไปที่โครงสร้างของเวิร์กสเปซได้ มีหลายวิธีในการจัดโครงสร้างเวิร์กสเปซ เราจึงจะแสดงเพียงวิธีที่พบบ่อยวิธีหนึ่ง เราจะมีเวิร์กสเปซที่บรรจุไบนารีหนึ่งตัวและไลบรารีสองตัว ไบนารีซึ่งจะให้ฟังก์ชันการทำงานหลัก จะพึ่งพาไลบรารีทั้งสองตัว ไลบรารีหนึ่งจะให้ฟังก์ชัน `add_one` และอีกไลบรารีให้ฟังก์ชัน `add_two` เครตทั้งสามนี้จะเป็นส่วนหนึ่งของเวิร์กสเปซเดียวกัน เราจะเริ่มต้นด้วยการสร้างไดเรกทอรีใหม่สำหรับเวิร์กสเปซ:

```console
$ mkdir add
$ cd add
```

ต่อไป ในไดเรกทอรี _add_ เราสร้างไฟล์ _Cargo.toml_ ที่จะใช้ตั้งค่าทั้งเวิร์กสเปซ ไฟล์นี้จะไม่มีส่วน `[package]` แต่จะเริ่มต้นด้วยส่วน `[workspace]` ซึ่งจะอนุญาตให้เราเพิ่มสมาชิกเข้าไปในเวิร์กสเปซได้ เรายังตั้งใจใช้เวอร์ชันล่าสุดและดีที่สุดของอัลกอริทึมตัวรีโซล์ฟ (resolver) ของ Cargo ในเวิร์กสเปซของเรา โดยตั้งค่า `resolver` เป็น `"3"`:

<span class="filename">ชื่อไฟล์: Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-01-workspace/add/Cargo.toml}}
```

ต่อไป เราจะสร้างเครตไบนารี `adder` โดยรัน `cargo new` ภายในไดเรกทอรี _add_:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/output-only-01-adder-crate/add
remove `members = ["adder"]` from Cargo.toml
rm -rf adder
cargo new adder
copy output below
-->

```console
$ cargo new adder
     Created binary (application) `adder` package
      Adding `adder` as member of workspace at `file:///projects/add`
```

การรัน `cargo new` ภายในเวิร์กสเปซยังเพิ่มแพ็กเกจที่สร้างใหม่เข้าไปในคีย์ `members` ในนิยาม `[workspace]` ในไฟล์ _Cargo.toml_ ของเวิร์กสเปซโดยอัตโนมัติด้วย เช่นนี้:

```toml
{{#include ../listings/ch14-more-about-cargo/output-only-01-adder-crate/add/Cargo.toml}}
```

ณ จุดนี้ เราสามารถบิลด์เวิร์กสเปซได้โดยรัน `cargo build` ไฟล์ในไดเรกทอรี _add_ ของคุณควรมีหน้าตาดังนี้:

```text
├── Cargo.lock
├── Cargo.toml
├── adder
│   ├── Cargo.toml
│   └── src
│       └── main.rs
└── target
```

เวิร์กสเปซมีไดเรกทอรี _target_ หนึ่งแห่งที่ระดับบนสุดซึ่งอาร์ติแฟกต์ที่คอมไพล์แล้วจะถูกวางไว้ แพ็กเกจ `adder` ไม่มีไดเรกทอรี _target_ เป็นของตัวเอง แม้ว่าเราจะรัน `cargo build` จากภายในไดเรกทอรี _adder_ อาร์ติแฟกต์ที่คอมไพล์แล้วก็ยังคงไปอยู่ใน _add/target_ แทนที่จะเป็น _add/adder/target_ Cargo จัดโครงสร้างไดเรกทอรี _target_ ในเวิร์กสเปซแบบนี้เพราะเครตในเวิร์กสเปซมีจุดประสงค์ให้พึ่งพากันเอง หากแต่ละเครตมีไดเรกทอรี _target_ ของตัวเอง แต่ละเครตก็จะต้องคอมไพล์เครตอื่นๆ ในเวิร์กสเปซซ้ำเพื่อวางอาร์ติแฟกต์ในไดเรกทอรี _target_ ของตัวเอง ด้วยการแชร์ไดเรกทอรี _target_ เดียวกัน เครตต่างๆ จึงหลีกเลี่ยงการบิลด์ซ้ำที่ไม่จำเป็นได้

### การสร้างแพ็กเกจที่สองในเวิร์กสเปซ

ต่อไป มาสร้างแพ็กเกจสมาชิกอีกตัวในเวิร์กสเปซและตั้งชื่อมันว่า `add_one` กัน สร้างเครตไลบรารีใหม่ชื่อ `add_one`:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/output-only-02-add-one/add
remove `"add_one"` from `members` list in Cargo.toml
rm -rf add_one
cargo new add_one --lib
copy output below
-->

```console
$ cargo new add_one --lib
     Created library `add_one` package
      Adding `add_one` as member of workspace at `file:///projects/add`
```

ไฟล์ _Cargo.toml_ ระดับบนสุดจะรวมพาธ _add_one_ ไว้ในรายการ `members` แล้ว:

<span class="filename">ชื่อไฟล์: Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-02-workspace-with-two-crates/add/Cargo.toml}}
```

ไดเรกทอรี _add_ ของคุณตอนนี้ควรมีไดเรกทอรีและไฟล์เหล่านี้:

```text
├── Cargo.lock
├── Cargo.toml
├── add_one
│   ├── Cargo.toml
│   └── src
│       └── lib.rs
├── adder
│   ├── Cargo.toml
│   └── src
│       └── main.rs
└── target
```

ในไฟล์ _add_one/src/lib.rs_ มาเพิ่มฟังก์ชัน `add_one` กัน:

<span class="filename">ชื่อไฟล์: add_one/src/lib.rs</span>

```rust,noplayground
{{#rustdoc_include ../listings/ch14-more-about-cargo/no-listing-02-workspace-with-two-crates/add/add_one/src/lib.rs}}
```

ตอนนี้เราสามารถให้แพ็กเกจ `adder` ที่มีไบนารีของเราพึ่งพาแพ็กเกจ `add_one` ที่มีไลบรารีของเราได้ ก่อนอื่น เราจะต้องเพิ่มดีเพนเดนซีแบบพาธ (path dependency) ไปยัง `add_one` ใน _adder/Cargo.toml_

<span class="filename">ชื่อไฟล์: adder/Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-02-workspace-with-two-crates/add/adder/Cargo.toml:6:7}}
```

Cargo ไม่ได้สันนิษฐานว่าเครตในเวิร์กสเปซจะพึ่งพากันเอง เราจึงต้องระบุความสัมพันธ์ของดีเพนเดนซีอย่างชัดแจ้ง

ต่อไป มาใช้ฟังก์ชัน `add_one` (จากเครต `add_one`) ในเครต `adder` กัน เปิดไฟล์ _adder/src/main.rs_ และเปลี่ยนฟังก์ชัน `main` ให้เรียกฟังก์ชัน `add_one` ดังในลิสติ้ง 14-7

<Listing number="14-7" file-name="adder/src/main.rs" caption="การใช้เครตไลบรารี `add_one` จากเครต `adder`">

```rust,ignore
{{#rustdoc_include ../listings/ch14-more-about-cargo/listing-14-07/add/adder/src/main.rs}}
```

</Listing>

มาบิลด์เวิร์กสเปซกันโดยรัน `cargo build` ในไดเรกทอรี _add_ ระดับบนสุด!

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/listing-14-07/add
cargo build
copy output below; the output updating script doesn't handle subdirectories in paths properly
-->

```console
$ cargo build
   Compiling add_one v0.1.0 (file:///projects/add/add_one)
   Compiling adder v0.1.0 (file:///projects/add/adder)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.22s
```

ในการรันเครตไบนารีจากไดเรกทอรี _add_ เราสามารถระบุได้ว่าเราต้องการรันแพ็กเกจใดในเวิร์กสเปซ โดยใช้พารามิเตอร์ `-p` และชื่อแพ็กเกจกับ `cargo run`:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/listing-14-07/add
cargo run -p adder
copy output below; the output updating script doesn't handle subdirectories in paths properly
-->

```console
$ cargo run -p adder
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.00s
     Running `target/debug/adder`
Hello, world! 10 plus one is 11!
```

คำสั่งนี้รันโค้ดใน _adder/src/main.rs_ ซึ่งพึ่งพาเครต `add_one`

<!-- Old headings. Do not remove or links may break. -->

<a id="depending-on-an-external-package-in-a-workspace"></a>

### การพึ่งพาแพ็กเกจภายนอก

โปรดสังเกตว่าเวิร์กสเปซมีไฟล์ _Cargo.lock_ เพียงไฟล์เดียวที่ระดับบนสุด แทนที่จะมี _Cargo.lock_ ในไดเรกทอรีของแต่ละเครต สิ่งนี้ทำให้มั่นใจได้ว่าเครตทั้งหมดใช้เวอร์ชันเดียวกันของดีเพนเดนซีทั้งหมด หากเราเพิ่มแพ็กเกจ `rand` ลงในไฟล์ _adder/Cargo.toml_ และ _add_one/Cargo.toml_ Cargo จะรีโซล์ฟทั้งสองเป็น `rand` เวอร์ชันเดียวและบันทึกสิ่งนั้นไว้ใน _Cargo.lock_ ไฟล์เดียว การทำให้เครตทั้งหมดในเวิร์กสเปซใช้ดีเพนเดนซีเดียวกันหมายความว่าเครตต่างๆ จะเข้ากันได้เสมอ มาเพิ่มเครต `rand` ลงในส่วน `[dependencies]` ในไฟล์ _add_one/Cargo.toml_ เพื่อให้เราใช้เครต `rand` ในเครต `add_one` ได้:

<!-- When updating the version of `rand` used, also update the version of
`rand` used in these files so they all match:

* ch01-01-installation.md
* ch02-00-guessing-game-tutorial.md
* ch07-04-bringing-paths-into-scope-with-the-use-keyword.md
-->

<span class="filename">ชื่อไฟล์: add_one/Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-03-workspace-with-external-dependency/add/add_one/Cargo.toml:6:7}}
```

ตอนนี้เราสามารถเพิ่ม `use rand;` ลงในไฟล์ _add_one/src/lib.rs_ ได้ และการบิลด์เวิร์กสเปซทั้งหมดโดยรัน `cargo build` ในไดเรกทอรี _add_ จะนำเครต `rand` เข้ามาและคอมไพล์มัน เราจะได้คำเตือนหนึ่งรายการเพราะเราไม่ได้อ้างถึง `rand` ที่เรานำเข้าสู่สโคป:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/no-listing-03-workspace-with-external-dependency/add
cargo build
copy output below; the output updating script doesn't handle subdirectories in paths properly
-->

```console
$ cargo build
    Updating crates.io index
  Downloaded rand v0.10.1
   --snip--
   Compiling rand v0.10.1
   Compiling add_one v0.1.0 (file:///projects/add/add_one)
warning: unused import: `rand`
 --> add_one/src/lib.rs:1:5
  |
1 | use rand;
  |     ^^^^
  |
  = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

warning: `add_one` (lib) generated 1 warning (run `cargo fix --lib -p add_one` to apply 1 suggestion)
   Compiling adder v0.1.0 (file:///projects/add/adder)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.95s
```

ไฟล์ _Cargo.lock_ ระดับบนสุดตอนนี้มีข้อมูลเกี่ยวกับการที่ `add_one` พึ่งพา `rand` อย่างไรก็ตาม แม้ว่า `rand` ถูกใช้ที่ไหนสักแห่งในเวิร์กสเปซ เราก็ยังใช้มันในเครตอื่นๆ ในเวิร์กสเปซไม่ได้ เว้นแต่เราจะเพิ่ม `rand` ลงในไฟล์ _Cargo.toml_ ของเครตเหล่านั้นด้วย ตัวอย่างเช่น หากเราเพิ่ม `use rand;` ลงในไฟล์ _adder/src/main.rs_ สำหรับแพ็กเกจ `adder` เราจะได้ข้อผิดพลาด:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/output-only-03-use-rand/add
cargo build
copy output below; the output updating script doesn't handle subdirectories in paths properly
-->

```console
$ cargo build
  --snip--
   Compiling adder v0.1.0 (file:///projects/add/adder)
error[E0432]: unresolved import `rand`
 --> adder/src/main.rs:2:5
  |
2 | use rand;
  |     ^^^^ no external crate `rand`
```

ในการแก้ไขสิ่งนี้ ให้แก้ไฟล์ _Cargo.toml_ สำหรับแพ็กเกจ `adder` และระบุว่า `rand` เป็นดีเพนเดนซีของมันด้วย การบิลด์แพ็กเกจ `adder` จะเพิ่ม `rand` เข้าไปในรายการดีเพนเดนซีสำหรับ `adder` ใน _Cargo.lock_ แต่จะไม่มีการดาวน์โหลดสำเนา `rand` เพิ่มเติม Cargo จะทำให้แน่ใจว่าทุกเครตในทุกแพ็กเกจในเวิร์กสเปซที่ใช้แพ็กเกจ `rand` จะใช้เวอร์ชันเดียวกัน ตราบใดที่พวกมันระบุเวอร์ชันของ `rand` ที่เข้ากันได้ ช่วยประหยัดพื้นที่ของเราและทำให้แน่ใจว่าเครตในเวิร์กสเปซจะเข้ากันได้ซึ่งกันและกัน

หากเครตในเวิร์กสเปซระบุเวอร์ชันที่เข้ากันไม่ได้ของดีเพนเดนซีเดียวกัน Cargo จะรีโซล์ฟแต่ละตัว แต่จะยังพยายามรีโซล์ฟให้ได้จำนวนเวอร์ชันน้อยที่สุดเท่าที่เป็นไปได้

### การเพิ่มเทสต์ให้เวิร์กสเปซ

เพื่อการปรับปรุงอีกอย่างหนึ่ง มาเพิ่มเทสต์ของฟังก์ชัน `add_one::add_one` ภายในเครต `add_one` กัน:

<span class="filename">ชื่อไฟล์: add_one/src/lib.rs</span>

```rust,noplayground
{{#rustdoc_include ../listings/ch14-more-about-cargo/no-listing-04-workspace-with-tests/add/add_one/src/lib.rs}}
```

ตอนนี้รัน `cargo test` ในไดเรกทอรี _add_ ระดับบนสุด การรัน `cargo test` ในเวิร์กสเปซที่มีโครงสร้างแบบนี้จะรันเทสต์ของเครตทั้งหมดในเวิร์กสเปซ:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/no-listing-04-workspace-with-tests/add
cargo test
copy output below; the output updating script doesn't handle subdirectories in
paths properly
-->

```console
$ cargo test
   Compiling add_one v0.1.0 (file:///projects/add/add_one)
   Compiling adder v0.1.0 (file:///projects/add/adder)
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.20s
     Running unittests src/lib.rs (target/debug/deps/add_one-93c49ee75dc46543)

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running unittests src/main.rs (target/debug/deps/adder-3a47283c568d2b6a)

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests add_one

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

ส่วนแรกของเอาต์พุตแสดงว่าเทสต์ `it_works` ในเครต `add_one` ผ่าน ส่วนถัดไปแสดงว่าไม่พบเทสต์ใดๆ ในเครต `adder` และส่วนสุดท้ายแสดงว่าไม่พบด็อกเทสต์ใดๆ ในเครต `add_one`

เรายังสามารถรันเทสต์สำหรับเครตใดเครตหนึ่งในเวิร์กสเปซจากไดเรกทอรีระดับบนสุดได้ โดยใช้แฟล็ก `-p` และระบุชื่อเครตที่เราต้องการทดสอบ:

<!-- manual-regeneration
cd listings/ch14-more-about-cargo/no-listing-04-workspace-with-tests/add
cargo test -p add_one
copy output below; the output updating script doesn't handle subdirectories in paths properly
-->

```console
$ cargo test -p add_one
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.00s
     Running unittests src/lib.rs (target/debug/deps/add_one-93c49ee75dc46543)

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests add_one

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

เอาต์พุตนี้แสดงว่า `cargo test` รันเฉพาะเทสต์ของเครต `add_one` และไม่ได้รันเทสต์ของเครต `adder`

หากคุณเผยแพร่เครตในเวิร์กสเปซไปยัง [crates.io](https://crates.io/)<!-- ignore --> เครตแต่ละตัวในเวิร์กสเปซจะต้องถูกเผยแพร่แยกกัน เช่นเดียวกับ `cargo test` เราสามารถเผยแพร่เครตใดเครตหนึ่งในเวิร์กสเปซของเราได้โดยใช้แฟล็ก `-p` และระบุชื่อเครตที่เราต้องการเผยแพร่

สำหรับแบบฝึกหัดเพิ่มเติม มาเพิ่มเครต `add_two` ให้กับเวิร์กสเปซนี้ในลักษณะคล้ายกับเครต `add_one` กัน!

เมื่อโปรเจกต์ของคุณเติบโตขึ้น ลองพิจารณาใช้เวิร์กสเปซ: มันช่วยให้คุณทำงานกับองค์ประกอบที่เล็กลงและเข้าใจง่ายกว่าก้อนโค้ดขนาดใหญ่ นอกจากนี้ การเก็บเครตไว้ในเวิร์กสเปซยังทำให้การประสานงานระหว่างเครตง่ายขึ้นได้ หากพวกมันมักถูกเปลี่ยนแปลงในเวลาเดียวกัน
