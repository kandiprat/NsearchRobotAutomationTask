*** Settings ***
Resource    ../Keywords/Common.resource
Resource    ../Keywords/UserStory4.resource
Library    SeleniumLibrary
Library    String

Test Setup    Create New Session
Test Teardown    Clear Database

*** Test Cases ***
Validate book keeper is able to fetch list of natid, tax relief amount and name
  ${response}=  post end point and get response   calculator/insert    Testdata/SingleInsertion/SingleInsertionValidDetails.json  202
  Should Be Equal As Strings    ${response.text}  Alright
  ${get_response}=  get end point and get response  calculator/taxRelief  200
  Log    ${get_response.json()}
  ${get_natid}=  Get Value From Json    ${get_response.json()}   $..natid
  Should Be Equal As Strings    ${get_natid[0]}  1234$$$$
  ${get_name}=  Get Value From Json    ${get_response.json()}   $..name
  Should Be Equal As Strings    ${get_name[0]}  Prathyusha
  ${get_relief}=  Get Value From Json    ${get_response.json()}   $..relief
  Should Be Equal As Strings    ${get_relief[0]}  3300.00

Validate natid is masked from 5th character onwards with $ sign
  ${response}=  post end point and get response   calculator/insertMultiple    Testdata/MultipleInsertion/MultipleInsertionValidDetails.json  202
  Should Be Equal As Strings    ${response.text}  Alright
  ${get_response}=  get end point and get response  calculator/taxRelief  200
  ${get_natid}=  Get Value From Json    ${get_response.json()}   $..natid
  ${input_body}=  Get File    Testdata/MultipleInsertion/MultipleInsertionValidDetails.json
  ${input_body}=  Convert String To Json    ${input_body}
  ${input_natid}=  Get Value From Json    ${input_body}  $..natid
  ${length}=  Get Length    ${input_natid}

  FOR  ${i}  IN RANGE  0  ${length}
    ${masked_natid}=   get substring  ${input_natid[${i}]}  0  4
    ${masked_natid}=  Catenate  ${masked_natid}$$$$
    Should Be Equal As Strings   ${masked_natid}  ${get_natid[${i}]}
  END

Validate tax relief of person with gender male and having age at most 18
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost18Male.json  1  0

Validate tax relief of person with gender female and having age at most 18
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost18Female.json  1  500

Validate tax relief of person with gender male and having age at most 35
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost35Male.json  0.8  0

Validate tax relief of person with gender female and having age at most 35
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost35Female.json  0.8  500

Validate tax relief of person with gender male and having age at most 50
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost50Male.json  0.5  0

Validate tax relief of person with gender female and having age at most 50
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost50Female.json  0.5  500

Validate tax relief of person with gender male and having age at most 75
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost75Male.json  0.367  0

Validate tax relief of person with gender female and having age at most 75
  validate tax relief with roundoff value   Testdata/TaxRelief/Atmost75Female.json  0.367  500

Validate tax relief of person with gender male and having age at least 76
  validate tax relief with roundoff value   Testdata/TaxRelief/Atleast76Male.json  0.05  0

Validate tax relief of person with gender female and having age at least 76
  validate tax relief with roundoff value  Testdata/TaxRelief/Atleast76Female.json  0.05  500

Validate min tax relief of a person is 50
  validate tax relief with roundoff value  Testdata/TaxRelief/MinTaxRelief.json  1  0