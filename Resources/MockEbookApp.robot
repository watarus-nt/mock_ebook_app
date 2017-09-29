*** Settings ***
Library     AppiumLibrary     timeout=15
Library     ../Libraries/Common/ImageHandler.py
Library     ../Libraries/Common/MouseHandler.py

*** Keywords ***
Open Book From Bookshelf
    [Documentation]  Opens a book in Bookshelf by an image which contains book's name/title
    [Arguments]     ${image_Path_Of_Book_Title}
    @{img_location} =    get image location    ${image_Path_Of_Book_Title}
    ${x_coordinate} =    set variable    @{img_location}[0]
    ${y_coordinate} =    set variable    @{img_location}[1]
    ${book_y_coordinate} =    evaluate    ${y_coordinate} - 100
    click at coordinate    ${x_coordinate}    ${book_y_coordinate}
    Wait For Viewer To Be Ready


Wait For Viewer To Be Ready
    [Documentation]  After clicking on a book in Bookshelf, Viewer will be opened in new window. We will wait a litte bit before switching into the view
    sleep    3s
    switch window