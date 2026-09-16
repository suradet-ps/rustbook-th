## การนิยามและสร้างอินสแตนซ์ของ struct

struct มีความคล้ายคลึงกับทูเพิล (tuple) ซึ่งได้กล่าวถึงในหัวข้อ[“ชนิดทูเพิล”][tuples]<!-- ignore --> ตรงที่ทั้งคู่ต่างเก็บค่าที่เกี่ยวข้องกันหลายค่า เช่นเดียวกับทูเพิล ชิ้นส่วนของ struct สามารถมีชนิดข้อมูลที่แตกต่างกันได้ ต่างจากทูเพิล ตรงที่ใน struct คุณจะตั้งชื่อข้อมูลแต่ละชิ้น เพื่อให้ชัดเจนว่าค่าเหล่านั้นหมายถึงอะไร การเพิ่มชื่อเหล่านี้ทำให้ struct ยืดหยุ่นกว่าทูเพิล: คุณไม่จำเป็นต้องพึ่งพาลำดับของข้อมูลในการระบุหรือเข้าถึงค่าต่างๆ ของอินสแตนซ์ (instance)

ในการนิยาม struct เราเริ่มด้วยคำสงวน `struct` แล้วตั้งชื่อให้ struct ทั้งตัว ชื่อของ struct ควรอธิบายความสำคัญของข้อมูลแต่ละชิ้นที่ถูกจัดกลุ่มเข้าด้วยกัน จากนั้นภายในวงเล็บปีกกา เรานิยามชื่อและชนิดข้อมูลของข้อมูลแต่ละชิ้น ซึ่งเราเรียกว่า _ฟิลด์_ (field) ตัวอย่างเช่น ลิสติ้ง 5-1 แสดง struct ที่เก็บข้อมูลเกี่ยวกับบัญชีผู้ใช้

<Listing number="5-1" file-name="src/main.rs" caption="การนิยาม struct `User`">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-01/src/main.rs:here}}
```

</Listing>

ในการใช้ struct หลังจากที่เรานิยามมันแล้ว เราจะสร้าง _อินสแตนซ์_ ของ struct นั้นโดยระบุค่าจริงให้กับแต่ละฟิลด์ เราสร้างอินสแตนซ์โดยระบุชื่อของ struct แล้วตามด้วยวงเล็บปีกกาที่บรรจุคู่ _`key: value`_ โดยที่คีย์ (key) คือชื่อของฟิลด์ และค่า (value) คือข้อมูลที่เราต้องการเก็บในฟิลด์เหล่านั้น เราไม่จำเป็นต้องระบุฟิลด์ตามลำดับเดียวกับที่เราประกาศไว้ใน struct กล่าวอีกนัยหนึ่ง การนิยาม struct เปรียบเสมือนเทมเพลตทั่วไปของชนิดข้อมูล และอินสแตนซ์จะเติมข้อมูลเฉพาะลงในเทมเพลตนั้นเพื่อสร้างค่าของชนิดข้อมูลนั้น ตัวอย่างเช่น เราสามารถประกาศผู้ใช้คนหนึ่งได้ดังแสดงในลิสติ้ง 5-2

<Listing number="5-2" file-name="src/main.rs" caption="การสร้างอินสแตนซ์ของ struct `User`">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-02/src/main.rs:here}}
```

</Listing>

ในการดึงค่าเฉพาะจาก struct เราใช้สัญกรณ์จุด (dot notation) ตัวอย่างเช่น หากต้องการเข้าถึงที่อยู่อีเมลของผู้ใช้รายนี้ เราใช้ `user1.email` หากอินสแตนซ์นั้นเปลี่ยนแปลงได้ (mutable) เราสามารถเปลี่ยนค่าได้โดยใช้สัญกรณ์จุดและกำหนดค่าให้กับฟิลด์ที่ต้องการ ลิสติ้ง 5-3 แสดงวิธีเปลี่ยนค่าในฟิลด์ `email` ของอินสแตนซ์ `User` ที่เปลี่ยนแปลงได้

