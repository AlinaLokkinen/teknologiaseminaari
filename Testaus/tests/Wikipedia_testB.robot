*** Settings ***
Library        SeleniumLibrary
Variables        ../resources/variables.py

*** Test Cases ***
Random article
    [Documentation]        
    ...    Clicks on the "random article" link on the left side of the main page
    ...    Checks to see the front page "Suositeltu artikkeli" is no longer visible after clicking on link
    ...    Returns to the front page and checks "Suositeltu artikkeli" is visible again
    Open page
    Wait Until Element Is Visible        id=p-interaction
    Click Link        Satunnainen artikkeli
    Sleep        2s
    Page Should Not Contain        Suositeltu artikkeli
    Sleep        2s
    Click Link        Etusivu
    Page Should Contain        Suositeltu artikkeli
    Close Browser

Shortened URL
    [Documentation]        
    ...    Checks to see if a pop up is rendered when "Shortened URL" link is clicked
    Open page
    Click Link        Lyhennä URL-osoite
    Wait Until Element Is Visible        id=ooui-1        
    Page Should Contain        Voit myös käyttää tätä vaihtoehtoista URL-osoitetta:
    Sleep        2s
    Close Browser

Download PDF
    [Documentation]        
    ...    Downloads a page as a PDF 
    ...    Click on "random article" to download something other than the front page
    Open page
    Click Link        Satunnainen artikkeli
    Click Link        Lataa PDF-tiedostona
    Wait Until Element Is Visible       //span[contains(text(), "Lataa")]          
    Click Element        //span[contains(text(), "Lataa")]
    Sleep        2s
    Close Browser


*** Keywords ***
Open page
    Open Browser        ${URL}        ${Browser}


    