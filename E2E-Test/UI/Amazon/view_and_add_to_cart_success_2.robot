*** Settings ***
Library     SeleniumLibrary
Resource    view_and_add_to_cart_success_2.resource


*** Test Cases ***
ค้นหาหนังสือ เพิ่มลงใน Shopping Cart สำเร็จ
    เข้าหน้าแรกของที่ Amazon
    ใส่คำค้น    How Google Tests Software
    ตรวจสอบผลการค้นหาหนังสือ    How Google Tests Software
    ตรวจสอบราคาหนังสือ แบบ Paperback How Google Tests Software
    ตรวจสอบราคาหนังสือ แบบ Kindle How Google Tests Software
    เข้้าดูข้อมูลของหนังสือ    How Google Tests Software
    ตรวจสอบชื่อราคาหนังสือ ที่ หน้ารายละเอียดหนังสือ How Google Tests Software
    ตรวจสอบราคาหนังสือ แบบ Paperback ที่ หน้ารายละเอียดหนังสือ How Google Tests Software
    ตรวจสอบราคาหนังสือ แบบ Kindle ที่ หน้ารายละเอียดหนังสือ How Google Tests Software
    เลือกซื้อหนังสือจำนวน 1 เล่ม และ เพิ่มหนังสือเข้าตระกร้าสินค้า
    # ตรวจสอบการเพิ่มหนังสือเข้าตระกร้าสินค้าสำเร็จ
    กดปุ่ม Go to Cart เข้าไปที่ตระกร้าสินค้า
    ตรวจสอบชื่อราคาหนังสือ ที่ หน้าตระกร้าสินค้า How Google Tests Software
    # ตรวจสอบราคาหนังสือ แบบ Paperback ที่ หน้าตระกร้าสินค้า How Google Tests Software
    # ตรวจสอบจำนวนหนังสือ แบบ Paperback ที่ หน้าตระกร้าสินค้า How Google Tests Software
    # ตรวจสอบจำนวนหนังสือทั้งหมด (Subtotal) ที่ หน้าตระกร้าสินค้า
    # ตรวจสอบจำนวนเงินรวม (Subtotal) ที่ หน้าตระกร้าสินค้า
    # ตรวจสอบจำนวนหนังสือทั้งหมด (Subtotal) ที่ หน้าตระกร้าสินค้าส่วนของ Processed to checkout
    # ตรวจสอบจำนวนเงินรวม (Subtotal) ที่ หน้าตระกร้าสินค้าส่วนของ Processed to checkout
