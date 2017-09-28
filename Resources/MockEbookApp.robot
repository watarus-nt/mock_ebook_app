*** Settings ***
Library     AppiumLibrary     timeout=10
Library     ../Libraries/Common/ImageHandler.py
Library     ../Libraries/Common/MouseHandler.py

*** Keywords ***
Open Book From Bookshelf
    [Arguments]     ${image_Path_Of_Book_Title}
    @{img_location} =   get image location  ${image_Path_Of_Book_Title}
    ${x_coordinate} =   set variable  @{img_location}[0]
    ${y_coordinate} =   set variable  @{img_location}[1]

    ${book_y_coordinate} =  evaluate  ${y_coordinate} - 100
    click at coordinate  ${x_coordinate}  ${book_y_coordinate}
    sleep  10s