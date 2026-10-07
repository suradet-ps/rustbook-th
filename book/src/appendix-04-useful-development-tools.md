## ภาคผนวก D: เครื่องมือพัฒนาที่มีประโยชน์

ในภาคผนวกนี้ เราจะพูดถึงเครื่องมือพัฒนาที่เป็นประโยชน์ซึ่งโปรเจกต์ Rust มีมาให้พร้อมใช้งาน เราจะได้เรียนรู้เกี่ยวกับการจัดรูปแบบโค้ดอัตโนมัติ (automatic formatting), วิธีแก้ไขคำเตือนของคอมไพเลอร์อย่างรวดเร็ว, เครื่องมือตรวจสอบคุณภาพโค้ด (linter) และการเชื่อมต่อทำงานร่วมกับโปรแกรม IDE

### การจัดรูปแบบอัตโนมัติด้วย `rustfmt`

เครื่องมือ `rustfmt` จะจัดรูปแบบโค้ดของคุณใหม่ตามมาตรฐานรูปแบบโค้ดที่เป็นสากลของชุมชนนักพัฒนา Rust โปรเจกต์ที่ต้องทำงานร่วมกันหลายคนมักนำ `rustfmt` มาใช้เพื่อป้องกันการถกเถียงเรื่องรูปแบบการเขียนโค้ด โดยให้ทุกคนจัดรูปแบบโค้ดด้วยเครื่องมือตัวนี้เหมือนกันทั้งหมด

ชุดติดตั้งของ Rust จะรวม `rustfmt` มาให้เป็นค่าเริ่มต้นอยู่แล้ว ดังนั้นคุณจึงควรมีโปรแกรม `rustfmt` และ `cargo-fmt` อยู่ในระบบของคุณเรียบร้อยแล้ว โดยคำสั่งทั้งสองนี้มีความสัมพันธ์กันคล้ายกับ `rustc` และ `cargo` กล่าวคือ `rustfmt` จะให้การควบคุมที่ละเอียดยิบย่อยกว่า ส่วน `cargo-fmt` จะเข้าใจแบบแผนโครงสร้างของโปรเจกต์ที่จัดการด้วย Cargo หากต้องการจัดรูปแบบโค้ดของโปรเจกต์ Cargo ใด ๆ ให้พิมพ์คำสั่งต่อไปนี้:

```console
$ cargo fmt
```

การรันคำสั่งนี้จะจัดรูปแบบโค้ด Rust ทั้งหมดในเครตปัจจุบันใหม่ โดยจะเปลี่ยนเฉพาะรูปแบบการจัดวางโค้ดเท่านั้น ไม่ได้เปลี่ยนแปลงความหมายหรือพฤติกรรมการทำงานของโค้ด สามารถดูข้อมูลเพิ่มเติมเกี่ยวกับ `rustfmt` ได้ใน[เอกสารประกอบอย่างเป็นทางการ][rustfmt]

### แก้ไขโค้ดของคุณด้วย `rustfix`

