*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  JSONLibrary

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/
${Id}  1
${Schema_File}  C:/Users/.../.../TestAutomation/Automation/TestSuite/Schema_File.json

*** Test Cases ***
TC_002_Verify_Response_Has_Valid_Json_Data
  ${response}=  GET  ${Base_Url}    params=${Id}
  Log    ${response}
  ${json_File}    Set Variable    ${response.json()}
  Log  ${json_File}
  ${Output}  Run Keyword And Return Status   Validate Json by Schema  ${Schema_File}  ${json_File}
  Log  ${Output}
  Run Keyword If    ${Output} == ${True}
  ...  Log To Console    -Pass    Response is in a valid JSON format.
  ...  ELSE    Log To Console    -Fail    Response is not a valid JSON










