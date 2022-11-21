*** Settings ***
# Import Resource & Libraries
## Variables config and base keyword
Resource            config.robot
Resource            base.robot

## Main Library
Library             AppiumLibrary                       ${DEFAULT_TIMEOUT}
Library             String

## Data
Resource            ../properties/account.robot

## Page Object
Resource            ../pageObjects/HomePage.robot
Resource            ../pageObjects/LoginPage.robot
Resource            ../pageObjects/ProductPage.robot