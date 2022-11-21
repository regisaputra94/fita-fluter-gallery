*** Settings ***
Resource                    ../libraries/routers.robot

*** Variables ***
# Static Locator
${button_menu_filter}       xpath=//android.widget.Button[@content-desc="Open menu"]
${button_shopping_cart}     xpath=//android.widget.Button[contains(@content-desc, "Shopping cart")]
# Example for dinamis locator
${button_filter}            xpath=//android.widget.Button[@content-desc="{0}"]
${button_product_item}      xpath=//android.widget.Button[contains(@content-desc, "{0}")]
${list_product}             xpath=//android.widget.Button[contains(@content-desc, "Close cart")]/following-sibling::android.view.View[2]/android.view.View

${button_clear_cart}        accessibility_id=CLEAR CART


*** Keywords ***
User Can Filter By Filter Menu
    [Arguments]             ${filter_name}
    Click Element           ${button_menu_filter}
    Click Element           ${button_filter.format('${filter_name}')}

Add Product Item In Shopping Cart
    [Arguments]             ${item_name}        ${swipe_direction}=LEFT
    Swipe Horizontal Until Element Is Visible   ${button_product_item.format('${item_name}')}       ${swipe_direction}
    Wait Until Element Is Visible               ${button_product_item.format('${item_name}')}
    Click Element                               ${button_product_item.format('${item_name}')}

User Can Open Shopping Cart
    Wait Until Element Is Visible               ${button_shopping_cart}
    Click Element                               ${button_shopping_cart}

Verify Total Of Shopping Cart
    Wait Until Element Is Visible               ${list_product}

Clear Shopping Cart And Verify Cart Is Clear
    Wait Until Element Is Visible               ${button_clear_cart}
    Click Element                               ${button_clear_cart}