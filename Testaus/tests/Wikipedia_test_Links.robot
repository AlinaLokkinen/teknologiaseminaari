*** Settings ***
Library        SeleniumLibrary
Variables        ../resources/variables.py

*** Test Cases ***
Follow links
    [Documentation]        
    ...    Click links on different pages and make sure they redirect to new pages
    Open page
    Input Text        name=search        ikea
    Press Keys        name=search        ENTER
    Click Link                postimyynnillä
    Click Link        toisen maailmansodan
    Page Should Contain        Ensimmäisen maailmansodan rauhanteko
    Close Browser 

Random article
    [Documentation]        
    ...    Clicks on the "random article" link on the left side of the main page
    ...    Checks to see the front page "Suositeltu artikkeli" is no longer visible after clicking on link
    ...    Returns to the front page and checks "Suositeltu artikkeli" is visible again
    Open page
    Wait Until Element Is Visible        id=p-interaction
    Click Link        Satunnainen artikkeli
    Page Should Not Contain        Suositeltu artikkeli
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
    Close Browser

Open Image
    Open page
    Input Text        name=search        Haaga-Helia ammattikorkeakoulu
    Press Keys        name=search        ENTER
    # Click Image        https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/HH_logo_2020_transparent.png/250px-HH_logo_2020_transparent.png
    Wait Until Element Is Visible        //a[@href='https://commons.wikimedia.org/wiki/File:HH_logo_2020_transparent.png']
    Click Element        //a[@href='https://commons.wikimedia.org/wiki/File:HH_logo_2020_transparent.png']
    Close Browser

Change Language
    [Documentation]        
    ...    This test was supposed to click "Random article" 
    ...    until English is available as a Language
    ...    Could not figure out how to repeat the process if english is not available
    ...    Sometimes passes, sometimes fails
    Open page
    Click random
    Wait Until Element Is Visible    //span[contains(text(), "English")]
    ${is_present}=    Run Keyword And Return Status    Page Should Contain Element    //span[contains(text(), "English")]
    Run Keyword If    ${is_present}    Click Element    //span[contains(text(), "English")]
    ...        ELSE        Click random    
    Page Should Contain    From Wikipedia, the free encyclopedia
    Close Browser

*** Keywords ***
Open page
    Open Browser        ${URL}        ${Browser}

Click random
    Click Link        Satunnainen artikkeli


    