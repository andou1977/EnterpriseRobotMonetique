*** Settings ***
Library    OperatingSystem
Library    Process
Library    RPA.FTP
Library    String
Library    RPA.Tables
Resource   ../../resources/keywords/app.robot

Library    Collections
Library    RPA.JSON
Library    RequestsLibrary
Library    XML
Library    RPA.RobotLogListener
Library    ../../python/countfailed.py









*** Test Cases ***
Direct to Linux
    To Linux
Fichier txt
    Fichier.txt
Fichier json
    Fichier.json
Fichier xml
    fichier.xml
Fichier batxh
    batch.txt
Fichier fixed
    fixed.txt
Fichier hello
    hello
Fichier hello2
    hello2
fichier testing
     testing
fichier with get file
    do with get file
fichier test failed
    test Failed



     

#     ou



#     ${result}=    Run Process    wsl    sh    -c    grep FAILED ${pou2} | wc -l
#     Log To Console    \nquantité = ${result.stdout}
#     Should Be Equal As Integers    ${result.stdout}    1












   

     