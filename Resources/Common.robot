
*** Settings ***
Library  AppiumLibrary

*** Keywords ***
Open App
    open application  ${APPIUM_SERVER}  alias=myApp  app=${APP_ID}  deviceName=${device_name}  platformName=${platform_name}
    wait until element is visible  name=eBook App

Close App
    close application
