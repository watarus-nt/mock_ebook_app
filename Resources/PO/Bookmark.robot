*** Settings ***
Documentation     Bookmark related actions
Library           AppiumLibrary    timeout=10
Library           ../../Libraries/Common/KeyboardHandler.py
Library           ../../Libraries/Common/StringHandler.py

*** Variables ***
${bookmark_icon_top_nav} =  accessibility_id=button-bookmark
${bookmark_text_field} =   accessibility_id=bookmark_name

*** Keywords ***
Open Bookmark menu pallet
    click element    ${bookmark_icon_top_nav}

Add Bookmark Text
    [Arguments]     ${input_text}
    click element    ${bookmark_text_field}
    Clear Text    ${bookmark_text_field}
    Input Text    ${bookmark_text_field}    ${input_text}
    Choose Bookmark Color

Choose Bookmark Color
    Move Between Bookmark Color  SHIFT_TAB
    Move Between Bookmark Color  SHIFT_TAB

Move Between Bookmark Color
    [Documentation]  Press TAB or SHIFT + TAB to move between bookmark's colors
    [Arguments]  ${key}

    ${check_input_key_1} =  validate input param  TAB  ${key}
    ${check_input_key_2} =  validate input param  SHIFT_TAB  ${key}

    RUN KEYWORD IF  ${check_input_key_1} == 0  PRESS TAB HOTKEY
    RUN KEYWORD IF  ${check_input_key_2} == 0  PRESS SHFIT+TAB HOTKEY
    comment  Sleep 1s to see whether pointer moves or not
    sleep  1s

Click Ok Button From Bookmark Pallet
    click element  name=保存

Press TAB hotkey
    press TAB

press SHFIT+TAB hotkey
    press SHFIT TAB
