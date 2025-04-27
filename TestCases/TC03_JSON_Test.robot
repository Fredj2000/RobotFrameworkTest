*** Settings ***
Library           JSONLibrary
Library           OperatingSystem
Library           Collections

*** Test Cases ***
JSON TEST
    ${json_obj}=    Load Json From File    C:\\Users\\DELL\\Desktop\\Thales\\test.json
    ${name_value}=  Get Value From Json     ${json_obj}    $.name
    Should Be Equal    ${name_value[0]}    Limited Edition Ultra HD Smart TV

    ${name_value}=  Get Value From Json     ${json_obj}    $.price
    Should Be Equal As Numbers    ${name_value[0]}    1299.49

    ${city_value}=  Get Value From Json     ${json_obj}    $.address.city
    Should Be Equal As Strings    ${city_value[0]}    Techville

    ${postal_value}=  Get Value From Json     ${json_obj}    $.address.postalCode
    Should Be Equal As Numbers    ${postal_value[0]}    54321

    ${country_value}=  Get Value From Json     ${json_obj}  $.address.country["1st"]
    Should Be Equal As Strings    ${country_value[0]}    Tunisia

    ${country_value}=  Get Value From Json     ${json_obj}  $.address.country["2st"]
    Should Be Equal As Strings    ${country_value[0]}    Germany
