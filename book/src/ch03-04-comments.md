## คอมเมนต์

โปรแกรมเมอร์ทุกคนพยายามทำให้โค้ดของตนเข้าใจง่าย แต่บางครั้งคำอธิบายเพิ่มเติมก็เป็นสิ่งที่สมเหตุสมผล ในกรณีเหล่านี้ โปรแกรมเมอร์จะทิ้ง_คอมเมนต์_ (comment) ไว้ในซอร์สโค้ดของตน ซึ่งคอมไพเลอร์จะข้ามไป แต่ผู้ที่อ่านซอร์สโค้ดอาจพบว่ามีประโยชน์

นี่คือคอมเมนต์ง่ายๆ:

```rust
// hello, world
```

ใน Rust สไตล์คอมเมนต์ตามสำนวนนิยมจะเริ่มคอมเมนต์ด้วยเครื่องหมายทับสองตัว และคอมเมนต์ดำเนินต่อไปจนจบบรรทัด สำหรับคอมเมนต์ที่ยาวเกินหนึ่งบรรทัด คุณต้องใส่ `//` ในแต่ละบรรทัด ดังนี้:

```rust
// So we're doing something complicated here, long enough that we need
// multiple lines of comments to do it! Whew! Hopefully, this comment will
// explain what's going on.
```

คอมเมนต์ยังสามารถวางไว้ท้ายบรรทัดที่มีโค้ดได้ด้วย:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-24-comments-end-of-line/src/main.rs}}
```

แต่คุณจะเห็นคอมเมนต์ถูกใช้ในรูปแบบนี้บ่อยกว่า โดยมีคอมเมนต์อยู่บนบรรทัดแยกเหนือโค้ดที่มันอธิบาย:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-25-comments-above-line/src/main.rs}}
```

Rust ยังมีคอมเมนต์อีกประเภทหนึ่ง คือคอมเมนต์เอกสาร (documentation comment) ซึ่งเราจะพูดถึงในหัวข้อ[“การเผยแพร่เครตไปยัง Crates.io”][publishing]<!-- ignore --> ของบทที่ 14

[publishing]: ch14-02-publishing-to-crates-io.html
