*** Settings ***
Library           AppiumLibrary    timeout=15
Library           OperatingSystem
Library           ../Libraries/Common/ImageHandler.py
Resource          ./Common.robot

*** Keywords ***
Get Page Source
    [Arguments]  ${page_name}
    [Documentation]  Get XML Page Source Of Current Working Window
    ${_source} =  get source
    create file  ${page_name}.xml   ${_source}  encoding=UTF-8

Open Book From Bookshelf By Locator
    [Arguments]
    [Documentation]


Test new build
    click element  name=タイトルを検索
    input text  name=タイトルを検索    sdfasdfkljasdf
    ${_source} =  get source
    create file  bs_1.xml   ${_source}  encoding=UTF-8
    ${location} =  get element location  name=購入日が新しい
    ${attributes} =  get element attribute  name=購入日が新しい    value
    click image  images/dropdown_1.PNG
    ${_source} =  get source
    create file  bs_2.xml   ${_source}  encoding=UTF-8
#    click a point    ${location['x']}  ${location['y']}
#    click element  name=読んだ日が新しい
#    click element  name=アプ
