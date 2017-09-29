*** Settings ***
Documentation     To test mock Ebook app for SharpUC Phase 5 application
Suite Setup       Open App
Suite Teardown    Close App
Resource          ../Resources/Common.robot    #Suite Teardown    Common.Close Calculator App
Resource          ../Resources/MockEbookApp.robot
Resource          ../Resources/PO/Bookmark.robot



*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
${DEVICE_NAME}      WindowsPC
${PLATFORM_NAME}    Windows
${APP_ID}           jp.co.sharp.ebook.ebookapp_h35559jr9hy9m!jp.co.sharp.ebook.ebookapp


#robot -d Results -b debug.log Tests\MockEbookTest.robot

*** Test Cases ***
Open a book and add bookmark to that book
    [Documentation]  First test case
    MockEbookApp.Open Book From Bookshelf  images/book3title.PNG
    Bookmark.Open Bookmark menu pallet
    Bookmark.Add Bookmark Text  bookmark text
    Bookmark.Click Ok Button From Bookmark Pallet



