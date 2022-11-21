*** Settings ***
Resource                    ../libraries/routers.robot

*** Variables ***
# Static Locator
${button_menu_filter}       xpath=//android.widget.Button[@content-desc="Open menu"]
${button_shopping_cart}     xpath=//android.widget.Button[contains(@content-desc, "Shopping cart")]
${list_product}             //android.widget.Button[contains(@content-desc, "Close cart")]/following-sibling::android.view.View[2]/android.view.View
${text_total}               xpath=//android.view.View[contains(@content-desc,"TOTAL")]
${text_subtotal}            xpath=//android.view.View[contains(@content-desc, "Subtotal")]
${text_shipping}            xpath=//android.view.View[contains(@content-desc, "Shipping")]
${text_tax}                 xpath=//android.view.View[contains(@content-desc, "Tax")]
# Example for dinamis locator
${button_filter}            xpath=//android.widget.Button[@content-desc="{0}"]
${button_product_item}      xpath=//android.widget.Button[contains(@content-desc, "{0}")]

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
    ${count}	    Get Matching Xpath Count    ${list_product}
    Capture Page Screenshot
    Set Test Variable             ${total_product_price}      0
    FOR  ${index}  IN RANGE  1  ${count}+1  # Method to evaluate total price by item
        ${price}                    Get Element Attribute   //android.widget.Button[contains(@content-desc, "Close cart")]/following-sibling::android.view.View[2]/android.view.View[${INDEX}]      content-desc
        ${product_price}            Get Product Price      ${price}
        ${total_product_price}      Evaluate    ${total_product_price}+${product_price}
    END

    ${shipping_fee}                 Get Element Attribute   ${text_shipping}        content-desc
    ${shipping_fee}                 Get Product Price       ${shipping_fee}
    ${tax_fee}                      Get Element Attribute   ${text_tax}             content-desc
    ${tax_fee}                      Get Product Price       ${tax_fee}

    ${text_total_product_price}     Get Element Attribute       ${text_subtotal}                    content-desc
    ${text_total_product_price}     Get Product Price           ${text_total_product_price}

    Should Be Equal                 ${text_total_product_price}     ${total_product_price}  # Verify total price and result of evaluate loop by item
    ${total_price}                  Evaluate                        ${total_product_price}+${shipping_fee}+${tax_fee}
    ${text_total_price}             Get Element Attribute           ${text_total}           content-desc
    ${text_total_price}             Get Product Price               ${text_total_price}
    Should Be Equal                 ${text_total_price}             ${total_price}

Get Product Price
    [Arguments]             ${string_price}
    ${product_price}        Remove String Using Regexp      ${string_price}         ^[^$]*
    ${product_price}        Remove String                   ${product_price}        $
    ${product_price}        Convert To Number               ${product_price}
    [Return]                ${product_price}

Clear Shopping Cart And Verify Cart Is Clear
    Wait Until Element Is Visible               ${button_clear_cart}
    Click Element                               ${button_clear_cart}
    Verify Cart Is Empty

Verify Cart Is Empty
    User Can Open Shopping Cart
    ${expected_value}                           Convert To Number       0.0
    Wait Until Element Is Visible               ${text_total}
    ${total}      Get Element Attribute         ${text_total}           content-desc
    ${total}      get product price             ${total}
    Should Be Equal                             ${total}                ${expected_value}
