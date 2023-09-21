*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  JSONLibrary

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users?page=1&per_page=20
${Key}    0cb2a0eb5d653f1e79b634569c300d67976143f8737cd18b68ef93c632411e86
*** Test Cases ***
TC_005_Verify_Response_with_Authentication_Key
  ${response}=  GET  ${Base_Url}   params=${Key}
  Log    ${response}
  ${Status_Code}  Convert To String    ${response.status_code}

  Run Keyword If  '${Status_Code}' == '200'
  ...    Log    -PASS Authenticated with Key and given response 200 OK
  ...    ELSE
  ...    Log    -FAIL Failed to get the expected Response
