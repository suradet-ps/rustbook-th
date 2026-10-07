# พจนานุกรมศัพท์ (Glossary) — The Rust Programming Language ฉบับภาษาไทย

ตารางนี้รวบรวมคำศัพท์เชิงเทคนิคและแนวทางการแปลที่ใช้อย่างสม่ำเสมอตลอดทั้งเล่ม เพื่อให้การแปลทุกบทมีความถูกต้อง ลื่นไหล และเป็นธรรมชาติสำหรับนักพัฒนาซอฟต์แวร์ชาวไทย

| ศัพท์ต้นฉบับ | คำแปลไทย | หมายเหตุ |
|---|---|---|
| The Rust Programming Language | ภาษาโปรแกรม Rust (The Rust Programming Language) | ชื่อหนังสือ คงชื่อภาษาอังกฤษไว้เมื่ออ้างถึงเล่ม |
| chapter | บท (บทที่ n) | |
| section | หัวข้อ | |
| appendix | ภาคผนวก | |
| foreword | คำนิยม | |
| introduction | บทนำ | |
| listing | ลิสติ้ง (listing) | บล็อกโค้ดตัวอย่างที่มีหมายเลขกำกับ (เช่น ลิสติ้ง 2-1) |
| example | ตัวอย่าง | |
| figure | รูป (figure) | |
| keyword | คำสงวน (keyword) | |
| identifier | ชื่อเรียก / ตัวระบุ (identifier) | ชื่อของตัวแปร ฟังก์ชัน ฯลฯ |
| operator | ตัวดำเนินการ (operator) | |
| symbol | สัญลักษณ์ (symbol) | |
| logic | ตรรกะ (logic) | ใช้ "ตรรกะ" ทั้งเล่ม (ไม่ใช้ "ลอจิก" หรือ "โลจิก") |
| syntax | ไวยากรณ์ (syntax) | โครงสร้างและกฎการเขียนโค้ด (เข้าใจง่าย เป็นธรรมชาติกว่า "วากยสัมพันธ์") |
| variable | ตัวแปร | |
| binding | การผูกค่า (binding) | เช่น `let x = 5;` |
| shadowing | การบดบังค่า / ตัวแปร (shadowing) | การประกาศตัวแปรชื่อเดิมซ้ำเพื่อบดบังตัวแปรเดิมในสโคป |
| mutability | ความสามารถในการเปลี่ยนแปลงค่า (mutability) | |
| mutable | เปลี่ยนแปลงได้ (mutable) | คง `mut` ในโค้ด |
| immutable | เปลี่ยนแปลงไม่ได้ (immutable) | |
| statement | สเตตเมนต์ / คำสั่ง (statement) | คำสั่งที่ไม่คืนค่า |
| expression | นิพจน์ (expression) | นิพจน์ที่ประเมินค่าแล้วได้ผลลัพธ์ (ใช้ "นิพจน์" แทน "เอ็กซ์เพรสชัน") |
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
| return value | ค่าที่ส่งกลับ / ค่าคืนกลับ (return value) | |
| body | บล็อกเนื้อหา / บอดี้ (body) | ส่วนเนื้อหาของฟังก์ชันหรือบล็อก |
| block | บล็อก (block) | |
| comment | คอมเมนต์ (comment) | |
| control flow | ลำดับการทำงานของโปรแกรม / การควบคุมโฟลว์ (control flow) | |
| condition | เงื่อนไข (condition) | |
| loop | ลูป (loop) | |
| iteration | การวนซ้ำ (iteration) | |
| branch | กิ่งเงื่อนไข / สาขา (branch) | ทางการทำงานที่แยกออกไป |
| arm | กิ่งกรณี / อาร์ม (arm) | แต่ละกรณีของ `match` |
| ownership | สิทธิ์ความเป็นเจ้าของ / ความเป็นเจ้าของ (ownership) | กฎการจัดการหน่วยความจำหลักของ Rust |
| owner | เจ้าของ (owner) | ตัวแปรหรือสโคปที่ถือครองค่านั้น (ระวัง: ไม่ใช้คำว่า "คนเดียว" กับค่าข้อมูล) |
| borrowing | การยืม (borrowing) | |
| borrow checker | ระบบตรวจสอบการยืม / ตัวตรวจการยืม (borrow checker) | |
| move | การย้ายค่า / การย้ายสิทธิ์ความเป็นเจ้าของ (move) | |
| copy | การคัดลอกค่า (copy) | |
| clone | การโคลน (clone) | |
| drop | การทิ้งค่า / การคืนหน่วยความจำ (drop) | |
| reference | เรเฟอเรนซ์ (reference) | |
| dereference | การดีเรเฟอเรนซ์ (dereference) | |
| mutable reference | เรเฟอเรนซ์แบบเปลี่ยนแปลงได้ (mutable reference) | |
| dangling reference | เรเฟอเรนซ์ค้าง / เรเฟอเรนซ์ชี้ตำแหน่งว่างเปล่า (dangling reference) | เรเฟอเรนซ์ที่ชี้ไปยังหน่วยความจำที่ถูกคืนไปแล้ว |
| slice | สไลซ์ (slice) | |
| string slice | สตริงสไลซ์ (string slice) | |
| string literal | สตริงลิเทอรัล (string literal) | |
| struct | struct (คงชื่อเดิม) | คำสงวนของภาษา Rust |
| field | ฟิลด์ (field) | |
| method | เมธอด (method) | |
| implementation (impl) | การอิมพลีเมนต์ (implementation) | คง `impl` ในโค้ด |
| associated function | ฟังก์ชันประจำชนิดข้อมูล / แอสโซซิเอตเต็ดฟังก์ชัน (associated function) | ฟังก์ชันที่ผูกกับไทป์โดยไม่รับ `self` |
| enum | enum (คงชื่อเดิม) | คำสงวนของภาษา Rust |
| variant | วาเรียนต์ (variant) | ตัวเลือกย่อยของ enum |
| pattern | รูปแบบ / แพตเทิร์น (pattern) | |
| pattern matching | การจับคู่รูปแบบ / แพตเทิร์น (pattern matching) | |
| refutable pattern | แพตเทิร์นที่อาจไม่ตรงเงื่อนไข (refutable pattern) | แพตเทิร์นที่อาจจับคู่ไม่สำเร็จ |
| irrefutable pattern | แพตเทิร์นที่ตรงเงื่อนไขเสมอ (irrefutable pattern) | แพตเทิร์นที่จับคู่สำเร็จเสมอ |
| destructuring | การแยกโครงสร้างข้อมูล (destructuring) | |
| module | มอดูล (module) | |
| package | แพ็กเกจ (package) | |
| crate | เครต (crate) | หน่วยการคอมไพล์ใน Rust |
| binary crate | เครตไบนารี (binary crate) | |
| library crate | เครตไลบรารี (library crate) | |
| path | พาธ (path) | เส้นทางอ้างอิงรายการในมอดูล |
| scope | สโคป (scope) | |
| privacy | ความเป็นส่วนตัว (privacy) | |
| public | แบบสาธารณะ (public) | คง `pub` ในโค้ด |
| private | แบบส่วนตัว (private) | |
| prelude | พรีลูด (prelude) | รายการมาตรฐานที่นำเข้าสู่สโคปให้อัตโนมัติ |
| collection | คอลเลกชัน (collection) | โครงสร้างข้อมูลที่เก็บได้หลายค่า |
| vector | เวกเตอร์ (vector) | |
| string | สตริง (string) | |
| hash map | แฮชแมป (hash map) | |
| key | คีย์ (key) | |
| value | ค่า (value) | |
| error handling | การจัดการข้อผิดพลาด (error handling) | |
| recoverable error | ข้อผิดพลาดที่กู้คืนได้ (recoverable error) | |
| unrecoverable error | ข้อผิดพลาดที่กู้คืนไม่ได้ (unrecoverable error) | |
| panic | การแพนิก (panic) | สภาวะที่โปรแกรมหยุดทำงานกะทันหันเนื่องจากข้อผิดพลาดร้ายแรง |
| generic | เจเนอริก (generic) | |
| type parameter | พารามิเตอร์ชนิดข้อมูล (type parameter) | |
| trait | เทรต (trait) | คุณลักษณะหรือพฤติกรรมร่วมกัน |
| trait bound | ข้อกำหนดเทรต (trait bound) | เงื่อนไขระบุว่าชนิดข้อมูลต้องมีคุณสมบัติตามเทรต |
| bound | ข้อกำหนด / บาวด์ (bound) | ข้อกำหนดว่าชนิดข้อมูลต้องมีคุณสมบัติใด |
| default method | เมธอดที่มีการทำงานเริ่มต้น (default method) | |
| lifetime | ไลฟ์ไทม์ (lifetime) | ช่วงอายุการคงอยู่ของเรเฟอเรนซ์ในหน่วยความจำ |
| lifetime annotation | การระบุไลฟ์ไทม์ (lifetime annotation) | |
| lifetime elision | การละระบุไลฟ์ไทม์ (lifetime elision) | กฎที่คอมไพเลอร์ละเว้นให้ไม่ต้องเขียนไลฟ์ไทม์ |
| test | การทดสอบ / เทสต์ (test) | |
| unit test | การทดสอบระดับยูนิต (unit test) | |
| integration test | การทดสอบรวมระบบ (integration test) | |
| test harness | ตัวรันทดสอบ (test harness) | |
| test runner | ตัวรันทดสอบ (test runner) | |
| assertion | แอสเซอร์ชัน (assertion) | คำสั่งยืนยันเงื่อนไขในการทดสอบ |
| assertion macro | มาโครแอสเซอร์ชัน (assertion macro) | เช่น `assert!`, `assert_eq!` |
| should panic | ควรแพนิก (should panic) | คง `should_panic` ในโค้ด |
| ignore | ข้าม (ignore) | คง `ignore` ในโค้ด |
| closure | โคลเชอร์ (closure) | ฟังก์ชันแบบไม่ระบุชื่อที่สามารถจับตัวแปรจากสภาพแวดล้อมรอบข้างได้ |
| iterator | ตัววนซ้ำ / อิเทอเรเตอร์ (iterator) | |
| iterator adaptor | ตัวปรับแต่งอิเทอเรเตอร์ (iterator adaptor) | เมธอดที่แปลงอิเทอเรเตอร์เป็นอีกชนิดหนึ่ง |
| consuming adaptor | ตัวปรับที่ดึงใช้ข้อมูลจนหมด (consuming adaptor) | เมธอดที่ดึงข้อมูลจากอิเทอเรเตอร์จนหมดสิ้น (แทน "ตัวปรับแบบบริโภคค่า") |
| lazy evaluation | การประเมินผลแบบหน่วงเวลา / เมื่อถูกเรียกใช้เท่านั้น (lazy evaluation) | การทำงานที่จะคำนวณค่าเมื่อจำเป็นต้องใช้จริงเท่านั้น |
| smart pointer | สมาร์ตพอยน์เตอร์ (smart pointer) | พอยน์เตอร์ที่มีความสามารถและเมทาดาทาเพิ่มเติม |
| heap | ฮีป (heap) | หน่วยความจำฮีป |
| stack | สแตก (stack) | หน่วยความจำสแตก |
| deref coercion | การแปลงดีเรฟอัตโนมัติ (deref coercion) | |
| reference counting | การนับจำนวนเรเฟอเรนซ์ (reference counting) | เช่น `Rc<T>` |
| interior mutability | การเปลี่ยนแปลงค่าภายใน (interior mutability) | รูปแบบที่อนุญาตให้แก้ไขข้อมูลผ่านเรเฟอเรนซ์ที่ไม่เปลี่ยนแปลง |
| memory leak | หน่วยความจำรั่วไหล (memory leak) | |
| reference cycle | วัฏจักรเรเฟอเรนซ์ (reference cycle) | สภาวะที่เรเฟอเรนซ์ชี้ถึงกันเป็นวงกลมทำให้หน่วยความจำไม่ถูกคืน |
| concurrency | การทำงานพร้อมกัน (concurrency) | |
| parallelism | การประมวลผลแบบขนาน (parallelism) | |
| thread | เธรด (thread) | |
| message passing | การส่งต่อข้อความ (message passing) | รูปแบบการสื่อสารระหว่างเธรด |
| channel | แชนเนล / ช่องทางสื่อสาร (channel) | |
| shared state | สถานะร่วม (shared state) | |
| mutex | มิวเท็กซ์ (mutex) | กลไกควบคุมการเข้าถึงข้อมูลร่วมกันครั้งละหนึ่งเธรด |
| atomic | อะตอมมิก (atomic) | การดำเนินการที่ไม่สามารถถูกแทรกกลางคันได้ |
| deadlock | ภาวะติดตาย / เดดล็อก (deadlock) | สภาวะที่เธรดต่างรอคอยทรัพยากรซึ่งกันและกันจนทำงานต่อไปไม่ได้ |
| asynchronous programming | การเขียนโปรแกรมแบบอะซิงโครนัส (asynchronous programming) | |
| future | ฟิวเจอร์ (future) | ตัวแทนของผลลัพธ์ที่จะได้รับในอนาคต |
| task | ทาสก์ / ภารกิจ (task) | หน่วยการทำงานแบบอะซิงโครนัส |
| stream | สตรีม (stream) | ลำดับของข้อมูลอะซิงโครนัสที่ทยอยส่งมา |
| runtime | รันไทม์ (runtime) | ระบบเบื้องหลังที่คอยจัดการการทำงานของโปรแกรม |
| executor | เอ็กซีคิวเตอร์ (executor) | ตัวขับเคลื่อนและจัดคิวการทำงานของ future/task |
| polling | การตรวจสถานะ / การโพลล์ (polling) | |
| reactor | รีแอกเตอร์ (reactor) | ตัวรับการแจ้งเตือนเหตุการณ์ I/O ในระบบอะซิงโครนัส |
| object-oriented programming | การเขียนโปรแกรมเชิงวัตถุ (object-oriented programming) | |
| trait object | เทรตออบเจกต์ (trait object) | ตัวแปรที่ชี้ไปยังค่าของชนิดข้อมูลใดก็ได้ที่อิมพลีเมนต์เทรตนั้น |
| dynamic dispatch | การเลือกเมธอดขณะรันไทม์ (dynamic dispatch) | |
| static dispatch | การเลือกเมธอดขณะคอมไพล์ (static dispatch) | |
| state pattern | รูปแบบสถานะ (state pattern) | รูปแบบการออกแบบเชิงวัตถุ |
| unsafe | unsafe (คงชื่อเดิม) | คำสงวนของภาษา Rust สำหรับโค้ดที่ไม่ผ่านการรับประกันความปลอดภัยของคอมไพเลอร์ |
| raw pointer | พอยน์เตอร์ดิบ (raw pointer) | พอยน์เตอร์ที่ไม่มีการรับประกันความถูกต้องของหน่วยความจำ |
| undefined behavior | พฤติกรรมที่ไม่พึงประสงค์หรือไม่ถูกกำหนดไว้ (undefined behavior) | สภาวะที่โปรแกรมทำงานผิดพลาดคาดเดาไม่ได้ |
| foreign function interface (FFI) | ส่วนต่อประสานฟังก์ชันต่างภาษา (foreign function interface หรือ FFI) | กลไกเรียกใช้ฟังก์ชันภาษาอื่น (เช่น C) |
| macro | มาโคร (macro) | กลไกการเขียนโค้ดที่สร้างโค้ดอื่นขึ้นมา (metaprogramming) |
| declarative macro | มาโครแบบประกาศ (declarative macro) | มาโครที่นิยามด้วย `macro_rules!` |
| procedural macro | มาโครแบบโพรซีเดอรัล (procedural macro) | มาโครที่ทำงานคล้ายฟังก์ชันประมวลผลโค้ดขณะคอมไพล์ |
| attribute | แอตทริบิวต์ (attribute) | เมทาดาทากำกับโค้ด เช่น `#[derive(Debug)]` |
| derive | derive (คงชื่อเดิม) | การสร้างอิมพลีเมนต์เทรตอัตโนมัติ |
| edition | ฉบับ (edition) | เช่น Rust ฉบับ 2024 |
| nightly Rust | nightly Rust | เวอร์ชันทดลองรายวันของ Rust |
| stable | เสถียร (stable) | เวอร์ชันที่ผ่านการทดสอบและรับประกันความเสถียร |
| unstable feature | ฟีเจอร์ทดลองที่ยังไม่เสถียร (unstable feature) | |
| compiler | คอมไพเลอร์ (compiler) | |
| warning | คำเตือน (warning) | |
| error message | ข้อความแสดงข้อผิดพลาด (error message) | |
| compile | คอมไพล์ (compile) | |
| build | บิลด์ (build) | |
| toolchain | ทูลเชน (toolchain) | ชุดเครื่องมือสำหรับพัฒนาและคอมไพล์ |
| dependency | ดีเพนเดนซี / แพ็กเกจที่ต้องพึ่งพา (dependency) | |
| package manager | ตัวจัดการแพ็กเกจ (package manager) | |
| workspace | เวิร์กสเปซ (workspace) | กลุ่มของแพ็กเกจที่ใช้ `Cargo.lock` ร่วมกัน |
| release profile | โปรไฟล์การรีลีส (release profile) | การตั้งค่าตัวเลือกการคอมไพล์สำหรับการใช้งานจริง |
| semantic versioning | การกำหนดเวอร์ชันเชิงความหมาย (semantic versioning) | รูปแบบเวอร์ชัน `MAJOR.MINOR.PATCH` |
| registry | เรจิสทรี (registry) | แหล่งรวมเครต เช่น crates.io |
| executable | ไฟล์โปรแกรมที่รันได้ (executable) | |
| source file | ไฟล์ซอร์สโค้ด (source file) | |
| command line | บรรทัดคำสั่ง (command line) | |
| terminal | เทอร์มินัล (terminal) | |
| directory | ไดเรกทอรี (directory) | |
| project | โปรเจกต์ (project) | |
| web server | เว็บเซิร์ฟเวอร์ (web server) | |
| zero-cost abstractions | การจัดการนามธรรมแบบไร้ต้นทุนโสหุ้ย (zero-cost abstractions) | ฟีเจอร์ระดับสูงที่คอมไพล์แล้วมีประสิทธิภาพเทียบเท่าโค้ดระดับต่ำที่เขียนเอง |

