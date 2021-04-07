*** Settings ***
Library    SeleniumLibrary
# Test Teardown   Close Browser
Test Setup      Open Siamzone

***Test Cases ***
เลือกเมนู ภาพยนตร์>วันเข้าฉาย ใน siamzone
    Menu movie  //*[@id="navbarSZ"]/div/div[2]/a    วันเข้าฉาย    //*[@id="navbarSZ"]/div/div[2]/div/a[1]     เข้าฉายแล้ววันนี้

เลือกเมนู เพลง>วันเข้าฉาย ใน siamzone
    Menu movie  //*[@id="navbarSZ"]/div/div[3]/a    เนื้อเพลงไทย    //*[@id="navbarSZ"]/div/div[3]/div/a[1]     เนื้อเพลง

*** Keywords ***
Open Siamzone
    Open Browser    https://www.siamzone.com/    chrome
    Wait Until Page Contains  เรื่องเด่นประเด็นดัง
    Page Should Contain     สงวนลิขสิทธิ์ © สยามโซน.คอม
Menu movie
    [Arguments]    ${Main_menu}    ${Word_menu}    ${Menu_sub}     ${FIRST_TEXT} 
    Mouse Over  ${Main_menu}
    Wait Until Page Contains  ${Word_menu}
    Click ELement   ${Menu_sub}
    Wait Until Page Contains    ${FIRST_TEXT}
