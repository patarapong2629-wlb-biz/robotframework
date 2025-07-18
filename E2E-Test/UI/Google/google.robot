*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}          https://www.bing.com
${BROWSER}      headlesschrome


*** Test Cases ***
ค้นหา คำค้น และตรวจสอบผลการค้นหา
    เข้า Google
    ใส่คำค้นหา ข้าวหมูทอดเฮียวงศ์วงเวียนใหญ่
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา ต้องพบ ข้าวหมูทอด เฮียวงศ์


*** Keywords ***
เข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Page Contains Element    name=q    timeout=5s

ใส่คำค้นหา ข้าวหมูทอดเฮียวงศ์วงเวียนใหญ่
    Input Text    name:q    ข้าวหมูทอดเฮียวงศ์วงเวียนใหญ่

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา ต้องพบ ข้าวหมูทอด เฮียวงศ์
    Wait Until Page Contains    ข้าวหมูทอด เฮียวงศ์