<Listing number="5-3" file-name="src/main.rs" caption="การเปลี่ยนค่าในฟิลด์ `email` ของอินสแตนซ์ `User`">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-03/src/main.rs:here}}
```

</Listing>

โปรดสังเกตว่าอินสแตนซ์ทั้งตัวต้องเปลี่ยนแปลงได้ Rust ไม่อนุญาตให้เราทำเครื่องหมายเฉพาะบางฟิลด์ว่ามีความเปลี่ยนแปลงได้เท่านั้น เช่นเดียวกับเอ็กซ์เพรสชัน (expression) ใดๆ เราสามารถสร้างอินสแตนซ์ใหม่ของ struct เป็นเอ็กซ์เพรสชันสุดท้ายในบอดี้ (body) ของฟังก์ชันเพื่อคืนค่าอินสแตนซ์ใหม่นั้นโดยปริยาย

ลิสติ้ง 5-4 แสดงฟังก์ชัน `build_user` ที่คืนค่าอินสแตนซ์ `User` พร้อมอีเมลและชื่อผู้ใช้ที่กำหนดให้ ฟิลด์ `active` ได้ค่า `true` และ `sign_in_count` ได้ค่า `1`

<Listing number="5-4" file-name="src/main.rs" caption="ฟังก์ชัน `build_user` ที่รับอีเมลและชื่อผู้ใช้และคืนค่าอินสแตนซ์ `User`">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-04/src/main.rs:here}}
```

</Listing>

เป็นเรื่องสมเหตุสมผลที่จะตั้งชื่อพารามิเตอร์ (parameter) ของฟังก์ชันให้เหมือนกับชื่อฟิลด์ของ struct แต่การต้องพิมพ์ชื่อฟิลด์และตัวแปร `email` กับ `username` ซ้ำนั้นค่อนข้างน่าเบื่อ หาก struct มีฟิลด์มากกว่านี้ การพิมพ์แต่ละชื่อซ้ำก็จะยิ่งน่ารำคาญมากขึ้น โชคดีที่มีวิธีเขียนแบบย่อที่สะดวก!

<!-- Old headings. Do not remove or links may break. -->

<a id="using-the-field-init-shorthand-when-variables-and-fields-have-the-same-name"></a>

### การใช้รูปแบบย่อของฟิลด์

เนื่องจากชื่อพารามิเตอร์และชื่อฟิลด์ของ struct เหมือนกันทุกประการในลิสติ้ง 5-4 เราจึงใช้ไวยากรณ์_รูปแบบย่อของฟิลด์_ (field init shorthand) เขียน `build_user` ใหม่ให้ทำงานเหมือนเดิมทุกประการ แต่ไม่ต้องพิมพ์ `username` และ `email` ซ้ำ ดังแสดงในลิสติ้ง 5-5

<Listing number="5-5" file-name="src/main.rs" caption="ฟังก์ชัน `build_user` ที่ใช้รูปแบบย่อของฟิลด์ เนื่องจากพารามิเตอร์ `username` และ `email` มีชื่อเดียวกับฟิลด์ของ struct">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-05/src/main.rs:here}}
```

</Listing>

ในที่นี้ เรากำลังสร้างอินสแตนซ์ใหม่ของ struct `User` ซึ่งมีฟิลด์ชื่อ `email` เราต้องการกำหนดค่าให้ฟิลด์ `email` เป็นค่าของพารามิเตอร์ `email` ในฟังก์ชัน `build_user` เนื่องจากฟิลด์ `email` และพารามิเตอร์ `email` มีชื่อเดียวกัน เราจึงเพียงเขียน `email` แทนที่จะเป็น `email: email`

<!-- Old headings. Do not remove or links may break. -->

<a id="creating-instances-from-other-instances-with-struct-update-syntax"></a>

### การสร้างอินสแตนซ์ด้วยไวยากรณ์อัปเดต struct

บ่อยครั้งที่มีประโยชน์ในการสร้างอินสแตนซ์ใหม่ของ struct ที่นำค่าส่วนใหญ่มาจากอินสแตนซ์อื่นของชนิดข้อมูลเดียวกัน แต่เปลี่ยนค่าบางส่วน คุณสามารถทำได้โดยใช้ไวยากรณ์อัปเดต struct (struct update syntax)

ก่อนอื่น ลิสติ้ง 5-6 แสดงวิธีสร้างอินสแตนซ์ `User` ใหม่ใน `user2` ด้วยวิธีปกติ โดยไม่ใช้ไวยากรณ์อัปเดต เรากำหนดค่าใหม่ให้ `email` แต่นอกเหนือจากนั้นใช้ค่าเดิมจาก `user1` ที่เราสร้างไว้ในลิสติ้ง 5-2

<Listing number="5-6" file-name="src/main.rs" caption="การสร้างอินสแตนซ์ `User` ใหม่โดยใช้ค่าทั้งหมดยกเว้นค่าเดียวจาก `user1`">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-06/src/main.rs:here}}
```

