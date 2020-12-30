*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         10.0.21.65
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     Administrator
${VALID PASSWORD}  Neopath123!
${LOGIN URL}      https://${SERVER}/Config/
${WELCOME URL}    https://${SERVER}/Config/Home/Index
${ERROR URL}      https://${SERVER}/Config/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Neopath® Config: Logon

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    UserName    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    Password    ${password}

Submit Credentials
    Click Button    Entrar

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Neopath® Config: Home
