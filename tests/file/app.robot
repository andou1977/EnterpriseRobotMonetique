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
Suite Teardown    Disconnect From Database










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
    ${query}=    Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/fast.sql
    ${result}=   Query    ${query}
    Should Not Be Empty    ${result}
    Disconnect From Database



je suis la
    ${content}=   get_error_lines   ${apploglinux}
    ${convert}=   Convert To String    ${content}
    Should Contain    ${convert}    failed





verifier inconherence
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${file}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/incoherence.sql
     ${result}=   Query    ${file}
     Should Be Empty    ${result}
     Disconnect From Database

verifier fraude
    Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
    ${result}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/fraude.sql
    ${query}=   Query    ${result}
    Should not Be Empty    ${query}
    ${convert}=   Set Variable   ${query[0][0]}
    Should Be Equal As Numbers    ${convert}    4970100000000010
    Disconnect From Database



transaction lente
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${file}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/timeout.sql
      File Should Exist    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/timeout.sql
     ${query}=  Query    ${file}
     Should Be Empty    ${query}
     Disconnect From Database

   

pluspoussé
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${result}=  Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/pluspoussé.sql
     File Should Exist       C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/pluspoussé.sql
     ${myquery}=   Query    ${result}
     Should Be Empty    ${myquery}
     Disconnect From Database

la somme
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${result}=  Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/sommepayment.sql
     File Should Exist       C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/sommepayment.sql
     ${myfirstquery}=   Query    ${result}
     Should not Be Empty    ${myfirstquery}
     ${convertion}=   Set Variable   ${myfirstquery[0][0]}
     Should Be Equal As Numbers    ${convertion}   1961.94
     Disconnect From Database

payment existant mais pas dans transaction
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     Disconnect From Database


verifier creation paiement
    Create Session    creatednow    https://6957bb19f7ea690182d2e402.mockapi.io/api/andouv1

    ${addvalue}=    Create Dictionary   Card_number=4970100000000014   amount=1845.89   status=SUCCESS
    ${myadd}=    POST On Session    creatednow    /andouv1api    json=${addvalue}
    Status Should Be    201
    ${verify}=    Set Variable    ${myadd.json()}

    Should Be Equal    ${verify['status']}    SUCCESS
    Should Be Equal   ${verify['amount']}    1845.89
    Should Not Be Empty    ${verify['id']}
    [Documentation]  regex pour 16 chiffres stricte sans espaces et sans lettres etc ex: 1234567890234567
    Should Match Regexp    ${verify['Card_number']}   ^[0-9]{16}$

    
    
Invalide test
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${test}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/invalide.sql
     File Should Exist    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/invalide.sql
     ${query}=   Query    ${test}
     Should Be Empty    ${query}
     Disconnect From Database

Jsondirect
     Create Session   alias   https://6957bb19f7ea690182d2e402.mockapi.io/api/andouv1
     ${hg}=   POST On Session   alias   /andouv1api   ...   json={"Card_number": 4970100000000012,"amount": 1845.89,"status": "SUCCESS"}
     Status Should Be    201
     ${gty}=   Set Variable   ${hg.json()}
     Should Not Be Empty    ${gty}







#    Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
#    ${myquery}=   Query   select sum(amount) from transaction
#    ${value}=     Set Variable    ${myquery[0][0]}
#    Should Be Equal As Numbers    ${value}    1415.49














#     ou



#     ${result}=    Run Process    wsl    sh    -c    grep FAILED ${pou2} | wc -l
#     Log To Console    \nquantité = ${result.stdout}
#     Should Be Equal As Integers    ${result.stdout}    1












   

     