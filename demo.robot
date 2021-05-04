*** Settings ***
Library    SeleniumLibrary
# Test Teardown   Close Browser
Test Setup      Open Google

***Test Cases ***
# เปิด google.co.th ด้วย Chrome
#     Search on Google  Robot Framework   robotframework.org   //*[@id="rso"]/div[1]/div[1]/div/div[1]/a  ผลการค้นหาประมาณ  generic open source automation

ค้นหาใน Chrome ด้วย keywords siamzone
    # Input Text  q   siamzone
    # Press Keys  q   RETURN
    # Wait Until Page Contains  Siam Zone : ภาพยนตร์ เพลง ละคร ข่าวบันเทิง เนื้อเพลง ฯลฯ
    # Click Link  //*[@id="rso"]/div[1]/div[1]/div/div/div[1]/a
    # Wait Until Page Contains  เรื่องเด่นประเด็นดัง
    # Page Should Contain     สงวนลิขสิทธิ์ © สยามโซน.คอม
    Search on Google  siamzone  สงวนลิขสิทธิ์ © สยามโซน.คอม  //*[@id="rso"]/div[1]/div[1]/div/div/div/div/div[1]/a  Siam Zone : ภาพยนตร์ เพลง ละคร ข่าวบันเทิง เนื้อเพลง ฯลฯ  เรื่องเด่นประเด็นดัง

# ค้นหาใน Chrome ด้วย keywords siamzone.ac.th
#     Search on Google  siamzone.ac.th  สงวนลิขสิทธิ์ © สยามโซน.คอม  //*[@id="rso"]/div[1]/div[1]/div/div/div/div[1]/a  Siam Zone : ภาพยนตร์ เพลง ละคร ข่าวบันเทิง เนื้อเพลง ฯลฯ  เรื่องเด่นประเด็นดัง

# ค้นหาใน Chrome ด้วย keywords สยามโซน
#     Search on Google  สยามโซน  สงวนลิขสิทธิ์ © สยามโซน.คอม  //*[@id="rso"]/div[1]/div[1]/div/div/div/div[1]/a  Siam Zone : ภาพยนตร์ เพลง ละคร ข่าวบันเทิง เนื้อเพลง ฯลฯ  เรื่องเด่นประเด็นดัง

*** Keywords ***
Open Google
    Open Browser    http://www.google.co.th    chrome
Search on Google
    [Arguments]    ${SEARCH_TEXT}   ${SEARCH_RESULT}    ${FIRST_LINK}  ${FIRST_TEXT}   ${Key_word}
    Input Text  q   ${SEARCH_TEXT}
    Press Keys  q   RETURN
    Wait Until Page Contains  ${FIRST_TEXT} 
    Click Link  ${FIRST_LINK}
    Page Should Contain     ${SEARCH_RESULT}
    Wait Until Page Contains  ${Key_word}
    Mouse Over  //*[@id="navbarSZ"]/div/div[2]
    Mouse Over  //*[@id="navbarSZ"]/div/div[2]/div/a[1]
    Click Element  //*[@id="navbarSZ"]/div/div[2]/div/a[1]