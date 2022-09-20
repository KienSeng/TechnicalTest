*** Settings ***
Library     SeleniumLibrary
Resource    ../../Core/BrowserControl.robot


*** Variables ***
${CustomerTableLocator}  //table[@class='table table-bordered table-striped']//tbody

*** Keywords ***
Search Customer
    [Arguments]  ${name}
    ${searchTextBoxLocator}=  Set Variable  //input[@ng-model='searchCustomer']
    Wait Until Element Is Enabled  ${searchTextBoxLocator}
    Input Text  ${searchTextBoxLocator}  ${name}

Delete Customer
    [Arguments]  ${firstName}  ${lastName}  ${postCode}
    ${userLocator}=  Set Variable  ${CustomerTableLocator}//td[1][text()='${firstName}']/../td[2][text()='${lastName}']/../td[3][text()='${postCode}']/..//td/button[@ng-click='deleteCust(cust)']
    Search Customer  ${firstName}
    Click Element  ${userLocator}

Verify Customer Exist
    [Arguments]  ${firstName}  ${lastName}  ${postCode}
    Search Customer  ${firstName}
    Page Should Contain Element  ${CustomerTableLocator}//td[1][text()='${firstName}']/../td[2][text()='${lastName}']/../td[3][text()='${postCode}']  message=[ERROR] ${firstName} ${lastName} not found

Verify Customer Not Exist
    [Arguments]  ${firstName}  ${lastName}  ${postCode}
    Search Customer  ${firstName}
    Page Should Not Contain Element  ${CustomerTableLocator}//td[1][text()='${firstName}']/../td[2][text()='${lastName}']/../td[3][text()='${postCode}']  message=[ERROR] ${firstName} ${lastName} is exist