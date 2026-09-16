# พจนานุกรมศัพท์ (Glossary) — The Rust Programming Language ฉบับภาษาไทย

ตารางนี้รวบรวมคำศัพท์เชิงเทคนิคและแนวทางการแปลที่ใช้อย่างสม่ำเสมอตลอดทั้งเล่ม เพื่อให้การแปลทุกบทมีความถูกต้อง ลื่นไหล และเป็นธรรมชาติสำหรับนักพัฒนาซอฟต์แวร์ชาวไทย

| ศัพท์ต้นฉบับ | คำแปลไทย | หมายเหตุ |
|---|---|---|
| The Rust Programming Language | ภาษาการเขียนโปรแกรม Rust (The Rust Programming Language) | ชื่อหนังสือ คงชื่อภาษาอังกฤษไว้เมื่ออ้างถึงเล่ม |
| chapter | บท (บทที่ n) | |
| section | หัวข้อ | |
| appendix | ภาคผนวก | |
| foreword | คำนิยม | |
| introduction | บทนำ | |
| listing | ลิสติ้ง (listing) | บล็อกโค้ดตัวอย่างที่มีหมายเลขกำกับ (เช่น ลิสติ้ง 2-1) |
| example | ตัวอย่าง | |
| figure | รูป (figure) | |
| keyword | คำสงวน (keyword) | |
| identifier | ชื่อเรียก (identifier) | ชื่อของตัวแปร ฟังก์ชัน ฯลฯ |
| operator | ตัวดำเนินการ (operator) | |
| symbol | สัญลักษณ์ (symbol) | |
| syntax | วากยสัมพันธ์ (syntax) | โครงสร้างการเขียนโค้ด |
| variable | ตัวแปร | |
| binding | การผูกค่า (binding) | เช่น `let x = 5;` |
| shadowing | การบังเงา (shadowing) | การประกาศตัวแปรชื่อเดิมซ้ำเพื่อบังค่าเดิม |
| mutability | ความสามารถในการเปลี่ยนแปลงค่า (mutability) | |
| mutable | เปลี่ยนแปลงได้ (mutable) | คง `mut` ในโค้ด |
| immutable | เปลี่ยนแปลงไม่ได้ (immutable) | |
| statement | สเตตเมนต์ (statement) | คำสั่งที่ไม่คืนค่า |
| expression | เอ็กซ์เพรสชัน (expression) | นิพจน์ที่ประเมินค่าแล้วได้ผลลัพธ์ |
| data type | ชนิดข้อมูล (data type) | |
| scalar type | ชนิดสเกลาร์ (scalar type) | |
| compound type | ชนิดคอมพาวด์ (compound type) | |
| integer | จำนวนเต็ม (integer) | |
| floating-point number | จำนวนทศนิยม (floating-point number) | |
| boolean | บูลีน (boolean) | |
| character | อักขระ (character) | |
| tuple | ทูเพิล (tuple) | |
| array | อาร์เรย์ (array) | |
| type annotation | การระบุชนิดข้อมูล (type annotation) | |
| type inference | การอนุมานชนิดข้อมูล (type inference) | |
| overflow | การล้น (overflow) | |
| function | ฟังก์ชัน (function) | |
| parameter | พารามิเตอร์ (parameter) | |
| argument | อาร์กิวเมนต์ (argument) | |
| return value | ค่าที่คืนกลับ (return value) | |
| body | บอดี้ / เนื้อใน (body) | ส่วนเนื้อในของฟังก์ชันหรือบล็อก |
| block | บล็อก (block) | |
| comment | คอมเมนต์ (comment) | |
| control flow | การควบคุมโฟลว์ (control flow) | |
| condition | เงื่อนไข (condition) | |
| loop | ลูป (loop) | |
| iteration | การวนซ้ำ (iteration) | |
| branch | กิ่ง (branch) | ทางการทำงานที่แยกออกไป |
| arm | อาร์ม (arm) | แต่ละกรณีของ `match` |
| ownership | ความเป็นเจ้าของ (ownership) | |
| owner | เจ้าของ (owner) | |
| borrowing | การยืม (borrowing) | |
| borrow checker | ตัวตรวจการยืม (borrow checker) | |
| move | การย้ายค่า (move) | |
| copy | การคัดลอกค่า (copy) | |
| clone | การโคลน (clone) | |
| drop | การทิ้งค่า (drop) | |
| reference | เรเฟอเรนซ์ (reference) | |
| dereference | การดีเรเฟอเรนซ์ (dereference) | |
| mutable reference | เรเฟอเรนซ์แบบเปลี่ยนแปลงได้ (mutable reference) | |
| dangling reference | เรเฟอเรนซ์ที่ชี้ไปยังหน่วยความจำที่ถูกคืนแล้ว (dangling reference) | |
| slice | สไลซ์ (slice) | |
| string slice | สตริงสไลซ์ (string slice) | |
| string literal | สตริงลิเทอรัล (string literal) | |
| struct | struct (คงชื่อเดิม) | คำสงวนของภาษา Rust |
| field | ฟิลด์ (field) | |
| method | เมธอด (method) | |
| implementation (impl) | การอิมพลีเมนต์ (implementation) | คง `impl` ในโค้ด |
| associated function | ฟังก์ชันที่เชื่อมโยงกับชนิดข้อมูล (associated function) | |
| enum | enum (คงชื่อเดิม) | คำสงวนของภาษา Rust |
| variant | วาเรียนต์ (variant) | ตัวเลือกย่อยของ enum |
| pattern | แพตเทิร์น (pattern) | |
| pattern matching | การจับคู่แพตเทิร์น (pattern matching) | |
| refutable pattern | แพตเทิร์นที่อาจจับคู่ไม่สำเร็จ (refutable pattern) | |
| irrefutable pattern | แพตเทิร์นที่จับคู่สำเร็จเสมอ (irrefutable pattern) | |
| destructuring | การแยกโครงสร้างข้อมูล (destructuring) | |
| module | มอดูล (module) | |
| package | แพ็กเกจ (package) | |
| crate | เครต (crate) | |
| binary crate | เครตไบนารี (binary crate) | |
| library crate | เครตไลบรารี (library crate) | |
| path | พาธ (path) | เส้นทางอ้างอิงรายการในมอดูล |
| scope | สโคป (scope) | |
| privacy | ความเป็นส่วนตัว (privacy) | |
| public | แบบสาธารณะ (public) | คง `pub` ในโค้ด |
| private | แบบส่วนตัว (private) | |
| prelude | พรีลูด (prelude) | ชุดรายการที่ถูกนำเข้าสโคปให้อัตโนมัติ |
| collection | คอลเลกชัน (collection) | |
| vector | เวกเตอร์ (vector) | |
| string | สตริง (string) | |
| hash map | แฮชแมป (hash map) | |
| key | คีย์ (key) | |
| value | ค่า (value) | |
| error handling | การจัดการข้อผิดพลาด (error handling) | |
| recoverable error | ข้อผิดพลาดที่กู้คืนได้ (recoverable error) | |
| unrecoverable error | ข้อผิดพลาดที่กู้คืนไม่ได้ (unrecoverable error) | |
| panic | การแพนิก (panic) | |
| generic | เจเนอริก (generic) | |
| type parameter | พารามิเตอร์ชนิดข้อมูล (type parameter) | |
| trait | เทรต (trait) | |
| trait bound | บาวด์ของเทรต (trait bound) | |
| bound | บาวด์ (bound) | ข้อกำหนดว่าชนิดข้อมูลต้องมีคุณสมบัติใด |
| default method | เมธอดที่มีค่าเริ่มต้น (default method) | |
| lifetime | ไลฟ์ไทม์ (lifetime) | ช่วงอายุของข้อมูลในหน่วยความจำ |
| lifetime annotation | การระบุไลฟ์ไทม์ (lifetime annotation) | |
| lifetime elision | การละไลฟ์ไทม์ (lifetime elision) | |
| test | เทสต์ / การทดสอบ (test) | |
| unit test | การทดสอบระดับยูนิต (unit test) | |
| integration test | การทดสอบแบบอินทิเกรชัน (integration test) | |
| test harness | ตัวรันทดสอบ (test harness) | |
| test runner | ตัวรันทดสอบ (test runner) | |
| assertion | แอสเซอร์ชัน (assertion) | การตรวจสอบเงื่อนไขในโค้ด |
| assertion macro | มาโครแอสเซอร์ชัน (assertion macro) | |
| should panic | ควรแพนิก (should panic) | คง `should_panic` ในโค้ด |
| ignore | ข้าม (ignore) | คง `ignore` ในโค้ด |
| closure | โคลเชอร์ (closure) | |
| iterator | อิเทอเรเตอร์ (iterator) | |
| iterator adaptor | ตัวปรับอิเทอเรเตอร์ (iterator adaptor) | |
| consuming adaptor | ตัวปรับแบบบริโภคค่า (consuming adaptor) | |
| lazy evaluation | การประเมินค่าแบบเลซี่ (lazy evaluation) | |
| smart pointer | สมาร์ตพอยน์เตอร์ (smart pointer) | |
| heap | ฮีป (heap) | หน่วยความจำฮีป |
| stack | สแตก (stack) | หน่วยความจำสแตก |
| deref coercion | การบังคับดีเรฟ (deref coercion) | |
| reference counting | การนับจำนวนเรเฟอเรนซ์ (reference counting) | |
| interior mutability | การเปลี่ยนแปลงค่าภายใน (interior mutability) | |
| memory leak | การรั่วไหลของหน่วยความจำ (memory leak) | |
| reference cycle | วงจรเรเฟอเรนซ์ (reference cycle) | |
| concurrency | การทำงานพร้อมกัน (concurrency) | |
| parallelism | การทำงานขนาน (parallelism) | |
| thread | เธรด (thread) | |
| message passing | การส่งผ่านข้อความ (message passing) | |
| channel | แชนเนล (channel) | |
| shared state | สถานะที่ใช้ร่วมกัน (shared state) | |
| mutex | มิวเท็กซ์ (mutex) | |
| atomic | อะตอมมิก (atomic) | |
| deadlock | เดดล็อก (deadlock) | |
| asynchronous programming | การเขียนโปรแกรมแบบอะซิงโครนัส (asynchronous programming) | |
| future | ฟิวเจอร์ (future) | |
| task | ทาสก์ (task) | |
| stream | สตรีม (stream) | |
| runtime | รันไทม์ (runtime) | |
| executor | เอ็กซ์ซีกูเตอร์ (executor) | |
| polling | การโพลล์ (polling) | |
| reactor | รีแอกเตอร์ (reactor) | ตัวขับเคลื่อนอนาคต/สตรีมในบทที่ 17 |
| object-oriented programming | การเขียนโปรแกรมเชิงวัตถุ (object-oriented programming) | |
| trait object | เทรตออบเจกต์ (trait object) | |
| dynamic dispatch | การดิสแพตช์แบบไดนามิก (dynamic dispatch) | |
| static dispatch | การดิสแพตช์แบบสแตติก (static dispatch) | |
| state pattern | แพตเทิร์นสถานะ (state pattern) | |
| unsafe | unsafe (คงชื่อเดิม) | คำสงวนของภาษา Rust |
| raw pointer | พอยน์เตอร์ดิบ (raw pointer) | |
| undefined behavior | พฤติกรรมที่ไม่ได้นิยามไว้ (undefined behavior) | |
| foreign function interface (FFI) | ส่วนติดต่อกับภาษาอื่น (foreign function interface หรือ FFI) | |
| macro | มาโคร (macro) | |
| declarative macro | มาโครแบบประกาศ (declarative macro) | |
| procedural macro | มาโครแบบโพรซีเยอร์ (procedural macro) | |
| attribute | แอตทริบิวต์ (attribute) | |
| derive | derive (คงชื่อเดิม) | |
| edition | ฉบับ (edition) | เช่น Rust ฉบับ 2024 |
| nightly Rust | nightly Rust | ช่องทางปล่อยรุ่นทดลองของ Rust |
| stable | เสถียร (stable) | |
| unstable feature | ฟีเจอร์ที่ยังไม่เสถียร (unstable feature) | |
| compiler | คอมไพเลอร์ (compiler) | |
| warning | คำเตือน (warning) | |
| error message | ข้อความแสดงข้อผิดพลาด (error message) | |
| compile | คอมไพล์ (compile) | |
| build | บิลด์ (build) | |
| toolchain | ทูลเชน (toolchain) | |
| dependency | ดีเพนเดนซี (dependency) | |
| package manager | ตัวจัดการแพ็กเกจ (package manager) | |
| workspace | เวิร์กสเปซ (workspace) | |
| release profile | โปรไฟล์การรีลีส (release profile) | |
| semantic versioning | การกำหนดเวอร์ชันเชิงความหมาย (semantic versioning) | |
| executable | ไฟล์รันได้ (executable) | |
| source file | ไฟล์ซอร์ส (source file) | |
| command line | บรรทัดคำสั่ง (command line) | |
| terminal | เทอร์มินัล (terminal) | |
| directory | ไดเรกทอรี (directory) | |
| project | โปรเจกต์ (project) | |
| web server | เว็บเซิร์ฟเวอร์ (web server) | |

