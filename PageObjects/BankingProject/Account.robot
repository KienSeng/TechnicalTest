*** Settings ***
Library     SeleniumLibrary
Resource    ../../Core/BrowserControl.robot


*** Variables ***
${accountBalance}  //div[@ng-hide='noAccount']/strong[@class='ng-binding'][2]
${transactions}  //button[@ng-click='transactions()']
${depositButton}  //button[@ng-click='deposit()']
${withdrawlButton}  //button[@ng-click='withdrawl()']
${amountTextBox}  //input[@ng-model='amount']
${confirmButton}  //button[@type='submit']

*** Keywords ***
Select Account
    [Arguments]  ${accountNumber}
    Wait Until Element Is Enabled  id:accountSelect
    Select From List By Label  id:accountSelect  ${accountNumber}

Deposit
    [Arguments]  ${amount}
    Wait Until Element Is Enabled  ${depositButton}
    Click Element  ${depositButton}
    Wait Until Page Contains Element  //form[@ng-submit='deposit()']

    Enter Amount To TextBox  ${amount}
    Click Element  ${confirmButton}
    Wait For Successful  deposit

Withdrawl
    [Arguments]  ${amount}
    Wait Until Element Is Enabled  ${withdrawlButton}
    Click Element  ${withdrawlButton}
    Wait Until Page Contains Element  //form[@ng-submit='withdrawl()']

    Enter Amount To TextBox  ${amount}
    Click Element  ${confirmButton}
    Wait For Successful  withdrawl

Enter Amount To TextBox
    [Arguments]  ${amount}
    Wait Until Element Is Visible  ${amountTextBox}
    Input Text  ${amountTextBox}  ${amount}

Get Account Balance
    ${actualBalance}=  Get Text  ${accountBalance}
    ${actualBalance}=  Convert To Integer  ${actualBalance}
    [Return]  ${actualBalance}

Verify Account Balance Is
    [Arguments]  ${balance}
    ${actualBalance}=  Get Account Balance
    Log To Console  Account balance: ${actualBalance}
    Should Be Equal As Integers  ${actualBalance}  ${balance}

Verify Account Balance After
    [Arguments]  ${action}  ${initialAmount}  ${amount}
    ${actualBalance}=  Get Account Balance
    ${expectedBalance}=  Set Variable If
    ...  '${action}' == 'deposit'  ${${initialAmount}+${amount}}
    ...  '${action}' == 'withdrawl'  ${${initialAmount}-${amount}}

    Should Be Equal As Integers  ${actualBalance}  ${expectedBalance}
    Log To Console  Action: ${action} ${amount}
    Log To Console  Balance after: ${actualBalance}
    Log To Console  ---------------------------------------------

Wait For Successful
    [Arguments]  ${action}
#   This will fail if the language of the page is not in english or the label is changed
    ${locator}=  Set Variable If
    ...  '${action}' == 'deposit'  //span[@ng-show='message'][text()='Deposit Successful']
    ...  '${action}' == 'withdrawl'  //span[@ng-show='message'][text()='Transaction successful']
    Wait Until Page Contains Element  ${locator}