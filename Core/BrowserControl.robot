*** Settings ***
Library     SeleniumLibrary
Library     String
Library     OperatingSystem


*** Variables ***
${latestChromeDriver}   ${CURDIR}${/}WebDrivers${/}chromedriver.exe
${latestFirefoxDriver}  ${CURDIR}${/}WebDrivers${/}geckodriver.exe


*** Keywords ***
Start Browser
    Create Webdriver  Chrome  alias=Chrome  executable_path=${latestChromeDriver}
    Set Global Variable  ${defaultTimeout}  5
    Set Selenium Timeout  ${defaultTimeout}
    Set Selenium Speed  0.05
    Maximize Browser Window


