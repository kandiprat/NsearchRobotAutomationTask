*** Settings ***
Resource    ../Keywords/Common.resource
Resource    ../Constants/UserStory3.resource
Library    SeleniumLibrary
Resource    ../Keywords/UserStory3.resource

Test Setup    Launch browser
Test Teardown    Run Keywords    Clear Database
...  AND     Close browser


*** Test Cases ***
Validate CSV file upload is successful with single record details
  wait until element is enabled  ${upload_CSV_file}
    choose file  ${upload_CSV_file}  ${CSV_file_single_row}
    validate tax relief table is displayed
    validate page contains text   @{valid_CSV_text_element}

Validate CSV file upload is successful with multiple record details
  wait until element is enabled  ${upload_CSV_file}
    choose file  ${upload_CSV_file}  ${CSV_file_multiple_rows}
    validate tax relief table is displayed
    validate page contains text   @{valid_CSV_text_elements}

Validate CSV file upload is not successful with missing headers
  wait until element is enabled  ${upload_CSV_file}
    choose file  ${upload_CSV_file}  ${CSV_file_with_missing_headers}
    validate tax relief table is not displayed

Validate CSV file upload is not successful with invalid header names
  wait until element is enabled  ${upload_CSV_file}
    choose file  ${upload_CSV_file}  ${CSV_file_with_invalid_headers}
    validate tax relief table is not displayed

Validate file upload is not successful when file type is invalid
  wait until element is enabled  ${upload_CSV_file}
    choose file  ${upload_CSV_file}  ${Invalid_file_type}
    validate tax relief table is not displayed