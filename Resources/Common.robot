
*** Settings ***
Library  AppiumLibrary  timeout=15
Library  OperatingSystem
*** Keywords ***
Open App
    open application  ${APPIUM_SERVER}  alias=myApp  app=${APP_ID}  deviceName=${device_name}  platformName=${platform_name}  unicodeKeyboard=${TRUE}
#    sleep  3s
#    wait until page contains  書籍
     wait until page contains element  name=すべて

Close App
    close all open window

Click GUI Element
    [Documentation]     This keyword is used to click an Element on GUI by its locator
    [Arguments]         ${locator}
    wait until element is visible       ${locator}
    click element                       ${locator}

Switch Between Bookshlef And Viewer
    [Documentation]  Keyword to swith between bookshelf and viewer windows
    sleep  2s
    switch window

