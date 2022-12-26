*** Settings ***
Resource    ../Keywords/Common.resource

Test Setup    create new session
Test Teardown    clear database
*** Test Cases ***
Validate Single record insertion with valid details
  [Tags]  smoke
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/SingleInsertionValidDetails.json  202
  Should Be Equal As Strings    ${response.text}  Alright

Validate Single record insertion with missing required fields
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/MissingRequiredFields.json  500
  validate error messsage  ${response.json()}

Validate Single record insertion with incorrect DOB format
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/InvalidDOBFormat.json  500
  validate error messsage  ${response.json()}

Validate Single record insertion with invalid Gender
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/InvalidGender.json  500
  validate error messsage  ${response.json()}

Validate Single record insertion with invalid natId
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/InvalidNatId.json  500
  validate error messsage  ${response.json()}

Validate Single record insertion with invalid Salary
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/InvalidSalary.json  500
  validate error messsage  ${response.json()}

Validate Single record insertion with invalid tax
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/InvalidTax.json  500
  validate error messsage  ${response.json()}