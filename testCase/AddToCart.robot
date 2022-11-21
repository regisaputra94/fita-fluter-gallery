*** Settings ***
Resource                ../libraries/routers.robot
Test Timeout            ${DEFAULT_TEST_TIMEOUT}
Test Teardown           Close Application

*** Test Cases ***
User Can Add Some Items To The Shopping Cart
    [Documentation]     Test case for verify user can add some item to the shopping cart
    User Has Opened Flutter Gallery Application
    User Can Tap Shrine Banner And Direct To Login Page
    User Logged In From Login Page          ${username}     ${password}
    Add Product Item In Shopping Cart       item_name=Walter henley (white)
    Add Product Item In Shopping Cart       item_name=Shrug bag         swipe_direction=RIGHT
    User Can Open Shopping Cart
    Verify Total Of Shopping Cart
    Clear Shopping Cart And Verify Cart Is Clear