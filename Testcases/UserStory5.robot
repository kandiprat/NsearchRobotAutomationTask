*** Settings ***
Resource    ../Constants/UserStory5.resource
Resource    ../Keywords/Common.resource
Library    SeleniumLibrary

Test Setup    Launch browser
Test Teardown    Clear Database

*** Test Cases ***
Validate color of Dispense Now button
  Wait Until Page Contains  The Oppenheimer Project
  Scroll Element Into View  ${dispense_now_button}
  ${background_color}=  Execute Javascript  return window.getComputedStyle(document.getElementsByClassName("btn btn-danger btn-block")[0]).getPropertyValue('background-color');
  log  ${background_color}
  Should Be Equal As Strings    ${background_color}   rgb(200, 35, 51)

Validate text on Dispense Now button
  Wait Until Element Is Visible    ${dispense_now_button}
  ${text}=  Get Text    ${dispense_now_button}
  Should Be Equal As Strings   ${text}  Dispense Now

Validate click action on Dispense Now button navigates Governer to a page Cash dispensed
  Wait Until Page Contains  The Oppenheimer Project
  Scroll Element Into View  ${dispense_now_button}
  Click Element   ${dispense_now_button}
  Page Should Contain Element  ${cash_dispensed_text}

Validate navigated dispense page path
  Wait Until Page Contains  The Oppenheimer Project
  Scroll Element Into View  ${dispense_now_button}
  Click Element   ${dispense_now_button}
  location should contain  ${url_cash_dispensed}