</Listing>

เมื่อใช้ไวยากรณ์อัปเดต struct เราสามารถได้ผลลัพธ์แบบเดียวกันด้วยโค้ดที่น้อยลง ดังแสดงในลิสติ้ง 5-7 ไวยากรณ์ `..` ระบุว่าฟิลด์ที่เหลือซึ่งไม่ได้กำหนดไว้อย่างชัดเจนควรมีค่าเดียวกับฟิลด์ในอินสแตนซ์ที่ให้มา

<Listing number="5-7" file-name="src/main.rs" caption="การใช้ไวยากรณ์อัปเดต struct เพื่อกำหนดค่า `email` ใหม่ให้อินสแตนซ์ `User` แต่ใช้ค่าที่เหลือจาก `user1`">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/listing-05-07/src/main.rs:here}}
```

</Listing>

โค้ดในลิสติ้ง 5-7 ยังสร้างอินสแตนซ์ใน `user2` ที่มีค่า `email` ต่างออกไป แต่มีค่าเหมือนกับ `user1` สำหรับฟิลด์ `username`, `active` และ `sign_in_count` โดย `..user1` ต้องอยู่ท้ายสุดเพื่อระบุว่าฟิลด์ที่เหลือควรรับค่าจากฟิลด์ที่สอดคล้องกันใน `user1` แต่เราสามารถเลือกกำหนดค่าให้ฟิลด์ได้มากเท่าที่ต้องการในลำดับใดก็ได้ โดยไม่คำนึงถึงลำดับของฟิลด์ในการนิยาม struct

โปรดสังเกตว่าไวยากรณ์อัปเดต struct ใช้ `=` เหมือนการกำหนดค่า นี่เป็นเพราะมันย้ายข้อมูล เช่นเดียวกับที่เราเห็นในหัวข้อ[“ตัวแปรและข้อมูลที่ปฏิสัมพันธ์กันด้วยการย้ายค่า”][move]<!-- ignore --> ในตัวอย่างนี้ เราไม่สามารถใช้ `user1` ได้อีกต่อไปหลังจากสร้าง `user2` เพราะ `String` ในฟิลด์ `username` ของ `user1` ถูกย้ายเข้าไปใน `user2` หากเรากำหนดค่า `String` ใหม่ให้ `user2` ทั้ง `email` และ `username` แล้วจึงใช้เฉพาะค่า `active` และ `sign_in_count` จาก `user1` เท่านั้น `user1` ก็จะยังใช้ได้อยู่หลังจากสร้าง `user2` ทั้ง `active` และ `sign_in_count` ต่างเป็นชนิดข้อมูลที่อิมพลีเมนต์เทรต (trait) `Copy` ดังนั้นพฤติกรรมที่เราพูดคุยกันในหัวข้อ[“ข้อมูลบนสแตกเท่านั้น: การคัดลอกค่า”][copy]<!-- ignore --> จึงนำมาใช้ด้วย เรายังสามารถใช้ `user1.email` ได้ในตัวอย่างนี้ เพราะค่าของมันไม่ได้ถูกย้ายออกจาก `user1`

<!-- Old headings. Do not remove or links may break. -->

<a id="using-tuple-structs-without-named-fields-to-create-different-types"></a>

### การสร้างชนิดข้อมูลที่แตกต่างกันด้วยทูเพิล struct

Rust ยังรองรับ struct ที่มีหน้าตาคล้ายทูเพิล เรียกว่า _ทูเพิล struct_ (tuple struct) ทูเพิล struct มีความหมายเพิ่มเติมที่ชื่อของ struct มอบให้ แต่ไม่มีชื่อที่ผูกกับฟิลด์ของมัน แทนที่จะเป็นเช่นนั้น มันมีเพียงชนิดข้อมูลของฟิลด์เท่านั้น ทูเพิล struct มีประโยชน์เมื่อคุณต้องการตั้งชื่อให้ทูเพิลทั้งชุดและทำให้ทูเพิลเป็นชนิดข้อมูลที่แตกต่างจากทูเพิลอื่นๆ และเมื่อการตั้งชื่อให้แต่ละฟิลด์เหมือนใน struct ปกติจะยาวเกินไปหรือซ้ำซ้อน

ในการนิยามทูเพิล struct ให้เริ่มด้วยคำสงวน `struct` และชื่อของ struct ตามด้วยชนิดข้อมูลในทูเพิล ตัวอย่างเช่น ในที่นี้เรานิยามและใช้งานทูเพิล struct สองตัวชื่อ `Color` และ `Point`:

<Listing file-name="src/main.rs">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/no-listing-01-tuple-structs/src/main.rs}}
```

