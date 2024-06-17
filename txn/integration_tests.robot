*** Settings ***
Library    RequestsLibrary

*** Variables ***
${TXN_BASE_URL}   http://localhost:8080
${SHOP_BASE_URL}  http://localhost:8081

*** Test Cases ***
Test GET request to txn service
    [Documentation]    Verify that the txn service responds with status code 200
    Create Session    txn    ${TXN_BASE_URL}
    ${response}=    GET On Session    txn    /api/transactions/status
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal    ${response.text}    UP

Test GET request to shop service
    [Documentation]    Verify that the shop service responds with status code 200
    Create Session    shop    ${SHOP_BASE_URL}
    ${response}=    GET On Session    shop    /api/shops/status
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal    ${response.text}    UP
