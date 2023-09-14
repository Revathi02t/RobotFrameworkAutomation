*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  JSONLibrary
Library  JSONValidator
Library  JSONSchemaLibrary schemas

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/
${Schema_File}  TestSuite/Schema_File.json
*** Test Cases ***
TC_004_Verify_Response_Has_Similar_Attributes
  ${response}=  GET  ${Base_Url}
  ${json}    Set Variable    ${response.json()}
  Log  ${json}
  ${json_File}    Set Variable    ${json}[0]
  Validate Json By Schema File    ${Schema_File}   ${json_File}