</Listing>

โปรดสังเกตว่าค่า `black` และ `origin` เป็นคนละชนิดข้อมูล เพราะมันเป็นอินสแตนซ์ของทูเพิล struct ที่ต่างกัน struct ทุกตัวที่คุณนิยามเป็นชนิดข้อมูลของตัวเอง แม้ว่าฟิลด์ภายใน struct นั้นอาจมีชนิดข้อมูลเดียวกันก็ตาม ตัวอย่างเช่น ฟังก์ชันที่รับพารามิเตอร์ชนิด `Color` ไม่สามารถรับ `Point` เป็นอาร์กิวเมนต์ (argument) ได้ แม้ว่าทั้งสองชนิดข้อมูลจะประกอบขึ้นจากค่า `i32` สามค่าก็ตาม นอกเหนือจากนั้น อินสแตนซ์ของทูเพิล struct ก็คล้ายกับทูเพิลตรงที่คุณสามารถแยกโครงสร้างข้อมูล (destructuring) มันออกเป็นชิ้นส่วนแต่ละชิ้นได้ และคุณสามารถใช้ `.` ตามด้วยดัชนีเพื่อเข้าถึงค่าแต่ละค่าได้ ต่างจากทูเพิล ตรงที่ทูเพิล struct ต้องการให้คุณระบุชื่อชนิดข้อมูลของ struct เมื่อคุณแยกโครงสร้างข้อมูลมัน ตัวอย่างเช่น เราจะเขียน `let Point(x, y, z) = origin;` เพื่อแยกโครงสร้างข้อมูลค่าต่างๆ ในจุด `origin` ออกมาเป็นตัวแปรชื่อ `x`, `y` และ `z`

<!-- Old headings. Do not remove or links may break. -->

<a id="unit-like-structs-without-any-fields"></a>

### การนิยาม struct ที่คล้ายยูนิต

คุณยังสามารถนิยาม struct ที่ไม่มีฟิลด์ใดๆ ได้ด้วย! struct เหล่านี้เรียกว่า _struct ที่คล้ายยูนิต_ (unit-like struct) เพราะมันทำงานคล้ายคลึงกับ `()` ซึ่งเป็นชนิดข้อมูลยูนิต (unit type) ที่เราได้กล่าวถึงในหัวข้อ[“ชนิดทูเพิล”][tuples]<!-- ignore --> struct ที่คล้ายยูนิตมีประโยชน์เมื่อคุณจำเป็นต้องอิมพลีเมนต์เทรตให้กับชนิดข้อมูลบางชนิด แต่ไม่มีข้อมูลใดที่คุณต้องการเก็บไว้ในตัวชนิดข้อมูลนั้นเอง เราจะพูดคุยเรื่องเทรตในบทที่ 10 นี่คือตัวอย่างการประกาศและสร้างอินสแตนซ์ของ struct แบบยูนิตชื่อ `AlwaysEqual`:

<Listing file-name="src/main.rs">

```rust
{{#rustdoc_include ../listings/ch05-using-structs-to-structure-related-data/no-listing-04-unit-like-structs/src/main.rs}}
```

</Listing>

ในการนิยาม `AlwaysEqual` เราใช้คำสงวน `struct` ตามด้วยชื่อที่เราต้องการ แล้วปิดท้ายด้วยอัฒภาค ไม่ต้องใช้วงเล็บปีกกาหรือวงเล็บเลย! จากนั้นเราสามารถรับอินสแตนซ์ของ `AlwaysEqual` มาเก็บไว้ในตัวแปร `subject` ได้ในลักษณะคล้ายกัน คือใช้ชื่อที่เรานิยามไว้ โดยไม่ต้องมีวงเล็บปีกกาหรือวงเล็บ ลองจินตนาการว่าในภายหลังเราจะอิมพลีเมนต์พฤติกรรมให้กับชนิดข้อมูลนี้ โดยให้ทุกอินสแตนซ์ของ `AlwaysEqual` เท่ากับทุกอินสแตนซ์ของชนิดข้อมูลอื่นเสมอ อาจเพื่อให้ได้ผลลัพธ์ที่รู้ล่วงหน้าสำหรับการทดสอบ เราก็ไม่จำเป็นต้องมีข้อมูลใดๆ ในการอิมพลีเมนต์พฤติกรรมนั้นเลย! คุณจะได้เห็นในบทที่ 10 ว่าจะนิยามเทรตและอิมพลีเมนต์เทรตให้กับชนิดข้อมูลใดก็ได้ รวมถึง struct ที่คล้ายยูนิตได้อย่างไร

