*** Settings ***
Resource    ../Keywords/Common.resource
Library     JSONLibrary

Test Setup    create new session
*** Test Cases ***
Validate Multiple records insertion with valid details
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/MultipleInsertionValidDetails.json  202
  Should Be Equal As Strings    ${response.text}  Alright

Validate Multiple records insertion with missing required fields
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/MissingRequiredFields.json  500
  ${error_message}=  Get Value From Json    ${response.json()}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error

Validate Multiple records insertion with incorrect DOB format
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/InvalidDOBFormat.json  500
  ${error_message}=  Get Value From Json    ${response.json()}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error

Validate Multiple records insertion with invalid Gender
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/InvalidGender.json  500
  ${error_message}=  Get Value From Json    ${response.json()}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error

Validate Multiple records insertion with invalid natId
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/InvalidNatId.json  500
  ${error_message}=  Get Value From Json    ${response.json()}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error

Validate Multiple records insertion with invalid Salary
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/InvalidSalary.json  500
  ${error_message}=  Get Value From Json    ${response.json()}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error

Validate Multiple records insertion with invalid tax
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/InvalidTax.json  500
  ${error_message}=  Get Value From Json    ${response.json()}  $..error
  Should Be Equal As Strings    ${error_message[0]}   Internal Server Error