เครื่องมือ `rustfix` รวมมาพร้อมกับการติดตั้ง Rust และสามารถแก้ไขคำเตือนของคอมไพเลอร์ (compiler warnings) ได้โดยอัตโนมัติ เมื่อมีแนวทางแก้ไขปัญหาที่ชัดเจนซึ่งตรงกับสิ่งที่คุณต้องการ คุณน่าจะเคยเห็นคำเตือนของคอมไพเลอร์กันมาบ้างแล้ว ตัวอย่างเช่น พิจารณาโค้ดต่อไปนี้:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
fn main() {
    let mut x = 42;
    println!("{x}");
}
```

ในที่นี้ เราประกาศตัวแปร `x` ให้เปลี่ยนแปลงค่าได้ (mutable) ทว่าในความเป็นจริงเราไม่เคยแก้ไขค่าของมันเลย Rust จึงแจ้งเตือนเราเกี่ยวกับเรื่องนี้:

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

คำเตือนแนะนำให้เราลบคีย์เวิร์ด `mut` ออก เราสามารถนำคำแนะนำดังกล่าวมาปรับใช้กับโค้ดได้โดยอัตโนมัติผ่านเครื่องมือ `rustfix` ด้วยการรันคำสั่ง `cargo fix`:

```console
$ cargo fix
    Checking myprogram v0.1.0 (file:///projects/myprogram)
      Fixing src/main.rs (1 fix)
    Finished dev [unoptimized + debuginfo] target(s) in 0.59s
```

เมื่อเราเปิดดูไฟล์ _src/main.rs_ อีกครั้ง จะพบว่า `cargo fix` ได้แก้ไขโค้ดให้เราเรียบร้อยแล้ว:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
fn main() {
    let x = 42;
    println!("{x}");
}
```

ตอนนี้ตัวแปร `x` กลายเป็นแบบเปลี่ยนแปลงค่าไม่ได้ (immutable) และข้อความแจ้งเตือนก็หายไปแล้ว

นอกจากนี้ คุณยังสามารถใช้คำสั่ง `cargo fix` ในการแปลงย้ายโค้ดของคุณข้ามระหว่างฉบับ (editions) ต่าง ๆ ของ Rust ได้อีกด้วย โดยสามารถอ่านรายละเอียดเรื่องฉบับของ Rust ได้ใน[ภาคผนวก E][editions]<!-- ignore -->

### ลินต์เพิ่มเติมด้วย Clippy

เครื่องมือ Clippy เป็นชุดเครื่องมือตรวจสอบโค้ด (linter) ที่ช่วยวิเคราะห์โค้ดของคุณ เพื่อให้คุณสามารถตรวจจับข้อผิดพลาดที่พบบ่อยและปรับปรุงโค้ด Rust ของคุณให้มีคุณภาพดียิ่งขึ้น โดย Clippy ถูกรวมมาพร้อมกับชุดติดตั้งมาตรฐานของ Rust แล้ว

หากต้องการรันการตรวจสอบของ Clippy บนโปรเจกต์ Cargo ใด ๆ ให้พิมพ์คำสั่งต่อไปนี้:

```console
$ cargo clippy
```

ตัวอย่างเช่น สมมติว่าคุณเขียนโปรแกรมที่ใช้ค่าประมาณของค่าคงตัวทางคณิตศาสตร์อย่างค่าพาย (pi) ดังเช่นในโค้ดนี้:

<Listing file-name="src/main.rs">

```rust
fn main() {
    let x = 3.1415;
    let r = 8.0;
    println!("the area of the circle is {}", x * r * r);
}
```

</Listing>

เมื่อรันคำสั่ง `cargo clippy` บนโปรเจกต์นี้ จะได้ผลลัพธ์เป็นข้อความเตือนดังนี้:

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

ข้อความนี้ชี้แจงให้คุณทราบว่า ภาษา Rust มีการนิยามค่าคงตัว `PI` ที่มีความแม่นยำสูงกว่าเตรียมไว้ให้อยู่แล้ว และโปรแกรมของคุณจะมีความถูกต้องแม่นยำยิ่งขึ้นหากเปลี่ยนมาใช้ค่าคงตัวดังกล่าวแทน จากนั้นคุณก็สามารถแก้ไขโค้ดเพื่อเรียกใช้ค่าคงตัว `PI` ได้โดยตรง

โค้ดต่อไปนี้จะไม่ทำให้เกิดข้อผิดพลาดหรือคำเตือนใด ๆ จาก Clippy อีก:

<Listing file-name="src/main.rs">

```rust
fn main() {
    let x = std::f64::consts::PI;
    let r = 8.0;
    println!("the area of the circle is {}", x * r * r);
}
```

</Listing>

สามารถดูข้อมูลเพิ่มเติมเกี่ยวกับ Clippy ได้ใน[เอกสารประกอบอย่างเป็นทางการ][clippy]

### การผสานรวมกับ IDE ด้วย `rust-analyzer`

สำหรับการทำงานร่วมกับโปรแกรม IDE ทางชุมชน Rust แนะนำให้ใช้ [`rust-analyzer`][rust-analyzer]<!-- ignore --> ซึ่งเป็นชุดเครื่องมือที่ทำงานประสานกับคอมไพเลอร์และสื่อสารผ่าน [Language Server Protocol][lsp]<!-- ignore --> อันเป็นข้อกำหนดมาตรฐานสำหรับการติดต่อสื่อสารระหว่างโปรแกรม IDE กับภาษาโปรแกรมต่าง ๆ โดยมีโปรแกรมแก้ไขโค้ดหลากหลายตัวที่รองรับการใช้งาน `rust-analyzer` เช่น [ปลั๊กอิน Rust analyzer สำหรับ Visual Studio Code][vscode]

สามารถเข้าไปดูคำแนะนำในการติดตั้งได้ที่[หน้าแรก][rust-analyzer]<!-- ignore --> ของโปรเจกต์ `rust-analyzer` จากนั้นให้ติดตั้งส่วนขยาย language server ลงใน IDE ที่คุณใช้งาน ซึ่งจะช่วยให้ IDE ของคุณมีความสามารถขั้นสูงต่าง ๆ เพิ่มขึ้นมา เช่น การเติมเต็มโค้ดอัตโนมัติ (autocompletion), การกระโดดไปยังจุดนิยามโค้ด (jump to definition) และการแสดงข้อความแจ้งเตือนข้อผิดพลาดแทรกในบรรทัดโค้ด (inline errors)

[rustfmt]: https://github.com/rust-lang/rustfmt
[editions]: appendix-05-editions.md
[clippy]: https://github.com/rust-lang/rust-clippy
[rust-analyzer]: https://rust-analyzer.github.io
[lsp]: http://langserver.org/
[vscode]: https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer
