*** Settings ***
Library    Selenium2Library
Library    BuiltIn

*** Variables ***
${browser}  chrome
${google url}   http://www.google.com
${link3 url}    https://developers.ascendcorp.com/%E0%B9%80%E0%B8%97%E0%B8%84%E0%B8%99%E0%B8%B4%E0%B8%84%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%80%E0%B8%82%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B9%80%E0%B8%97%E0%B8%AA%E0%B9%80%E0%B8%84%E0%B8%AA-robot-framework-%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B9%88%E0%B8%B2%E0%B8%99%E0%B8%87%E0%B9%88%E0%B8%B2%E0%B8%A2-ab8c71450046
${link4 url}    https://shouldjs.github.io/
${link5 url}    https://stackoverflow.com/questions/41681163/robot-should-be-equal-as-strings

*** Keywords ***
open google
    Open Browser    ${GOOGLE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    0.3
search on google
    Input Text    name=q    Should Be Equal
    Submit Form
click link3
    Wait Until Element Is Visible   xpath=//*[@id="rso"]/div/div/div[3]/div/div/div[1]/a/h3/div
    Click Element    xpath=//*[@id="rso"]/div/div/div[3]/div/div/div[1]/a/h3/div
click link4
    Wait Until Element Is Visible   xpath=//*[@id="rso"]/div/div/div[4]/div/div/div[1]/a[1]/h3/div
    Click Element    xpath=//*[@id="rso"]/div/div/div[4]/div/div/div[1]/a[1]/h3/div
click link5
    Wait Until Element Is Visible   xpath=//*[@id="rso"]/div/div/div[5]/div/div/div[1]/a[1]/h3/div
    Click Element    xpath=//*[@id="rso"]/div/div/div[5]/div/div/div[1]/a[1]/h3/div
check web3
    Wait Until Page Contains   Should
     ${url} =  Execute Javascript  return window.location.href;
     should be equal    ${url}  ${link3 url}
check web4
    Wait Until Page Contains   Should
     ${url} =  Execute Javascript  return window.location.href;
     should be equal    ${url}  ${link4 url}
check web5
    Wait Until Page Contains   Should
     ${url} =  Execute Javascript  return window.location.href;
     should be equal    ${url}  ${link5 url}
go to back
    GO BACK

*** Testcases ***
Testcase : Search keyword on Goolge
    open google
    search on google
    click link3
    check web3
    go to back
    click link4
    check web4
    go to back
    click link5
    check web5
    go to back