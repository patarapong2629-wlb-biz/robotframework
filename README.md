# robotframework + selenium library

## Pre-requisite

- python
- robotframework
- robotframework-seleniumlibrary

## How to Run Test

```sh
robot <path to file>/<filename>.robot
```

1. ทดสอบ Google "ค้นหา คำค้น และตรวจสอบผลการค้นหา"

   ```sh
   robot E2E-Test/UI/Google/google.robot
   ```

   หรือ

   ```sh
   robot E2E-Test/UI/Google/google_2.robot
   ```

2. ทดสอบ Amazon "ค้นหาหนังสือ เพิ่มลงใน Shopping Cart สำเร็จ"

   ```sh
   robot E2E-Test/UI/Amazon/view_and_add_to_cart_success.robot
   ```

   หรือ

   ```sh
   robot E2E-Test/UI/Amazon/view_and_add_to_cart_success_2.robot
   ```

## How to View Report

Click on output report path after run test.

## References

- [Robotframework SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Robotframework BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)

## Notes

1. Automation test คือ ไม่มีมนุษย์เข้ามาอยู่ในขั้นตอนการทดสอบ
2. Robotframework อย่างเดียวใช้ทดสอบ web ไม่ได้ ต้องใช้คู่กับ SeleniumLibrary และ Automation test ใช้ tool เดียวไม่ได้ ต้องใช้ tools หลาย ๆ ตัวจึงจะสามารถทำ automation test ได้
3. ก่อนทำ Automation test ต้อง scan กรรม web page และ test scenarios ที่มาพร้อมกับบาปเรื่อง element id/name และ test data/expected output
4. Robotframework เป็น Keywords-Driven Tool โดยใช้ภาษาไทยได้ ทำให้อ่าน code เข้าใจง่ายขึ้น
5. Automation UI test ค่อนข้างบอบบาง ถ้ามี change เกิดขึ้น หรือ อาจจะเป็น flaky test คือ run แล้ว ผ่านบ้าง ไม่ผ่านบ้าง โดยถ้ามี change เกิดขึ้นควรแจ้งทีมที่ maintain test source code นี้
6. ทำ Automation แล้ว ไม่ต้อง capture รูปทำ report ใน MS Word เพราะ tool จะ capture หน้าจอเวลาที่มีปัญหาให้อยู่แล้ว ขอส่งเป็น html แทน แต่อย่าใช้ Capture Page Screenshot ทุก steps เนื่องจากเปลือง memory
7. ถ้าไม่มีการเตรียมการก่อนการทดสอบ Automation test จะเกิดเป็น flaky test ได้
8. Run automation UI test ทั้งตอนที่เป็น project phase (local machine, development, SIT, UAT) และ production phase เมื่อมีการแก้ไขข้อบกพร่อง หรือ มี change request
9. เปลี่ยน variable จาก command line ได้ เช่น `robot -v URL:https://duckduckgo.com google2.robot` (เฉพาะ variable ที่อยู่ใต้ section **_ Variables _**)
10. การใส่ option ให้ browser chrome ตอน run เปิดค้างไว้เพื่อ inspect `options=add_experimental_option("detach",True)`
11. Keywords BuiltIn ของ Robotframework `Wait Until Keyword Succeeds` ในการสั่งให้รอและทำซ้ำถ้าไม่สำเร็จ
12. ถ้า opacity = 0 จะ get ค่าของ element จาก `Wait Until Element Contains` ไม่ได้ ต้องใช้ `Element Attribute Value Should Be innerHTML` แทน
