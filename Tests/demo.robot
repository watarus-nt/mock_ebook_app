*** Settings ***
Documentation     To test mock Ebook app for SharpUC Phase 5 application
Suite Setup       Open App
Suite Teardown    Close App
Resource          ../Resources/Common.robot    #Suite Teardown    Common.Close Calculator App
Resource          ../Resources/MockEbookApp.robot
Library           AppiumLibrary    timeout=10

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
${DEVICE_NAME}    WindowsPC
${PLATFORM_NAME}    Windows
${APP_ID}         jp.co.sharp.ebook.ebookapp_h35559jr9hy9m!jp.co.sharp.ebook.ebookapp
${image_Path_Of_Book_Title}    images/book3title.PNG

*** Test Cases ***
Open a book from bookshelf and add bookmark
    @{img_location} =    get image location    ${image_Path_Of_Book_Title}
    ${x_coordinate} =    set variable    @{img_location}[0]
    ${y_coordinate} =    set variable    @{img_location}[1]
    ${book_y_coordinate} =    evaluate    ${y_coordinate} - 100
    click at coordinate    ${x_coordinate}    ${book_y_coordinate}
    sleep    5s
    Switch Window
    click element    accessibility_id=button-bookmark
    click element    accessibility_id=bookmark_name
    Clear Text    accessibility_id=bookmark_name
    Input Text    accessibility_id=bookmark_name    demo_bookmard
    close all open window
