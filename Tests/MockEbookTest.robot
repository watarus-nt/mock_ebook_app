*** Settings ***
Documentation     To test mock Ebook app for SharpUC Phase 5 application
#Suite Setup       Open App
#Suite Teardown    Close App
Resource          ../Resources/Common.robot    #Suite Teardown    Common.Close Calculator App
Resource          ../Resources/MockEbookApp.robot
Library           AppiumLibrary    timeout=10
Library           ../Libraries/ApplicationUnderTestRelated/mockEbookApp.py


*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
${DEVICE_NAME}      WindowsPC
${PLATFORM_NAME}    Windows
${APP_ID}           jp.co.sharp.ebook.ebookapp_h35559jr9hy9m!jp.co.sharp.ebook.ebookapp


#robot -d Results -b debug.log Tests\MockEbookTest.robot

*** Test Cases ***
Open a book from bookshelf
    open application by appium  ${APPIUM_SERVER}    ${APP_ID}      ${DEVICE_NAME}      ${PLATFORM_NAME}

