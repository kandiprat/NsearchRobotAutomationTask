*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    OperatingSystem
Resource    ../Keywords/Common.resource

*** Keywords ***




calculate tax relief
  [Arguments]  ${path}  ${variable}  ${bonus}
  ${input_json}=  get file  ${path}
  ${input_json}=  Convert String To Json     ${input_json}
  ${salary}=  Get Value From Json    ${input_json}  $..salary
  ${tax_paid}=  Get Value From Json    ${input_json}  $..tax
  ${tax_relief}=  Evaluate    ((${salary[0]}-${tax_paid[0]})*${variable})+${bonus}
  ${tax_relief}=  Evaluate  round(${tax_relief})
  ${tax_relief}=  Evaluate    "%.2f" % ${tax_relief}
  [Return]    ${tax_relief}

calculate min tax relief
  [Arguments]  ${path}  ${variable}  ${bonus}
  ${input_json}=  get file  ${path}
  ${input_json}=  Convert String To Json     ${input_json}
  ${salary}=  Get Value From Json    ${input_json}  $..salary
  ${tax_paid}=  Get Value From Json    ${input_json}  $..tax
  ${tax_relief}=  Evaluate    ((${salary[0]}-${tax_paid[0]})*${variable})+${bonus}
  ${tax_relief}=  Evaluate  round(${tax_relief})
  ${tax_relief}=  Set Variable If    ${tax_relief}<50  50
  ${tax_relief}=  Evaluate    "%.2f" % ${tax_relief}
  [Return]    ${tax_relief}

validate tax relief with roundoff value
    [Arguments]  ${path}  ${variable}  ${bonus}
  ${tax_relief}=  calculate tax relief   ${path}  ${variable}  ${bonus}
  ${response}=  post end point and get response   calculator/insert    ${path}  202
  Should Be Equal As Strings    ${response.text}  Alright
  ${get_response}=  get end point and get response  calculator/taxRelief  200
  ${actual_tax_relief}=  Get Value From Json  ${get_response.json()}  $..relief
  Should Be Equal As Strings    ${tax_relief}   ${actual_tax_relief[0]}

validate min tax relief with roundoff value
    [Arguments]  ${path}  ${variable}  ${bonus}
  ${tax_relief}=  calculate min tax relief   ${path}  ${variable}  ${bonus}
  ${response}=  post end point and get response   calculator/insert    ${path}  202
  Should Be Equal As Strings    ${response.text}  Alright
  ${get_response}=  get end point and get response  calculator/taxRelief  200
  ${actual_tax_relief}=  Get Value From Json  ${get_response.json()}  $..relief
  Should Be Equal As Strings    ${tax_relief}   ${actual_tax_relief[0]}