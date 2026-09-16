## ภาคผนวก D: เครื่องมือพัฒนาที่มีประโยชน์

ในภาคผนวกนี้ เราจะพูดถึงเครื่องมือพัฒนาที่มีประโยชน์บางอย่างที่โปรเจกต์ Rust จัดเตรียมไว้ให้ เราจะดูการจัดรูปแบบอัตโนมัติ (automatic formatting) วิธีที่รวดเร็วในการนำการแก้ไขคำเตือน (warning) ไปใช้ ลินเตอร์ (linter) และการผสานรวมกับ IDE

### การจัดรูปแบบอัตโนมัติด้วย `rustfmt`

เครื่องมือ `rustfmt` จัดรูปแบบโค้ดของคุณใหม่ตามสไตล์โค้ดของชุมชน หลายโปรเจกต์ที่ทำงานร่วมกันใช้ `rustfmt` เพื่อหลีกเลี่ยงการเถียงกันว่าควรใช้สไตล์ใดเมื่อเขียน Rust: ทุกคนต่างจัดรูปแบบโค้ดของตนด้วยเครื่องมือนี้

การติดตั้ง Rust รวม `rustfmt` มาให้โดยค่าเริ่มต้น ดังนั้นคุณน่าจะมีโปรแกรม `rustfmt` และ `cargo-fmt` อยู่ในระบบแล้ว คำสั่งทั้งสองนี้เทียบเคียงได้กับ `rustc` และ `cargo` ตรงที่ `rustfmt` ให้การควบคุมที่ละเอียดกว่า และ `cargo-fmt` เข้าใจธรรมเนียมของโปรเจกต์ที่ใช้ Cargo หากต้องการจัดรูปแบบโปรเจกต์ Cargo ใดๆ ให้ป้อนคำสั่งต่อไปนี้:

```console
$ cargo fmt
```

การรันคำสั่งนี้จะจัดรูปแบบโค้ด Rust ทั้งหมดในเครต (crate) ปัจจุบันใหม่ สิ่งนี้ควรเปลี่ยนเฉพาะสไตล์ของโค้ด ไม่ใช่ความหมายของโค้ด สำหรับข้อมูลเพิ่มเติมเกี่ยวกับ `rustfmt` โปรดดู[เอกสารประกอบของมัน][rustfmt]

### แก้ไขโค้ดของคุณด้วย `rustfix`

