## เวิร์กสเปซของ Cargo

ในบทที่ 12 เราได้สร้างแพ็กเกจที่ประกอบด้วยเครตไบนารีและเครตไลบรารี เมื่อโปรเจกต์ของคุณเติบโตขึ้น คุณอาจพบว่าเครตไลบรารีเริ่มมีขนาดใหญ่ขึ้นเรื่อย ๆ จนคุณต้องการแยกแพ็กเกจออกเป็นเครตไลบรารีหลายตัว Cargo มีฟีเจอร์ที่เรียกว่า_เวิร์กสเปซ (workspaces)_ ซึ่งช่วยจัดการแพ็กเกจที่เกี่ยวข้องกันหลายแพ็กเกจและพัฒนาควบคู่กันไปได้

### การสร้างเวิร์กสเปซ

_เวิร์กสเปซ (workspace)_ คือชุดของแพ็กเกจที่แชร์ไฟล์ _Cargo.lock_ และไดเรกทอรีเอาต์พุตเดียวกัน มาสร้างโปรเจกต์ที่ใช้เวิร์กสเปซกัน โดยเราจะใช้โค้ดตัวอย่างแบบเรียบง่าย เพื่อให้โฟกัสที่โครงสร้างของเวิร์กสเปซได้อย่างเต็มที่ การจัดโครงสร้างเวิร์กสเปซมีได้หลายวิธี ในที่นี้เราจะแสดงวิธีหนึ่งที่นิยมใช้กัน เราจะสร้างเวิร์กสเปซที่มีไบนารีหนึ่งตัวและไลบรารีสองตัว โดยไบนารีซึ่งทำหน้าที่หลักจะพึ่งพาไลบรารีทั้งสอง ตัวหนึ่งมีฟังก์ชัน `add_one` และอีกตัวมีฟังก์ชัน `add_two` เครตทั้งสามตัวนี้จะอยู่ร่วมกันในเวิร์กสเปซเดียวกัน เราจะเริ่มด้วยการสร้างไดเรกทอรีใหม่สำหรับเวิร์กสเปซ:

```console
$ mkdir add
$ cd add
```

ถัดมา ในไดเรกทอรี _add_ เราจะสร้างไฟล์ _Cargo.toml_ เพื่อกำหนดค่าให้กับทั้งเวิร์กสเปซ ไฟล์นี้จะไม่มีเซกชัน `[package]` แต่จะเริ่มต้นด้วยเซกชัน `[workspace]` ซึ่งช่วยให้เราเพิ่มสมาชิก (members) เข้ามาในเวิร์กสเปซได้ นอกจากนี้เรายังเลือกใช้อัลกอริทึม resolver เวอร์ชันล่าสุดของ Cargo ในเวิร์กสเปซของเรา โดยกำหนดค่า `resolver` เป็น `"3"`:

