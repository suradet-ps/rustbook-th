<!-- Old headings. Do not remove or links may break. -->

<a id="installing-binaries-from-cratesio-with-cargo-install"></a>

## ติดตั้งไบนารีด้วย `cargo install`

คำสั่ง `cargo install` ให้คุณติดตั้งและใช้เครตไบนารี (binary crate) ในเครื่องได้ วิธีนี้ไม่ได้ตั้งใจมาแทนที่แพ็กเกจของระบบ แต่มันเป็นวิธีที่สะดวกสำหรับนักพัฒนา Rust ในการติดตั้งเครื่องมือที่ผู้อื่นแบ่งปันไว้บน [crates.io](https://crates.io/)<!-- ignore --> โปรดสังเกตว่าคุณติดตั้งได้เฉพาะแพ็กเกจที่มีไบนารีทาร์เก็ตเท่านั้น _ไบนารีทาร์เก็ต_ (binary target) คือโปรแกรมที่รันได้ซึ่งถูกสร้างขึ้นหากเครตมีไฟล์ _src/main.rs_ หรือไฟล์อื่นที่ระบุเป็นไบนารี ตรงข้ามกับไลบรารีทาร์เก็ตที่รันด้วยตัวเองไม่ได้แต่เหมาะสำหรับการรวมไว้ในโปรแกรมอื่น โดยปกติแล้ว เครตต่างๆ มีข้อมูลในไฟล์ README ว่าเครตนั้นเป็นไลบรารี มีไบนารีทาร์เก็ต หรือทั้งสองอย่าง

ไบนารีทั้งหมดที่ติดตั้งด้วย `cargo install` จะถูกเก็บไว้ในโฟลเดอร์ _bin_ ของรากการติดตั้ง หากคุณติดตั้ง Rust โดยใช้ _rustup.rs_ และไม่มีการตั้งค่ากำหนดเองใดๆ ไดเรกทอรีนี้จะเป็น *$HOME/.cargo/bin* โปรดตรวจสอบให้แน่ใจว่าไดเรกทอรีนี้อยู่ใน `$PATH` ของคุณ เพื่อให้สามารถรันโปรแกรมที่คุณติดตั้งด้วย `cargo install` ได้

ตัวอย่างเช่น ในบทที่ 12 เราได้กล่าวถึงว่ามีการอิมพลีเมนต์เครื่องมือ `grep` ในภาษา Rust ชื่อ `ripgrep` สำหรับค้นหาไฟล์ ในการติดตั้ง `ripgrep` เราสามารถรันคำสั่งต่อไปนี้:

<!-- manual-regeneration
cargo install something you don't have, copy relevant output below
-->

```console
$ cargo install ripgrep
    Updating crates.io index
  Downloaded ripgrep v14.1.1
  Downloaded 1 crate (213.6 KB) in 0.40s
  Installing ripgrep v14.1.1
--snip--
   Compiling grep v0.3.2
    Finished `release` profile [optimized + debuginfo] target(s) in 6.73s
  Installing ~/.cargo/bin/rg
   Installed package `ripgrep v14.1.1` (executable `rg`)
```

บรรทัดรองสุดท้ายของเอาต์พุตแสดงตำแหน่งและชื่อของไบนารีที่ติดตั้ง ซึ่งในกรณีของ `ripgrep` คือ `rg` ตราบใดที่ไดเรกทอรีการติดตั้งอยู่ใน `$PATH` ของคุณ ดังที่กล่าวถึงก่อนหน้านี้ คุณก็สามารถรัน `rg --help` และเริ่มใช้เครื่องมือที่เร็วกว่าและเป็น Rust มากกว่าสำหรับค้นหาไฟล์ได้!