> ### ความเป็นเจ้าของข้อมูลใน struct
>
> ในการนิยาม struct `User` ในลิสติ้ง 5-1 เราใช้ชนิดข้อมูล `String` ที่เป็นเจ้าของค่า แทนที่จะใช้ชนิดสตริงสไลซ์ (string slice) `&str` นี่เป็นการเลือกโดยเจตนา เพราะเราต้องการให้แต่ละอินสแตนซ์ของ struct นี้เป็นเจ้าของข้อมูลทั้งหมดของมัน และให้ข้อมูลนั้นยังใช้ได้ตลอดเวลาที่ struct ทั้งตัวยังใช้ได้
>
> struct ยังสามารถเก็บเรเฟอเรนซ์ (reference) ไปยังข้อมูลที่เป็นของสิ่งอื่นได้เช่นกัน แต่การทำเช่นนั้นต้องใช้ _ไลฟ์ไทม์_ (lifetime) ซึ่งเป็นฟีเจอร์ของ Rust ที่เราจะพูดคุยกันในบทที่ 10 ไลฟ์ไทม์รับประกันว่าข้อมูลที่ struct อ้างอิงถึงจะใช้ได้ตลอดเวลาที่ struct ยังใช้ได้ สมมติว่าคุณพยายามเก็บเรเฟอเรนซ์ไว้ใน struct โดยไม่ระบุไลฟ์ไทม์ ดังตัวอย่างต่อไปนี้ใน _src/main.rs_ สิ่งนี้จะใช้ไม่ได้:
>
> <Listing file-name="src/main.rs">
>
> <!-- CAN'T EXTRACT SEE https://github.com/rust-lang/mdBook/issues/1127 -->
>
> ```rust,ignore,does_not_compile
> struct User {
>     active: bool,
>     username: &str,
>     email: &str,
>     sign_in_count: u64,
> }
>
> fn main() {
>     let user1 = User {
>         active: true,
>         username: "someusername123",
>         email: "someone@example.com",
>         sign_in_count: 1,
>     };
> }
> ```
>
> </Listing>
>
> คอมไพเลอร์จะบ่นว่ามันต้องการตัวระบุไลฟ์ไทม์:
>
> ```console
> $ cargo run
>    Compiling structs v0.1.0 (file:///projects/structs)
> error[E0106]: missing lifetime specifier
>  --> src/main.rs:3:15
>   |
> 3 |     username: &str,
>   |               ^ expected named lifetime parameter
>   |
> help: consider introducing a named lifetime parameter
>   |
> 1 ~ struct User<'a> {
> 2 |     active: bool,
> 3 ~     username: &'a str,
>   |
>
> error[E0106]: missing lifetime specifier
>  --> src/main.rs:4:12
>   |
> 4 |     email: &str,
>   |            ^ expected named lifetime parameter
>   |
> help: consider introducing a named lifetime parameter
>   |
> 1 ~ struct User<'a> {
> 2 |     active: bool,
> 3 |     username: &str,
> 4 ~     email: &'a str,
>   |
>
> For more information about this error, try `rustc --explain E0106`.
> error: could not compile `structs` (bin "structs") due to 2 previous errors
> ```
>
> ในบทที่ 10 เราจะพูดคุยถึงวิธีแก้ข้อผิดพลาดเหล่านี้ เพื่อให้คุณเก็บเรเฟอเรนซ์ไว้ใน struct ได้ แต่สำหรับตอนนี้ เราจะแก้ข้อผิดพลาดเช่นนี้โดยใช้ชนิดข้อมูลที่เป็นเจ้าของค่า เช่น `String` แทนเรเฟอเรนซ์อย่าง `&str`

<!-- manual-regeneration
for the error above
after running update-rustc.sh:
pbcopy < listings/ch05-using-structs-to-structure-related-data/no-listing-02-reference-in-struct/output.txt
paste above
add `> ` before every line -->

[tuples]: ch03-02-data-types.html#the-tuple-type
[move]: ch04-01-what-is-ownership.html#variables-and-data-interacting-with-move
[copy]: ch04-01-what-is-ownership.html#stack-only-data-copy
