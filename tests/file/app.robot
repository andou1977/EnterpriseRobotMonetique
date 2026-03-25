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
Library    ../../python/calculeamount.py
Library    DatabaseLibrary
Library    ../../python/showfailed.py










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



mytestingnow
     ${tr}=   Calculate Total Amount    ${filebatchtxt}
     Should Be Equal As Integers    ${tr}    120


testinagain
    Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
    ${query}=    Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/csv/fast.sql
    ${result}=   Query    ${query}



je suis la
    ${content}=   get_error_lines   ${apploglinux}
    ${convert}=   Convert To String    ${content}
    Should Contain    ${convert}    failed





verifier inconherence
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${file}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/csv/incoherence.sql
     ${result}=   Query    ${file}
     Should Be Empty    ${result}














#    Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
#    ${myquery}=   Query   select sum(amount) from transaction
#    ${value}=     Set Variable    ${myquery[0][0]}
#    Should Be Equal As Numbers    ${value}    1415.49














#     ou



#     ${result}=    Run Process    wsl    sh    -c    grep FAILED ${pou2} | wc -l
#     Log To Console    \nquantité = ${result.stdout}
#     Should Be Equal As Integers    ${result.stdout}    1












   

     