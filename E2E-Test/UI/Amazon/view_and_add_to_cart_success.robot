*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}          https://www.amazon.com
${BROWSER}      gc


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


*** Keywords ***
เข้าหน้าแรกของที่ Amazon
    Open Browser    url=${URL}    browser=${BROWSER}
    # options=add_experimental_option("detach",True)
    Click Button    Continue shopping

ใส่คำค้น
    [Arguments]    ${keyword}
    Wait Until Keyword Succeeds    5    200ms
    ...    Input Text    name=field-keywords    ${keyword}
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหาหนังสือ
    [Arguments]    ${expected_value}
    Wait Until Element Contains
    ...    xpath://*/a/h2[@aria-label="${expected_value}"]/span
    ...    ${expected_value}

ตรวจสอบราคาหนังสือ แบบ Paperback How Google Tests Software
    Element Attribute Value Should Be
    ...    //*/div/div/span/div/div/div/div[2]/div/div/div[3]/div[1]/div/div[1]/div[2]/div[1]/a/span[1]/span[1]
    ...    innerHTML
    ...    $21.69
    # Wait Until Page Contains    $21.69

ตรวจสอบราคาหนังสือ แบบ Kindle How Google Tests Software
    Element Attribute Value Should Be
    ...    //*/div/div/span/div/div/div/div[2]/div/div/div[3]/div[1]/div/div[4]/div/div/div[2]/div[1]/a/span[1]/span[1]
    ...    innerHTML
    ...    $20.73
    # Wait Until Page Contains    $20.73

เข้้าดูข้อมูลของหนังสือ
    [Arguments]    ${link}
    Click Link    ${link}

ตรวจสอบชื่อราคาหนังสือ ที่ หน้ารายละเอียดหนังสือ How Google Tests Software
    Wait Until Element Contains    id:productTitle    How Google Tests Software
    Wait Until Element Contains    id:productSubtitle    1st Edition

ตรวจสอบราคาหนังสือ แบบ Paperback ที่ หน้ารายละเอียดหนังสือ How Google Tests Software
    Wait Until Element Contains
    ...    xpath://*[@id="corePriceDisplay_desktop_feature_div"]/div[1]/span[3]/span[2]/span[1]
    ...    $
    Wait Until Element Contains
    ...    xpath://*[@id="corePriceDisplay_desktop_feature_div"]/div[1]/span[3]/span[2]/span[2]
    ...    21
    Element Attribute Value Should Be
    ...    xpath://*[@id="corePriceDisplay_desktop_feature_div"]/div[1]/span[3]/span[2]/span[2]/span
    ...    innerHTML
    ...    .
    Wait Until Element Contains
    ...    xpath://*[@id="corePriceDisplay_desktop_feature_div"]/div[1]/span[3]/span[2]/span[3]
    ...    69

ตรวจสอบราคาหนังสือ แบบ Kindle ที่ หน้ารายละเอียดหนังสือ How Google Tests Software
    Wait Until Element Contains
    ...    xpath://*[@id="a-autoid-0-announce"]/span[@class="slot-price"]/span[@class="a-size-base a-color-secondary"]
    ...    $20.73

เลือกซื้อหนังสือจำนวน 1 เล่ม และ เพิ่มหนังสือเข้าตระกร้าสินค้า
    Click Button    id:add-to-cart-button

กดปุ่ม Go to Cart เข้าไปที่ตระกร้าสินค้า
    # Click Element    id:sw-gtc
    Click Link    Go to Cart

ตรวจสอบชื่อราคาหนังสือ ที่ หน้าตระกร้าสินค้า How Google Tests Software
    Wait Until Element Contains
    ...    //*/div[4]/div/div[2]/ul/li/span/a/span[1]/h4/span/span[@class="a-truncate-cut"]
    ...    How Google Tests Software
