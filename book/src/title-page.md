# ภาษาโปรแกรม Rust

_โดย Steve Klabnik, Carol Nichols และ Chris Krycho พร้อมการมีส่วนร่วมจากชุมชน Rust_

เนื้อหาในหนังสือเล่มนี้เขียนขึ้นโดยอิงตาม Rust 1.98.0 (เผยแพร่เมื่อ 2026-08-20) หรือใหม่กว่า และกำหนด `edition = "2024"` ในไฟล์ *Cargo.toml* ของทุกโปรเจกต์เพื่อให้สอดคล้องกับสำนวนของ Rust ฉบับ 2024 ดูคำแนะนำในการติดตั้งหรืออัปเดต Rust ได้ที่[หัวข้อ "การติดตั้ง" ของบทที่ 1][install]<!-- ignore --> และดูข้อมูลเกี่ยวกับฉบับของ Rust (editions) ได้ที่[ภาคผนวก E][appendix-e]<!-- ignore -->

รูปแบบ HTML สามารถอ่านออนไลน์ได้ที่
[https://doc.rust-lang.org/stable/book/](https://doc.rust-lang.org/stable/book/)
และสามารถอ่านแบบออฟไลน์ได้จากการติดตั้ง Rust ผ่าน `rustup` โดยรันคำสั่ง `rustup doc --book` เพื่อเปิดอ่าน

นอกจากนี้ยังมี[ฉบับแปล][translations]โดยชุมชนในภาษาอื่นๆ อีกหลายภาษา

หนังสือเล่มนี้มีจำหน่ายใน[รูปแบบหนังสือเล่มปกอ่อนและอีบุ๊กจาก No Starch Press][nsprust]

[install]: ch01-01-installation.html
[appendix-e]: appendix-05-editions.html
[nsprust]: https://nostarch.com/rust-programming-language-3rd-edition
[translations]: appendix-06-translation.html

> **🚨 ต้องการประสบการณ์การเรียนรู้แบบอินเทอร์แอกทีฟมากขึ้นหรือไม่? ลองสัมผัส Rust Book
> อีกเวอร์ชันหนึ่งที่มาพร้อมแบบทดสอบ การไฮไลต์โค้ด การแสดงภาพจำลอง
> และฟีเจอร์อื่นๆ อีกมากมาย**: <https://rust-book.cs.brown.edu>
