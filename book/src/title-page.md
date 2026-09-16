# ภาษาการเขียนโปรแกรม Rust

_โดย Steve Klabnik, Carol Nichols และ Chris Krycho โดยได้รับความร่วมมือจาก Rust Community_

ตัวบทฉบับนี้สมมติว่าคุณใช้ Rust 1.98.0 (เผยแพร่เมื่อ 2026-08-20) หรือใหม่กว่า โดยมี `edition = "2024"` ในไฟล์ *Cargo.toml* ของทุกโปรเจกต์เพื่อกำหนดให้ใช้สำนวนของ Rust ฉบับ 2024 ดูคำแนะนำในการติดตั้งหรืออัปเดต Rust ได้ที่[หัวข้อ "การติดตั้ง" ของบทที่ 1][install]<!-- ignore --> และดูข้อมูลเกี่ยวกับฉบับของ Rust (edition) ได้ที่[ภาคผนวก E][appendix-e]<!-- ignore -->

รูปแบบ HTML อ่านออนไลน์ได้ที่
[https://doc.rust-lang.org/stable/book/](https://doc.rust-lang.org/stable/book/)
และอ่านแบบออฟไลน์ได้จากการติดตั้ง Rust ที่ทำผ่าน `rustup` โดยรัน `rustup doc --book` เพื่อเปิดอ่าน

นอกจากนี้ยังมี[คำแปล][translations]โดยชุมชนในภาษาอื่นๆ อีกหลายภาษา

ตัวบทนี้มีจำหน่ายใน[รูปแบบหนังสือปกอ่อนและอีบุ๊กจาก No Starch Press][nsprust]

[install]: ch01-01-installation.html
[appendix-e]: appendix-05-editions.html
[nsprust]: https://nostarch.com/rust-programming-language-3rd-edition
[translations]: appendix-06-translation.html

> **🚨 ต้องการประสบการณ์การเรียนรู้แบบอินเทอร์แอกทีฟมากขึ้นไหม? ลองใช้ Rust Book
> อีกเวอร์ชันหนึ่งที่มีทั้งแบบทดสอบ การไฮไลต์ การแสดงภาพ
> และอื่นๆ อีกมากมาย**: <https://rust-book.cs.brown.edu>
