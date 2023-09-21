*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  JSONLibrary


*** Variables ***
${Base_Url}  http://gorest.co.in/public/v2/users/

*** Test Cases ***
TC_004_Verify_Response_Has_Similar_Attributes
  ${response}=  GET  ${Base_Url}
  ${json}    Set Variable    ${response.json()}
  Log  ${json}
  ${dict}    Set Variable    ${json[0]}
  ${Keys}    Get Dictionary Keys  ${dict}
  Log    ${Keys}
  FOR    ${i}    IN    @{json}
      ${i_Keys}    Get Dictionary Keys  ${i}
      Log    ${i_Keys}
      Lists Should Be Equal     ${Keys}    ${i_Keys}
          Log    List Attributes are Same
          Continue For Loop
      ELSE
          Log    Attributes are not Same
          Exit For Loop
  END









