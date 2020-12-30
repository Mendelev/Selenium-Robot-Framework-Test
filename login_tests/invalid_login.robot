*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***                          USER NAME        PASSWORD                       MESSAGE    
Invalid Username                            invalid          ${VALID PASSWORD}              Ocorreu um erro durante esta operação. Detalhes: "Invalid User"
Invalid Password                            ${VALID USER}    invalid                        Ocorreu um erro durante esta operação. Detalhes: "The supplied credential is invalid."
Invalid Username And Password               invalid          whatever                       Ocorreu um erro durante esta operação. Detalhes: "Invalid User"
Invalid Password with few characters        ${VALID USER}    1a2b                           Ocorreu um erro durante esta operação. Detalhes: "The supplied credential is invalid."
Invalid Password with a lot of characters   ${VALID USER}    SenhaInvalida12345678@#$%¨&*   Ocorreu um erro durante esta operação. Detalhes: "The supplied credential is invalid."


*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}    ${message}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed    ${message}

Login Should Have Failed
    [Arguments]   ${message}
    Element Text Should Be    class:Error  ${message}