## หลักการทั่วไป

- **ชื่อทางเทคนิค**: ชื่อเครื่องมือ (เช่น `cargo`, `rustc`, `rustfmt`, `clippy`), คำสั่ง CLI, ตัวเลือก (flag), ชื่อเครต/เทรต/ฟังก์ชัน/ชนิดข้อมูล/มาโคร (เช่น `Result`, `Option`, `Vec`, `String`, `println!`, `#[derive(Debug)]`) และ URL **ไม่แปล** รวมถึงคำสงวนของภาษา Rust ทุกคำ (`fn`, `let`, `mut`, `impl`, `match`, `async`, `await`, `unsafe` ฯลฯ)
- **คำศัพท์เทคนิค**: ในการปรากฏครั้งแรกของแต่ละไฟล์ ให้เขียนคำแปลไทยตามด้วยคำอังกฤษในวงเล็บ เช่น "สิทธิ์ความเป็นเจ้าของ (ownership)" หรือ "นิพจน์ (expression)" หลังจากนั้นใช้คำไทยเดี่ยวได้ แต่ต้องสอดคล้องกับพจนานุกรมนี้เสมอ
- **โค้ดทุกบล็อก (` ```...``` `)**: ต้องคงไว้ตามต้นฉบับภาษาอังกฤษทุกตัวอักษร (byte-identical) รวมถึงคอมเมนต์ การเว้นวรรค และคำสั่ง `{{#include ...}}`, `{{#rustdoc_include ...}}`, `{{#playground ...}}` ทั้งหมด ห้ามแปลโค้ดโดยเด็ดขาด
- **โค้ดแบบอินไลน์ (`` `...` ``)**: ไม่แปล รวมถึงชื่อไฟล์และเส้นทางไฟล์ เช่น `main.rs`, `src/main.rs`, `Cargo.toml`
- **ลิงก์ (Links)**: ทั้ง inline links, reference links และ autolinks ต้องชี้ไปยัง target เดิมเสมอ (URL ไม่แปล) แปลได้เฉพาะข้อความที่แสดง และ anchor ภายในเล่มต้องตรวจสอบกับ HTML ที่ mdbook build แล้วด้วย `scripts/check-links.ps1`
- **แท็ก `<Listing ...>`**: คงแอตทริบิวต์ `number` และ `file-name` ไว้ตามเดิม แปลเฉพาะข้อความใน `caption="..."` (โดยรักษาเครื่องหมาย markdown เช่น `*...*` และ `` `...` `` ไว้)
- **HTML และคอมเมนต์**: คง `<span id="...">`, `<a id="...">`, คอมเมนต์ `<!-- ... -->` และแท็ก HTML อื่นๆ ไว้ทุกตัวอักษร
- **หัวข้อ (Headings)**: แปลเป็นไทยอย่างเป็นธรรมชาติและกระชับ โดยคงระดับหัวข้อ (`#`, `##`, ...) ให้ตรงกับต้นฉบับทุกประการ และคงชื่อ API/ชนิดข้อมูลในหัวข้อไว้ตามเดิม
- **ตาราง (Tables)**: แปลหัวตารางและเนื้อหาในเซลล์ แต่คงโค้ดและลิงก์ในเซลล์ไว้ตามเดิม
- **การอ้างถึงบท**: ใช้ "บทที่ n" เช่น "บทที่ 4" และอ้างถึงลิสติ้งว่า "ลิสติ้ง 2-1"
- **โทนภาษา**: ใช้สรรพนาม "คุณ" แทนผู้อ่าน และ "เรา" แทนผู้เขียน ใช้ระดับภาษาที่เป็นมืออาชีพ สุภาพ อ่านง่าย ตรงไปตรงมา
- **Anchor ของลิงก์ภายในเล่ม**: mdbook จะตัดวรรณยุกต์ไทยออกจาก slug อัตโนมัติ (แต่คงรูปสระไว้) จึงต้องอ่าน anchor จาก HTML ที่ build แล้วเท่านั้น ห้ามเดา ขั้นตอนคือ build แล้วรัน `scripts/rewrite-anchors.ps1` เพื่อแมป anchor ต้นฉบับเป็น id ไทยตามลำดับหัวข้อ แล้วปิดท้ายด้วย `scripts/check-links.ps1` ทุกครั้ง

