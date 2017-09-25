*** Settings ***
Library     AppiumLibrary     timeout=10


*** Keywords ***
Open Book From Bookshelf
    [Arguments]     ${locator}
    wait until page contains element          ${locator}
    ${location} =  get element location    ${locator}
    ${y_location} =  evaluate  ${location['y']} + 50
#    tap              ${location['x']}      ${location['y']}