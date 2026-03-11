*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/variables.robot

*** Keywords ***

Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login To System
    Input Text    xpath=//input[@type="email"]       ${USERNAME}
    Input Text    xpath=//input[@type="password"]    ${PASSWORD}
    Wait Until Element Is Enabled    xpath=//button[.//div[text()="Sign in"]]    5s
    Click Element    xpath=//button[.//div[text()="Sign in"]]

Login With Invalid Password
    Input Text    xpath=//input[@type="email"]       ${USERNAME}
    Input Text    xpath=//input[@type="password"]    ${INVALID_PASS}
    Wait Until Element Is Enabled    xpath=//button[.//div[text()="Sign in"]]    5s
    Click Element    xpath=//button[.//div[text()="Sign in"]]

Verify Login Error Message
    Wait Until Element Is Visible    xpath=//*[contains(text(),"Wrong email or password")]    5s
    Element Should Contain    xpath=//*[contains(text(),"Wrong email or password")]    Wrong email or password

Click Inprogress Tab
    Wait Until Element Is Visible    xpath=//*[text()="In progress"]    10s
    Click Element    xpath=//*[text()="In progress"]

Search Patient
    [Arguments]    ${keyword}
    Input Text    xpath=(//input[contains(@placeholder,"Patient")])    ${keyword}
    Click Element    xpath=//button[contains(.,"Search")]

Verify No Data Message
    Wait Until Page Contains    Total cases : 0    10s
    Page Should Contain         Total cases : 0

Verify Table Displayed
    Wait Until Element Is Visible    xpath=//*[contains(text(),"Test")]    10s
    Element Should Be Visible        xpath=//*[contains(text(),"Test")]

Logout From System
    Wait Until Element Is Visible    xpath=//div[text()="Log Out"]    10s
    Click Element                    xpath=//div[text()="Log Out"]