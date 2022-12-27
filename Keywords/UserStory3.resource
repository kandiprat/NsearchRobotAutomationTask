*** Settings ***
Resource    ../Constants/UserStory3.resource
Library    SeleniumLibrary
*** Keywords ***

validate tax relief table is displayed
    Click Button  ${refresh_tax_relief_table}
    Sleep    2s
    Element Should Be Visible    ${NatId_text}
    Element Should Be Visible    ${Relief}

validate tax relief table is not displayed
    Click Button  ${refresh_tax_relief_table}
    Sleep    2s
    Element Should Not Be Visible    ${NatId_text}
    Element Should Not Be Visible    ${Relief}