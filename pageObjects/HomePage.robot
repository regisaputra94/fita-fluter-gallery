*** Settings ***
Resource                   ../libraries/routers.robot

*** Variables ***
${banner_slider}           xpath=//android.widget.HorizontalScrollView
${banner_shrine}           xpath=//android.view.View[contains(@content-desc, 'Shrine')]

*** Keywords ***
User Can Tap Shrine Banner And Direct To Login Page
    [Documentation]        Keyword for user can tap shrine banner and diret to login page
    Swipe Horizontal Element Until Element Is Visible   ${banner_slider}    ${banner_shrine}    LEFT
    Click Element                                       ${banner_shrine}
