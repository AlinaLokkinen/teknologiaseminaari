*** Settings ***
Library        SeleniumLibrary
Variables        ../resources/variables.py

*** Test Cases ***


*** Keywords ***
Open page
    Open Browser        ${URL}        ${Browser}