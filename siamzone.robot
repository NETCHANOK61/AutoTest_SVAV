*** Settings ***
Library    SeleniumLibrary
Test Teardown   Close Window
Test Setup      Open Website

***Test Cases ***
TestCase01 ค้นหากระทู้จากเมนู เว็บบอร์ด หมวดหมู่ห้องเทคโนโลยี ด้วยคำที่สะกดถูกต้อง (ภาษาไทย)
    find blog IT    หูฟัง

TestCase02 ค้นหากระทู้จากเมนู เว็บบอร์ด หมวดหมู่ห้องเทคโนโลยี ด้วยคำที่สะกดถูกต้อง (ภาษาอังกฤษ)
    find blog IT    apple watch

TestCase03 ค้นหากระทู้จากเมนู เว็บบอร์ด หมวดหมู่ห้องเทคโนโลยี ด้วยคำที่สะกดไม่ถูกต้อง (ภาษาไทย)
    find blog IT spell error   หูฟง

TestCase04 ค้นหากระทู้จากเมนู เว็บบอร์ด หมวดหมู่ห้องเทคโนโลยี ด้วยคำที่สะกดไม่ถูกต้อง (ภาษาอังกฤษ)
    find blog IT spell error    aple watc

*** Variables ***
${CONTENT}      ปัญหาคอมพิวเตอร์ โปรแกรมคอมพิวเตอร์ การใช้งานอินเตอร์เน็ต เว็บไซต์ อุปกรณ์ต่อพ่วงต่างๆ โทรศัพท์มือถือ เครื่องเล่นเพลงเอ็มพีสาม กล้องดิจิตอล
${CHECKWORD}    SIAMZONE.COM › เว็บบอร์ด › เทคโนโลยี
${CHECKWORD2}   ค้นหาใหม่โดยใช้
${NEW_SEARCH}   //*[@id="___gcse_0"]/div/div/div/div[5]/div[2]/div[1]/div/div[1]/div/div[1]/a
${INPUT_TEXT}   //input[@class="uk-search-field uk-form-width-medium"]

*** Keywords ***
Open Website
    Open Browser    https://www.siamzone.com/board/    chrome
    Wait Until Page Contains    เว็บบอร์ด
    Click Element   //*[@id="content"]/div/ul/li[3]/div/div/a
    Wait Until Page Contains    ${CONTENT}

find blog IT
    [Arguments]     ${SEARCH}
    Input Text  ${INPUT_TEXT}     ${SEARCH}
    Press Keys  ${INPUT_TEXT}     RETURN
    ${handles}=    Get Window Handles
    Switch Window   ${handles}[1]
    Wait Until Page Contains    ${CHECKWORD}

find blog IT spell error
    [Arguments]     ${SEARCH}
    Input Text  ${INPUT_TEXT}     ${SEARCH}
    Press Keys  ${INPUT_TEXT}     RETURN
    ${handles}=    Get Window Handles
    Switch Window   ${handles}[1]
    Wait Until Page Contains    ${CHECKWORD}
    Click Element   ${NEW_SEARCH}
    Wait Until Page Contains    ${CHECKWORD2}
