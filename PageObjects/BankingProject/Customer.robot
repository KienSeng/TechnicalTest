*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../Core/BrowserControl.robot


*** Keywords ***
Select Customer By Name
    [Arguments]  ${name}
    Wait Until Page Contains Element  id:userSelect
    Select From List By Label  id:userSelect  ${name}
    Click Element  //button[@type='submit']