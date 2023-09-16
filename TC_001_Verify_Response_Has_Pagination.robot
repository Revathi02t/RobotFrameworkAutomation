*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/
${Id}  1

*** Test Cases ***
TC_001_Verify_Response_Has_Pagination
  ${response}=  GET  ${Base_Url}    params=${Id}
  Log    ${response}
  # Validating Status Code
  ${Status_Code}  Convert To String    ${response.status_code}
  ${Return_Value}  Should Be Equal   ${Status_Code}    200

  # Validating Total pages not equal to 1.
  ${Headers}    Set Variable    ${response.headers}
  Log  ${Headers}
  ${pagination} =   Get From Dictionary  ${headers}  x-pagination-pages
  Log    ${pagination}
  Should Not Be Equal As Numbers   ${pagination}     1

  #Verifying either the next page or previous page should be present
  ${Next_Page_Value} =   Get From Dictionary  ${headers}  x-links-next
  Log    ${Next_Page_Value}
  ${Previous_Page_Value} =   Get From Dictionary  ${headers}  x-links-previous
  Log    ${Previous_Page_Value}
  ${Next_Page_Status}  Run Keyword And Return Status  Should Not Be Empty  ${Next_Page_Value}
  Log     ${Next_Page_Status}
  ${Previous_Page_Status}  Run Keyword And Return Status  Should Not Be Empty  ${Previous_Page_Value}
  Log     ${Previous_Page_Status}

  Run Keyword If  '${Next_Page_Status}' or '${Previous_Page_Status}' != 'False'
  ...    Log    -PASS Response has Pagination
  ...    ELSE
  ...    Log   -FAIL Response has only one Page. No Pagination