<span class="filename">ชื่อไฟล์: Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-01-workspace/add/Cargo.toml}}
```

จากนั้น เราจะสร้างเครตไบนารี `adder` โดยรัน `cargo new` ภายในไดเรกทอรี _add_:

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

การรัน `cargo new` ภายในเวิร์กสเปซจะเพิ่มแพ็กเกจที่เพิ่งสร้างใหม่เข้าไปในคีย์ `members` ของนิยาม `[workspace]` ในไฟล์ _Cargo.toml_ ของเวิร์กสเปซให้โดยอัตโนมัติ ดังนี้:

```toml
{{#include ../listings/ch14-more-about-cargo/output-only-01-adder-crate/add/Cargo.toml}}
```

ณ จุดนี้ เราสามารถบิลด์เวิร์กสเปซได้โดยรัน `cargo build` โดยโครงสร้างไฟล์ในไดเรกทอรี _add_ ของคุณควรมีหน้าตาดังนี้:

```text
├── Cargo.lock
├── Cargo.toml
├── adder
│   ├── Cargo.toml
│   └── src
│       └── main.rs
└── target
```

เวิร์กสเปซจะมีไดเรกทอรี _target_ เพียงแห่งเดียวอยู่ที่ระดับบนสุดสำหรับเก็บอาร์ติแฟกต์ที่คอมไพล์แล้ว โดยแพ็กเกจ `adder` จะไม่มีไดเรกทอรี _target_ เป็นของตัวเอง และแม้ว่าเราจะรัน `cargo build` จากภายในไดเรกทอรี _adder_ อาร์ติแฟกต์ที่คอมไพล์แล้วก็ยังคงถูกวางไว้ใน _add/target_ ไม่ใช่ _add/adder/target_ ที่ Cargo จัดโครงสร้างไดเรกทอรี _target_ ในเวิร์กสเปซเช่นนี้ ก็เพราะเครตต่าง ๆ ในเวิร์กสเปซถูกออกแบบมาให้พึ่งพากันเอง หากแต่ละเครตมีไดเรกทอรี _target_ แยกเป็นของตัวเอง แต่ละเครตก็จะต้องคอมไพล์เครตอื่น ๆ ในเวิร์กสเปซซ้ำใหม่เพื่อนำอาร์ติแฟกต์มาไว้ในไดเรกทอรี _target_ ของตนเอง การแชร์ไดเรกทอรี _target_ ร่วมกันจึงช่วยหลีกเลี่ยงการคอมไพล์ซ้ำซ้อนโดยไม่จำเป็น

### การสร้างแพ็กเกจที่สองในเวิร์กสเปซ

ถัดมา มาสร้างแพ็กเกจสมาชิกอีกตัวในเวิร์กสเปซและตั้งชื่อว่า `add_one` โดยสร้างเป็นเครตไลบรารีใหม่:

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

ตอนนี้ไฟล์ _Cargo.toml_ ระดับบนสุดจะรวมพาธ _add_one_ ไว้ในรายการ `members` เรียบร้อยแล้ว:

<span class="filename">ชื่อไฟล์: Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-02-workspace-with-two-crates/add/Cargo.toml}}
```

ไดเรกทอรี _add_ ของคุณตอนนี้ควรมีไดเรกทอรีและไฟล์ดังต่อไปนี้:

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

ในไฟล์ _add_one/src/lib.rs_ เราจะเพิ่มฟังก์ชัน `add_one` ดังนี้:

<span class="filename">ชื่อไฟล์: add_one/src/lib.rs</span>

```rust,noplayground
{{#rustdoc_include ../listings/ch14-more-about-cargo/no-listing-02-workspace-with-two-crates/add/add_one/src/lib.rs}}
```

ตอนนี้เราสามารถกำหนดให้แพ็กเกจ `adder` ซึ่งเป็นไบนารี พึ่งพาแพ็กเกจ `add_one` ซึ่งเป็นไลบรารีของเราได้แล้ว ก่อนอื่นเราต้องเพิ่มดีเพนเดนซีแบบพาธ (path dependency) ไปยัง `add_one` ในไฟล์ _adder/Cargo.toml_

<span class="filename">ชื่อไฟล์: adder/Cargo.toml</span>

```toml
{{#include ../listings/ch14-more-about-cargo/no-listing-02-workspace-with-two-crates/add/adder/Cargo.toml:6:7}}
```

เนื่องจาก Cargo จะไม่ทึกทักเอาเองว่าเครตในเวิร์กสเปซจะพึ่งพากันเอง เราจึงต้องระบุความสัมพันธ์ของดีเพนเดนซีให้ชัดเจนเสมอ

ถัดไป มาลองเรียกใช้ฟังก์ชัน `add_one` (จากเครต `add_one`) ในเครต `adder` กัน ให้เปิดไฟล์ _adder/src/main.rs_ แล้วแก้ไขฟังก์ชัน `main` ให้เรียกใช้ฟังก์ชัน `add_one` ดังที่แสดงในลิสติ้ง 14-7

<Listing number="14-7" file-name="adder/src/main.rs" caption="การใช้เครตไลบรารี `add_one` จากเครต `adder`">

```rust,ignore
{{#rustdoc_include ../listings/ch14-more-about-cargo/listing-14-07/add/adder/src/main.rs}}
```

</Listing>

มาลองบิลด์เวิร์กสเปซกันโดยรัน `cargo build` ในไดเรกทอรี _add_ ระดับบนสุด!

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

ในการรันเครตไบนารีจากไดเรกทอรี _add_ เราสามารถระบุแพ็กเกจในเวิร์กสเปซที่ต้องการรันได้ โดยส่งอาร์กิวเมนต์ `-p` พร้อมกับชื่อแพ็กเกจให้กับ `cargo run`:

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

คำสั่งนี้จะรันโค้ดใน _adder/src/main.rs_ ซึ่งพึ่งพาเครต `add_one`

<!-- Old headings. Do not remove or links may break. -->

<a id="depending-on-an-external-package-in-a-workspace"></a>

### การพึ่งพาแพ็กเกจภายนอก

โปรดสังเกตว่าเวิร์กสเปซจะมีไฟล์ _Cargo.lock_ เพียงไฟล์เดียวอยู่ที่ระดับบนสุด แทนที่จะมีไฟล์ _Cargo.lock_ แยกในไดเรกทอรีของแต่ละเครต จุดนี้ช่วยรับประกันว่าเครตทั้งหมดจะใช้เวอร์ชันเดียวกันของทุกดีเพนเดนซี หากเราเพิ่มแพ็กเกจ `rand` ลงในไฟล์ _adder/Cargo.toml_ และ _add_one/Cargo.toml_ ทาง Cargo จะรีโซล์ฟ (resolve) ทั้งคู่ให้เป็นเวอร์ชันเดียวกันของ `rand` และบันทึกไว้ใน _Cargo.lock_ เพียงไฟล์เดียว การที่เครตทุกตัวในเวิร์กสเปซใช้ดีเพนเดนซีร่วมกันเช่นนี้ทำให้มั่นใจได้ว่าเครตต่าง ๆ จะทำงานร่วมกันได้อย่างราบรื่นเสมอ มาลองเพิ่มเครต `rand` ลงในเซกชัน `[dependencies]` ของไฟล์ _add_one/Cargo.toml_ เพื่อให้เราเรียกใช้ `rand` ในเครต `add_one` ได้:

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

ตอนนี้เราสามารถเพิ่ม `use rand;` ลงในไฟล์ _add_one/src/lib.rs_ ได้ และเมื่อบิลด์ทั้งเวิร์กสเปซด้วยคำสั่ง `cargo build` ในไดเรกทอรี _add_ Cargo ก็จะดาวน์โหลดและคอมไพล์เครต `rand` เข้ามา เราจะเห็นคำเตือนหนึ่งข้อความเนื่องจากเรายังไม่ได้อ้างอิงถึง `rand` ที่เรานำเข้าสู่สโคป:

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

ตอนนี้ไฟล์ _Cargo.lock_ ระดับบนสุดจะมีข้อมูลที่ดีเพนเดนซี `add_one` พึ่งพา `rand` บันทึกไว้เรียบร้อยแล้ว อย่างไรก็ตาม แม้ว่า `rand` จะถูกนำมาใช้ที่จุดใดจุดหนึ่งในเวิร์กสเปซแล้ว แต่เราก็ยังไม่สามารถเรียกใช้มันในเครตอื่น ๆ ของเวิร์กสเปซได้ เว้นแต่เราจะเพิ่ม `rand` ลงในไฟล์ _Cargo.toml_ ของเครตนั้น ๆ ด้วยเช่นกัน ตัวอย่างเช่น หากเราเพิ่ม `use rand;` ลงในไฟล์ _adder/src/main.rs_ ของแพ็กเกจ `adder` เราจะพบกับข้อผิดพลาด:

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

ในการแก้ไขปัญหานี้ ให้แก้ไขไฟล์ _Cargo.toml_ ของแพ็กเกจ `adder` เพื่อระบุว่า `rand` เป็นหนึ่งในดีเพนเดนซีของมันด้วย การบิลด์แพ็กเกจ `adder` จะเพิ่ม `rand` เข้าไปในรายการดีเพนเดนซีของ `adder` ใน _Cargo.lock_ โดยจะไม่มีการดาวน์โหลดชุดโค้ดของ `rand` ซ้ำซ้อนอีก Cargo จะคอยดูแลให้ทุกเครตในทุกแพ็กเกจของเวิร์กสเปซที่ใช้แพ็กเกจ `rand` ได้ใช้เวอร์ชันเดียวกัน ตราบใดที่พวกมันระบุเวอร์ชันที่เข้ากันได้ ซึ่งช่วยประหยัดพื้นที่จัดเก็บและรับประกันว่าเครตต่าง ๆ ภายในเวิร์กสเปซจะเข้ากันได้เสมอ

หากเครตต่าง ๆ ในเวิร์กสเปซระบุเวอร์ชันที่ไม่สามารถเข้ากันได้ของดีเพนเดนซีตัวเดียวกัน Cargo จะรีโซล์ฟเวอร์ชันของแต่ละตัวแยกกัน แต่ก็จะพยายามรีโซล์ฟให้มีจำนวนเวอร์ชันน้อยที่สุดเท่าที่จะเป็นไปได้

### การเพิ่มเทสต์ให้เวิร์กสเปซ

เพื่อเพิ่มประสิทธิภาพและความสมบูรณ์อีกขั้น มาลองเพิ่มเทสต์สำหรับฟังก์ชัน `add_one::add_one` ภายในเครต `add_one` กัน:

<span class="filename">ชื่อไฟล์: add_one/src/lib.rs</span>

```rust,noplayground
{{#rustdoc_include ../listings/ch14-more-about-cargo/no-listing-04-workspace-with-tests/add/add_one/src/lib.rs}}
```

คราวนี้ลองรัน `cargo test` ในไดเรกทอรี _add_ ระดับบนสุด การรัน `cargo test` ในเวิร์กสเปซที่มีโครงสร้างเช่นนี้จะดำเนินการรันเทสต์ของทุกเครตในเวิร์กสเปซ:

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

เอาต์พุตส่วนแรกแสดงว่าเทสต์ `it_works` ในเครต `add_one` ผ่าน ส่วนถัดมาแสดงว่าไม่พบเทสต์ใด ๆ ในเครต `adder` และส่วนสุดท้ายแสดงว่าไม่พบด็อกเทสต์ (doc-test) ใด ๆ ในเครต `add_one`

นอกจากนี้ เรายังสามารถรันเทสต์เฉพาะเครตที่ต้องการในเวิร์กสเปซจากไดเรกทอรีระดับบนสุดได้ โดยใช้แฟล็ก `-p` แล้วระบุชื่อเครตที่ต้องการทดสอบ:

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

เอาต์พุตนี้แสดงให้เห็นว่า `cargo test` รันเฉพาะเทสต์ของเครต `add_one` เท่านั้น และไม่ได้รันเทสต์ของเครต `adder`

หากคุณต้องการเผยแพร่เครตในเวิร์กสเปซไปยัง [crates.io](https://crates.io/)<!-- ignore --> แต่ละเครตในเวิร์กสเปซจะต้องถูกเผยแพร่แยกจากกัน และเช่นเดียวกับ `cargo test` เราสามารถเผยแพร่เฉพาะเครตใดเครตหนึ่งในเวิร์กสเปซได้โดยใช้แฟล็ก `-p` แล้วตามด้วยชื่อเครตที่ต้องการเผยแพร่

เพื่อเป็นการฝึกฝนเพิ่มเติม ลองเพิ่มเครต `add_two` เข้ามาในเวิร์กสเปซนี้ด้วยวิธีการเดียวกับเครต `add_one` ดูสิ!

เมื่อโปรเจกต์ของคุณเริ่มขยายใหญ่ขึ้น ลองพิจารณาใช้เวิร์กสเปซ เพราะจะช่วยให้คุณทำงานกับคอมโพเนนต์ย่อย ๆ ที่เข้าใจง่ายได้ดีกว่าการรวมเป็นโค้ดก้อนใหญ่เพียงก้อนเดียว นอกจากนี้ การรวมเครตไว้ในเวิร์กสเปซเดียวกันยังช่วยให้การประสานงานและจัดการระหว่างเครตต่าง ๆ ทำได้ง่ายขึ้น โดยเฉพาะอย่างยิ่งหากพวกมันมักจะต้องถูกแก้ไขไปพร้อม ๆ กัน
