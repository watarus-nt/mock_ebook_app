
*** Settings ***

*** Keywords ***
Open App
    open application  ${APPIUM_SERVER}  alias=myApp  app=${APP_ID}  deviceName=${device_name}  platformName=${platform_name}  unicodeKeyboard=${TRUE}
    wait until element is visible  accessibility_id=button-cross-search

Close App
    close application


Click GUI Element
    [Documentation]     This keyword is used to click an Element on GUI by its locator
    [Arguments]         ${locator}
    wait until element is visible       ${locator}
    click element                       ${locator}

