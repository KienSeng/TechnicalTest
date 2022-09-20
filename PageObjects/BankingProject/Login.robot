*** Settings ***
Library     SeleniumLibrary
Resource    ../../Core/BrowserControl.robot


*** Keywords ***
# Click on different type of user login based on the variable pass in from test case
Login As
    [Arguments]  ${login}
    # For multilingual support, do not use label xpath, else it will failed when switching language
    ${locator}=  Set Variable  //button[@ng-click='${login}()']
    Wait Until Element Is Enabled  ${locator}
    Click Element  ${locator}

