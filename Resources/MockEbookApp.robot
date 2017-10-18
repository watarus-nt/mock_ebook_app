*** Settings ***
Library           AppiumLibrary    timeout=15
Library           ../Libraries/Common/ImageHandler.py
Library           ../Libraries/Common/MouseHandler.py
Library           OperatingSystem
Resource          ./Common.robot

*** Keywords ***
Get Page Source
    [Arguments]  ${page_name}
    [Documentation]  Get XML Page Source Of Current Working Window
    ${_source} =  get source
    create file  ${page_name}.xml   ${_source}  encoding=UTF-8

Open Book From Bookshelf By Image
    [Arguments]    ${image_Path_Of_Book_Title}
    [Documentation]    Opens a book in Bookshelf by an image which contains book's name/title
    @{img_location} =    get image location    ${image_Path_Of_Book_Title}
    ${x_coordinate} =    set variable    @{img_location}[0]
    ${y_coordinate} =    set variable    @{img_location}[1]
    ${book_y_coordinate} =    evaluate    ${y_coordinate} - 100
    click at coordinate    ${x_coordinate}    ${book_y_coordinate}
    Common.Switch Between Bookshlef And Viewer

Close Viewer
    Get Page Source     viewer
#    click element     name=Close eBook App
    click element     accessibility_id=Close
    sleep  2s
    switch window after closing a child window
    click element    accessibility_id=button-footer-menu

Test new build
#    click element  name=タイトルを検索
    input text  name=タイトルを検索    sdfasdfkljasdf


Verify Text On GUI
    [Documentation]    Verify Text On GUI
    wait until page contains element    name=すべて
    wait until page contains element    name=並び替え：
    #    element text should be    name=すべて    すべて
    wait until element is visible    name=配信された資料
    sleep    2s
    click element    accessibility_id=button-footer-menu
    sleep    2s
    click element    name=会員情報
    sleep    2s
    ${source} =    Get Source
    Create File    Bookshelf_PageSource.xml    ${source}    encoding=UTF-8
    wait until page contains element    name=会員情報
    wait until page contains element    name=会員ID: <user e-mail>
