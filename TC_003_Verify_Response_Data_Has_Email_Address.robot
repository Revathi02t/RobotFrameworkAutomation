*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  JSONLibrary

*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/
${Id}  1
${email}    email
${Email_Regex}    ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$
*** Test Cases ***
TC_003_Verify_Response_Data_Has_Email_Address
  ${response}=  GET  ${Base_Url}    params=${Id}
  ${json}    Set Variable    ${response.json()}
  Log  ${json}
  ${dict}    Set Variable    ${json}[0]
  Log  ${dict}
  ${Return_Value}  Get From Dictionary    ${dict}    ${email}
  Log  ${Return_Value}
  ${Output}    Run Keyword And Return Status    Should Match Regexp    ${Return_Value}    ${Email_Regex}
  Log    ${Output}
  Run Keyword If    ${Output} == ${True}
  ...  Log To Console    -Pass    Response Data contains Email Address
  ...  ELSE    Log To Console    -Fail    Response Data has no Email Address






