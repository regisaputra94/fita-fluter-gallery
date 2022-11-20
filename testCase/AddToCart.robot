*** Settings ***
Resource                ../libraries/routers.robot
Test Timeout            ${DEFAULT_TEST_TIMEOUT}
Test Teardown           Close Application

*** Test Cases ***
User Can Add Some Items To The Shopping Cart
    [Documentation]     Test case for verify user can add some item to the shopping cart
    User Has Opened Flutter Gallery Application