## แนวทางการปรับสำนวนภาษาไทยให้เป็นธรรมชาติ (Natural Thai Style Guide)

1. **ลดรูปโครงสร้างประโยคกรรมวาจกเทียม (De-anglicize Passive Voice)**:
   - ภาษาไทยมักใช้ "ถูก..." กับเหตุการณ์ที่ไม่พึงประสงค์ ในเชิงเทคนิคหลีกเลี่ยงการใช้ "ถูก..." พร่ำเพรื่อ:
     - ❌ *ข้อมูลจะถูกจัดเก็บบนสแตก* ➔ ✔️ *ข้อมูลจะจัดเก็บบนสแตก* หรือ *จัดเก็บข้อมูลไว้บนสแตก*
     - ❌ *โค้ดจะถูกคอมไพล์โดย rustc* ➔ ✔️ *rustc จะคอมไพล์โค้ด* หรือ *โค้ดจะคอมไพล์...*
     - ❌ *พารามิเตอร์ถูกส่งเข้ามา* ➔ ✔️ *ส่งพารามิเตอร์เข้ามา*
2. **แก้ไขการใช้ลักษณนามให้เหมาะสมกับบริบท**:
   - ❌ *มีเจ้าของได้เพียงคนเดียว* (เมื่อกล่าวถึงตัวแปรหรือค่าข้อมูล) ➔ ✔️ *มีเจ้าของได้เพียงหนึ่งเดียว* หรือ *มีเจ้าของได้คราวละหนึ่งตัว*