## หลักการทั่วไป

- **ชื่อทางเทคนิค**: ชื่อเครื่องมือ (เช่น `cargo`, `rustc`, `rustfmt`, `clippy`), คำสั่ง CLI, ตัวเลือก (flag), ชื่อเครต/เทรต/ฟังก์ชัน/ชนิดข้อมูล/มาโคร (เช่น `Result`, `Option`, `Vec`, `String`, `println!`, `#[derive(Debug)]`) และ URL **ไม่แปล** รวมถึงคำสงวนของภาษา Rust ทุกคำ (`fn`, `let`, `mut`, `impl`, `match`, `async`, `await`, `unsafe` ฯลฯ)
- **คำศัพท์เทคนิค**: ในการปรากฏครั้งแรกของแต่ละไฟล์ ให้เขียนคำแปลไทยตามด้วยคำอังกฤษในวงเล็บ เช่น "ความเป็นเจ้าของ (ownership)" หลังจากนั้นใช้คำไทยเดี่ยวได้ แต่ต้องสอดคล้องกับพจนานุกรมนี้เสมอ
- **โค้ดทุกบล็อก (` ```...``` `)**: ต้องคงไว้ตามต้นฉบับภาษาอังกฤษทุกตัวอักษร (byte-identical) รวมถึงคอมเมนต์ การเว้นวรรค และคำสั่ง `{{#include ...}}`, `{{#rustdoc_include ...}}`, `{{#playground ...}}` ทั้งหมด
- **โค้ดแบบอินไลน์ (`` `...` ``)**: ไม่แปล รวมถึงชื่อไฟล์และเส้นทางไฟล์ เช่น `main.rs`, `src/main.rs`, `Cargo.toml`
- **ลิงก์ (Links)**: ทั้ง inline links, reference links และ autolinks ต้องชี้ไปยัง target เดิมเสมอ (URL ไม่แปล) แปลได้เฉพาะข้อความที่แสดง และ anchor ภายในเล่มต้องตรวจสอบกับ HTML ที่ mdbook build แล้วด้วย `scripts/check-links.ps1`
- **แท็ก `<Listing ...>`**: คงแอตทริบิวต์ `number` และ `file-name` ไว้ตามเดิม แปลเฉพาะข้อความใน `caption="..."` (โดยรักษาเครื่องหมาย markdown เช่น `*...*` และ `` `...` `` ไว้)
- **HTML และคอมเมนต์**: คง `<span id="...">`, `<a id="...">`, คอมเมนต์ `<!-- ... -->` และแท็ก HTML อื่นๆ ไว้ทุกตัวอักษร
- **หัวข้อ (Headings)**: แปลเป็นไทยอย่างเป็นธรรมชาติและกระชับ โดยคงระดับหัวข้อ (`#`, `##`, ...) ให้ตรงกับต้นฉบับทุกประการ และคงชื่อ API/ชนิดข้อมูลในหัวข้อไว้ตามเดิม
- **ตาราง (Tables)**: แปลหัวตารางและเนื้อหาในเซลล์ แต่คงโค้ดและลิงก์ในเซลล์ไว้ตามเดิม
- **การอ้างถึงบท**: ใช้ "บทที่ n" เช่น "บทที่ 4" และอ้างถึงลิสติ้งว่า "ลิสติ้ง 2-1"
- **โทนภาษา**: ใช้สรรพนาม "คุณ" แทนผู้อ่าน และ "เรา" แทนผู้เขียน หลีกเลี่ยงภาษาพูด ใช้ศัพท์เทคนิคให้แม่นยำตามพจนานุกรมนี้
- **Anchor ของลิงก์ภายในเล่ม**: mdbook จะตัดสระ/วรรณยุกต์ไทยออกจาก slug อัตโนมัติ จึงต้องอ่าน anchor จาก HTML ที่ build แล้วเท่านั้น ห้ามเดา และต้องรัน `scripts/check-links.ps1` ทุกครั้งหลัง build
