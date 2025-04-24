*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       http://localhost:3030

*** Test Cases ***
Create Product Successfully
    [Tags]    API    POST

    Create Session    mysession    ${BASE_URL}
    ${body}=    Create Dictionary   id=0   version=10   productId=test   name=test   price=110
    ${headers}=  Create Dictionary   Content-Type=application/json

    ${response}=  POST On Session   mysession   /products/product   json=${body}   headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200

    ${json}=    Convert To Dictionary    ${response.json()}
    Should Be Equal As Strings    ${json['productId']}    test
    Should Be Equal As Strings    ${json['name']}         test
    Should Be Equal As Numbers    ${json['price']}        110
    Log To Console    >>> CONTENT: ${response.content}

