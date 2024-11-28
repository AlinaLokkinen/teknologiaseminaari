# *** Settings ***
# Library        SeleniumLibrary
# Variables        ../resources/variables.py

# *** Test Cases ***
# Unsuccessful login
#     Open page
#     Click Link        Kirjaudu sisään
#     Input Text        name=wpName        ${username}
#     Input Text        name=wpPassword        ${badPassword}
#     Click Button        //button[contains(text(), "Kirjaudu sisään")]
#     Page Should Contain        Virheellinen käyttäjänimi tai salasana
#     Close Browser

# Succesful login
#     Open page
#     Click Link        Kirjaudu sisään
#     Input Text        name=wpName        ${username}
#     Input Text        name=wpPassword        ${goodPassword}
#     Click Button        //button[contains(text(), "Kirjaudu sisään")]
#     Page Should Contain        Tervetuloa Wikipediaan
#     Close Browser

# *** Keywords ***
# Open page
#     Open Browser        ${URL}        ${Browser}