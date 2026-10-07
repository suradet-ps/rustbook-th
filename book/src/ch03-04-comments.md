## คอมเมนต์

โปรแกรมเมอร์ทุกคนต่างพยายามเขียนโค้ดให้อ่านและเข้าใจง่าย แต่บางครั้งการเขียนคำอธิบายเพิ่มเติมก็มีประโยชน์อย่างยิ่ง ในกรณีเช่นนี้ โปรแกรมเมอร์จะเขียน _คอมเมนต์_ (comment) ทิ้งไว้ในซอร์สโค้ด ซึ่งคอมไพเลอร์จะมองข้ามข้อความเหล่านี้ไป แต่ผู้อ่านโค้ดจะได้รับประโยชน์จากคำอธิบายดังกล่าว

นี่คือตัวอย่างคอมเมนต์แบบเรียบง่าย:

```rust
// hello, world
```

ใน Rust รูปแบบคอมเมนต์มาตรฐานที่นิยมใช้จะเริ่มต้นด้วยเครื่องหมายทับสองตัว (`//`) และข้อความคอมเมนต์จะครอบคลุมไปจนจบบรรทัดนั้น สำหรับคอมเมนต์ที่มีความยาวเกินหนึ่งบรรทัด คุณจะต้องใส่ `//` ไว้ที่ต้นบรรทัดของแต่ละบรรทัด ดังนี้:

```rust
// So we're doing something complicated here, long enough that we need
// multiple lines of comments to do it! Whew! Hopefully, this comment will
// explain what's going on.
```

นอกจากนี้ เรายังสามารถวางคอมเมนต์ไว้ท้ายบรรทัดคำสั่งได้ด้วย:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-24-comments-end-of-line/src/main.rs}}
```

อย่างไรก็ดี คุณมักจะพบเห็นการเขียนคอมเมนต์ในรูปแบบแยกบรรทัดไว้เหนือโค้ดที่ต้องการอธิบายมากกว่า:

<span class="filename">ชื่อไฟล์: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-25-comments-above-line/src/main.rs}}
```

Rust ยังมีคอมเมนต์อีกประเภทหนึ่ง นั่นคือคอมเมนต์เอกสาร (documentation comment) ซึ่งเราจะกล่าวถึงในหัวข้อ [“การเผยแพร่เครตไปยัง Crates.io”][publishing]<!-- ignore --> ในบทที่ 14

[publishing]: ch14-02-publishing-to-crates-io.html