3. **หลีกเลี่ยงการแปล "it" เป็น "มัน" พร่ำเพรื่อ**:
   - ภาษาไทยสามารถละประธานได้เมื่อบริบทชัดเจน หรือระบุชื่อสิ่งนั้นตรงๆ เพื่อความสละสลวย เช่น แทนที่จะเขียนว่า "มันช่วยให้..." ให้เขียนว่า "Rust ช่วยให้..." หรือ "คุณลักษณะนี้ช่วยให้..."
4. **ตัดทอนคำฟุ่มเฟือย**:
   - ตัดคำว่า "ทำการ...", "มีความสามารถในการ...", "เพื่อวัตถุประสงค์ในการ..." เช่น "ทำการตรวจสอบ" ➔ "ตรวจสอบ", "มีความสามารถในการทำงาน" ➔ "สามารถทำงาน"
5. **ปรับสำนวนเชื่อมความให้ลื่นไหล**:
   - ❌ *พูดอีกอย่างหนึ่งคือ* / *กล่าวอีกนัยหนึ่งคือ* (แปลมาจาก In other words) ➔ ✔️ *กล่าวคือ* หรือ *นั่นหมายความว่า*
   - ❌ *ตัวบทนี้สมมติว่าคุณใช้...* (แปลมาจาก This version of the text assumes...) ➔ ✔️ *เนื้อหาในเล่มนี้เขียนขึ้นสำหรับ...* หรือ *เนื้อหาเล่มนี้อิงตาม...*
   - ❌ *ผู้ที่โหยหาความเร็วและความเสถียร* ➔ ✔️ *ผู้ที่ต้องการความเร็วและความเสถียร*
