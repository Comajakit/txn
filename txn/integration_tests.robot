*** Settings ***
Library    RequestsLibrary

*** Variables ***
${TXN_URL}       http://localhost:8080/api/transactions/status
${SHOP_URL}      http://localhost:8081/api/shops/status  # Update this if the actual endpoint differs

*** Test Cases ***
Test GET request to txn service
    [Documentation]    Verify that the txn service responds with status code 200
    Create Session    txn    ${TXN_URL}
    ${response}=    GET    txn    /
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal    ${response.text}    UP

Test GET request to shop service
    [Documentation]    Verify that the shop service responds with status code 200
    Create Session    shop    ${SHOP_URL}
    ${response}=    GET    shop    /
    Should Be Equal As Numbers    ${response.status_code}    200
    # Add more assertions if needed to check the response content
