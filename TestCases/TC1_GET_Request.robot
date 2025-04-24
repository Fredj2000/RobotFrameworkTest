*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       http://localhost:3030
${ID}             1

*** Test Cases ***
Get Product By ID
    Create Session    mysession    ${BASE_URL}

    ${response}=      GET On Session    mysession    /products/get-by-id/${ID}

    # Log response details
    Log To Console    >>> STATUS: ${response.status_code}
    Log To Console    >>> CONTENT: ${response.content}
    Log To Console    >>> HEADERS: ${response.headers}
    Should Be Equal As Integers    ${response.status_code}    200

