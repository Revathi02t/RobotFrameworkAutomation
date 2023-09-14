*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/

*** Test Cases ***
TC_001_Verify_Response_Has_Pagination
  ${response}=  GET  ${Base_Url}
  Log    ${response}
  # Validating Status Code
  ${Status_Code}  Convert To String    ${response.status_code}
  ${Return_Value1}   Run Keyword And Return Status    Should Be Equal   ${Status_Code}    200
  Log    ${Return_Value1}
  # Validating Total pages in response not equal to 1
  ${headers}    Set Variable    ${response.headers}
  Log  ${headers}
  ${pagination} =   Get From Dictionary  ${headers}  x-pagination-pages
  Log    ${pagination}
  ${Return_Value2}    Run Keyword And Return Status  Should Not Be Equal As Numbers   ${pagination}     1
  Log    ${Return_Value2}

  Run Keyword If  '${Return_Value1}' == '${Return_Value2}'
  ...    Log    -PASS Response has Pagination
  ...    ELSE
  ...    Log   -FAIL Response has only one Page. No Pagination
