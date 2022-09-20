*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../Core/BrowserControl.robot


*** Keywords ***
#  Set locator based on the tab name pass in from test case, then click on the corresponding button
Click Tab
    [Arguments]  ${tab}
    ${tab}=  Convert To Lower Case  ${tab}
    # For multilingual support, do not use label xpath, else it will failed when switching language
    ${locator}=  Set Variable If
    ...  '${tab}' == 'add customer'  //button[@ng-click='addCust()']
    ...  '${tab}' == 'open account'  //button[@ng-click='openAccount()']
    ...  '${tab}' == 'customers'  //button[@ng-click='showCust()']

    Wait Until Element Is Enabled  ${locator}
    Click Element  ${locator}