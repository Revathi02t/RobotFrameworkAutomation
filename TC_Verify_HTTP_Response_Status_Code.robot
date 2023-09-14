*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/

*** Test Cases ***
TC_Verify_HTTP_Response_Status_Code
  ${response}=  GET  ${Base_Url}
  Log    ${response}
  ${Status_Code}  Convert To String    ${response.status_code}

  Run Keyword If  ' ${Status_Code}' == '200'
  ...    Log    -PASS Response is 200 ok
  ...    ELSE
  ...    Log    -FAIL Not an expected Response
