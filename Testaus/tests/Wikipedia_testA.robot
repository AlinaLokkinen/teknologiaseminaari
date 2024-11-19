*** Settings ***
Library        SeleniumLibrary
Variables        ../resources/variables.py

*** Test Cases ***
Initial Test
    Open page
    Sleep        5s
    Close Browser

Search for robot framework
    [Documentation]
    ...        Input text into search field and press enter to search
    Open page
    Wait Until Element Is Visible        id=searchInput
    Input Text        name=search        Robot Framework
    Sleep        2s
    Press Keys        name=search        ENTER
    Sleep        2s
    Page Should Contain        Robot Framework       
    Close Browser

Search with a very long search input
    [Documentation]
    ...        Input a very long search input into the search field and press enter to search
    ...        First one should work, second one should receive error message that the search input is too long 
    Open page
    Wait Until Element Is Visible        id=searchInput
    Input Text        name=search        Pneumonoultra­mikroskopiko­silikovulkanokonioosi    
    Sleep        2s
    Press Keys        name=search        ENTER
    Sleep        2s
    Page Should Contain        Pneumonoultra­mikroskopiko­silikovulkanokonioosi on sanasepite             
    Sleep        2s
    Input Text        name=search        aklsjflajwiouawoiuraoiwjrakmdwkmdlawueroaiwuroisufdkfjkdsljflskersiewuoaisdalskcmsmclekmfleroiuewroijsdflkdjfdlkfmaklsjflajwiouawoiuraoiwjrakmdwkmdlawueroaiwuroisufdkfjkdsljflskersiewuoaisdalskcmsmclekmfleroiuewroijsdflkdjfdlkfmaklsjflajwiouawoiuraoiwjrakmdwkmdlawueroaiwuroisufdkfjkdsljflskersiewuoaisdalskcmsmclekmfleroiuewroijsdflkdjfdlkfmaklsjflajwiouawoiuraoiwjrakmdwkmdlawueroaiwuroisufdkfjkdsljflskersiewuoaisdalskcmsmclekmfleroiuewroijsdflkdjfdlkfm
    Press Keys        name=search        ENTER
    Wait Until Element Is Visible        class=cdx-message__content
    Page Should Contain        Haku epäonnistui
    Sleep        2s
    Close Browser

Follow links
    [Documentation]        
    ...    Click links on different pages and make sure they redirect to new pages
    Open page
    Input Text        name=search        ikea
    Press Keys        name=search        ENTER
    Click Link                postimyynnillä
    Click Link        toisen maailmansodan
    Sleep        2s
    Page Should Contain        Ensimmäisen maailmansodan rauhanteko
    Close Browser      

*** Keywords ***
Open page
    Open Browser        ${URL}        ${Browser}

