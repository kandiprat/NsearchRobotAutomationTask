*** Settings ***
Library   RequestsLibrary
Library     OperatingSystem
Library     JSONLibrary
Library     SeleniumLibrary

*** Keywords ***

create new session
   Create Session    localhost  url=http://localhost:8080/

clear database
   POST    url=http://localhost:8080/calculator/rakeDatabase   expected_status=200

post end point and get response
  [Arguments]  ${endPoint}  ${inputDataPath}  ${expected_status_code}
  &{Header}=  create dictionary  Content-Type=application/json
  ${body}=  GET File  ${inputDataPath}
  ${response}=  POST On Session   localhost  url=${endPoint}  headers=${Header}  data=${body}  expected_status=${expected_status_code}
  [Return]    ${response}

validate error messsage
  [Arguments]    ${body}
  ${error_message}=  Get Value From Json    ${body}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error

Launch browser
  Open Browser    http://localhost:8080/    Chrome      executable_path=${CURDIR}/chromedriver.exe  options=add_argument("--ignore-certificate-errors");add_argument("--start-maximized")
    Set Selenium Implicit Wait   60s

validate page contains text
  [Arguments]    @{textList}
  FOR    ${text}  IN  @{textList}
    Page Should Contain    ${text}
  END