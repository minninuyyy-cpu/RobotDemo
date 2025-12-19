*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         https://the-internet.herokuapp.com
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     tomsmith
${VALID PASSWORD}    SuperSecretPassword!
${LOGIN URL}      ${SERVER}/login
${WELCOME URL}    ${SERVER}/secure
${ERROR URL}      ${SERVER}/login

*** Keywords ***
Open Browser To Login Page
    Run Keyword If    '${BROWSER}' == 'Chrome'    Open Chrome With Options
    Run Keyword If    '${BROWSER}' != 'Chrome'    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Open Chrome With Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-software-rasterizer
    Call Method    ${options}    add_argument    --remote-debugging-port=9222
    Open Browser    ${LOGIN URL}    ${BROWSER}    options=${options}

Login Page Should Be Open
    Title Should Be    The Internet

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Logout

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    The Internet