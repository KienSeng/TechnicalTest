*** Settings ***
Resource    ../../Core/BrowserControl.robot
Resource    ../../PageObjects/BankingProject/Login.robot
Resource    ../../PageObjects/BankingProject/Manager.robot
Resource    ../../PageObjects/BankingProject/AddCust.robot
Resource    ../../PageObjects/BankingProject/List.robot
Resource    ../../PageObjects/BankingProject/Customer.robot
Resource    ../../PageObjects/BankingProject/Account.robot

Library     SeleniumLibrary

Test Setup  Start Browser
Test Teardown  Close All Browsers


*** Variables ***
${url}  https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login


*** Test Cases ***
Q1
    Go To  ${url}
    Login As  manager
    Click Tab  Add Customer
    Enter Customer's Details  Christopher  Connely  L789C349
    Enter Customer's Details  Frank  Christopher  A897N450
    Enter Customer's Details  Christopher  Minka  M098Q585
    Enter Customer's Details  Connely  Jackson  L789C349
    Enter Customer's Details  Jackson  Frank  L789C349
    Enter Customer's Details  Minka  Jackson  A897N450
    Enter Customer's Details  Jackson  Connely  L789C349
    Enter Customer's Details  Lawrence  Zimmerman  L789C349
    Enter Customer's Details  Mariotte  Tova  L789C349

    Click Tab  Customers

    Verify Customer Exist  Christopher  Connely  L789C349
    Verify Customer Exist  Frank  Christopher  A897N450
    Verify Customer Exist  Christopher  Minka  M098Q585
    Verify Customer Exist  Connely  Jackson  L789C349
    Verify Customer Exist  Jackson  Frank  L789C349
    Verify Customer Exist  Minka  Jackson  A897N450
    Verify Customer Exist  Jackson  Connely  L789C349
    Verify Customer Exist  Lawrence  Zimmerman  L789C349
    Verify Customer Exist  Mariotte  Tova  L789C349

    Click Tab  Customers

    Delete Customer  Jackson  Frank  L789C349
    Delete Customer  Christopher  Connely  L789C349

    Click Tab  Customers

    Verify Customer Not Exist  Jackson  Frank  L789C349
    Verify Customer Not Exist  Christopher  Connely  L789C349

Q2
    Go To  ${url}
    Login As  customer
    Select Customer By Name  Hermoine Granger
    Select Account  1003
    Verify Account Balance Is  0

    ${balance}=  Get Account Balance
    Deposit  50000
    Verify Account Balance After  deposit  ${balance}  50000

    ${balance}=  Get Account Balance
    Withdrawl  3000
    Verify Account Balance After  withdrawl  ${balance}  3000

    ${balance}=  Get Account Balance
    Withdrawl  2000
    Verify Account Balance After  withdrawl  ${balance}  2000

    ${balance}=  Get Account Balance
    Deposit  5000
    Verify Account Balance After  deposit  ${balance}  5000

    ${balance}=  Get Account Balance
    Withdrawl  10000
    Verify Account Balance After  withdrawl  ${balance}  10000

    ${balance}=  Get Account Balance
    Withdrawl  15000
    Verify Account Balance After  withdrawl  ${balance}  15000

    ${balance}=  Get Account Balance
    Deposit  1500
    Verify Account Balance After  deposit  ${balance}  1500