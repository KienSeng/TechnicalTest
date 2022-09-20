*** Settings ***
Library     SeleniumLibrary
Resource    ../../Core/BrowserControl.robot


*** Keywords ***
Enter Customer's Details
    [Arguments]  ${firstName}  ${lastName}  ${postCode}
    ${submitButtonLocator}=  Set Variable  //button[@type='submit']

    Wait Until Element Is Enabled  ${submitButtonLocator}
    Input Text  //input[@ng-model='fName']  ${firstName}
    Input Text  //input[@ng-model='lName']  ${lastName}
    Input Text  //input[@ng-model='postCd']  ${postCode}

    Click Element  ${submitButtonLocator}
    Handle Alert  timeout=${defaultTimeout}
