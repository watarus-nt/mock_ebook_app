
*** Settings ***
Library  AppiumLibrary  timeout=10
Library  OperatingSystem
*** Keywords ***
Open App
    open application  ${APPIUM_SERVER}  alias=myApp  app=${APP_ID}  deviceName=${device_name}  platformName=${platform_name}  unicodeKeyboard=${TRUE}
    sleep  5s
    wait until element is visible  accessibility_id=button-cross-search

Close App
    close application
    run     taskkill /im "WWAHost.exe" -f -t
# TODO find a way to close all open windows instead of using taskkill


Click GUI Element
    [Documentation]     This keyword is used to click an Element on GUI by its locator
    [Arguments]         ${locator}
    wait until element is visible       ${locator}
    click element                       ${locator}

