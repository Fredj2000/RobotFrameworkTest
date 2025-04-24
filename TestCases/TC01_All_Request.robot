*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       http://localhost:3030
${id}             10
${id1}            7
${idD}            22
*** Test Cases ***
01 - Create Product Successfully
    [Tags]    POST
    Create Session    mysession    ${BASE_URL}
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${body}=       Create Dictionary    id=0    version=1    productId=Test999    name=TestProduct    price=100
    ${response}=   POST On Session   mysession   /products/product   json=${body}   headers=${HEADERS}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=       Set Variable    ${response.json()}
    Should Be Equal As Strings     ${json['productId']}    Test999
    Should Be Equal As Strings     ${json['name']}         TestProduct
    Should Be Equal As Numbers     ${json['price']}        100

02 - Get Product By ID
    [Tags]    GET
    Create Session    mysession    ${BASE_URL}
    ${response}=  GET On Session   mysession   /products/get-by-id/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    >>> CONTENT: ${response.content}

03 - Update Product
    [Tags]    PUT
    Create Session    mysession    ${BASE_URL}
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${body}=       Create Dictionary    version=2    productId=Test999    name=ahmeed    price=150
    ${response}=   PUT On Session    mysession   /products/edit/${id1}   json=${body}   headers=${HEADERS}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    >>> PRODUCT UPDATED

04 - Get All Products
    [Tags]    GET
    Create Session    mysession    ${BASE_URL}
    ${response}=  GET On Session   mysession   /products/
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    >>> PRODUCTS: ${response.content}

05 - Delete Product
    [Tags]    DELETE
    Create Session    mysession    ${BASE_URL}
    ${response}=  DELETE On Session   mysession   /products/${idD}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    >>> PRODUCT DELETED ID : ${idD}