เครื่องมือ `rustfix` รวมอยู่กับการติดตั้ง Rust และสามารถแก้คำเตือนของคอมไพเลอร์ (compiler) ได้โดยอัตโนมัติ เมื่อมีวิธีแก้ไขปัญหาที่ชัดเจนซึ่งน่าจะเป็นสิ่งที่คุณต้องการ คุณคงเคยเห็นคำเตือนของคอมไพเลอร์มาก่อนแล้ว ตัวอย่างเช่น พิจารณาโค้ดนี้:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
fn main() {
    let mut x = 42;
    println!("{x}");
}
```

ในที่นี้ เรากำลังนิยามตัวแปร `x` ว่าเปลี่ยนแปลงได้ (mutable) แต่เราไม่เคยเปลี่ยนแปลงมันจริงๆ Rust จึงเตือนเราเกี่ยวกับเรื่องนี้:

```console
$ cargo build
   Compiling myprogram v0.1.0 (file:///projects/myprogram)
warning: variable does not need to be mutable
 --> src/main.rs:2:9
  |
2 |     let mut x = 0;
  |         ----^
  |         |
  |         help: remove this `mut`
  |
  = note: `#[warn(unused_mut)]` on by default
```

คำเตือนแนะนำให้เราลบคำสงวน `mut` ออก เราสามารถนำคำแนะนำนั้นไปใช้ได้โดยอัตโนมัติด้วยเครื่องมือ `rustfix` โดยการรันคำสั่ง `cargo fix`:

```console
$ cargo fix
    Checking myprogram v0.1.0 (file:///projects/myprogram)
      Fixing src/main.rs (1 fix)
    Finished dev [unoptimized + debuginfo] target(s) in 0.59s
```

เมื่อเราดู _src/main.rs_ อีกครั้ง เราจะเห็นว่า `cargo fix` ได้เปลี่ยนโค้ดไปแล้ว:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
fn main() {
    let x = 42;
    println!("{x}");
}
```

ตัวแปร `x` ตอนนี้เป็นแบบเปลี่ยนแปลงไม่ได้ (immutable) แล้ว และคำเตือนก็ไม่ปรากฏอีกต่อไป

คุณยังสามารถใช้คำสั่ง `cargo fix` เพื่อย้ายโค้ดของคุณระหว่างฉบับ (edition) ต่างๆ ของ Rust ได้ด้วย ฉบับของ Rust มีอธิบายไว้ใน[ภาคผนวก E][editions]<!-- ignore -->

### ลินต์เพิ่มเติมด้วย Clippy

เครื่องมือ Clippy เป็นชุดรวมของลินต์ (lint) ที่ใช้วิเคราะห์โค้ดของคุณ เพื่อให้คุณจับข้อผิดพลาดที่พบบ่อยและปรับปรุงโค้ด Rust ของคุณได้ Clippy รวมอยู่กับการติดตั้ง Rust มาตรฐาน

หากต้องการรันลินต์ของ Clippy บนโปรเจกต์ Cargo ใดๆ ให้ป้อนคำสั่งต่อไปนี้:

```console
$ cargo clippy
```

ตัวอย่างเช่น สมมติว่าคุณเขียนโปรแกรมที่ใช้ค่าประมาณของค่าคงตัวทางคณิตศาสตร์ เช่น พาย (pi) ดังที่โปรแกรมนี้ทำ:

<Listing file-name="src/main.rs">

```rust
fn main() {
    let x = 3.1415;
    let r = 8.0;
    println!("the area of the circle is {}", x * r * r);
}
```

</Listing>

การรัน `cargo clippy` บนโปรเจกต์นี้ให้ผลลัพธ์เป็นข้อผิดพลาดนี้:

```text
error: approximate value of `f{32, 64}::consts::PI` found
 --> src/main.rs:2:13
  |
2 |     let x = 3.1415;
  |             ^^^^^^
  |
  = note: `#[deny(clippy::approx_constant)]` on by default
  = help: consider using the constant directly
  = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#approx_constant
```

ข้อผิดพลาดนี้บอกให้คุณรู้ว่า Rust มีการนิยามค่าคงตัว `PI` ที่แม่นยำกว่าอยู่แล้ว และโปรแกรมของคุณจะถูกต้องมากกว่าหากคุณใช้ค่าคงตัวนั้นแทน จากนั้นคุณก็จะเปลี่ยนโค้ดของคุณให้ใช้ค่าคงตัว `PI`

โค้ดต่อไปนี้ไม่ก่อให้เกิดข้อผิดพลาดหรือคำเตือนใดๆ จาก Clippy:

<Listing file-name="src/main.rs">

```rust
fn main() {
    let x = std::f64::consts::PI;
    let r = 8.0;
    println!("the area of the circle is {}", x * r * r);
}
```

</Listing>

สำหรับข้อมูลเพิ่มเติมเกี่ยวกับ Clippy โปรดดู[เอกสารประกอบของมัน][clippy]

### การผสานรวมกับ IDE ด้วย `rust-analyzer`

เพื่อช่วยเรื่องการผสานรวมกับ IDE ชุมชน Rust แนะนำให้ใช้ [`rust-analyzer`][rust-analyzer]<!-- ignore --> เครื่องมือนี้เป็นชุดยูทิลิตี้ที่เน้นคอมไพเลอร์และใช้ [Language Server Protocol][lsp]<!-- ignore --> ในการสื่อสาร ซึ่งเป็นข้อกำหนดสำหรับ IDE และภาษาโปรแกรมต่างๆ ในการสื่อสารระหว่างกัน ไคลเอนต์ที่แตกต่างกันสามารถใช้ `rust-analyzer` ได้ เช่น [ปลั๊กอิน Rust analyzer สำหรับ Visual Studio Code][vscode]

เยี่ยมชม[หน้าหลัก][rust-analyzer]<!-- ignore -->ของโปรเจกต์ `rust-analyzer` สำหรับคำแนะนำในการติดตั้ง จากนั้นติดตั้งการรองรับ language server ใน IDE ที่คุณใช้ IDE ของคุณจะได้ความสามารถเพิ่มเติม เช่น การเติมโค้ดอัตโนมัติ (autocompletion) การกระโดดไปยังนิยาม (jump to definition) และข้อผิดพลาดแบบอินไลน์ (inline errors)

[rustfmt]: https://github.com/rust-lang/rustfmt
[editions]: appendix-05-editions.md
[clippy]: https://github.com/rust-lang/rust-clippy
[rust-analyzer]: https://rust-analyzer.github.io
[lsp]: http://langserver.org/
[vscode]: https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer
