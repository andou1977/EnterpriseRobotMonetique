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
Library    ../../python/countandsumtransaction.py










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
     Should not Be Empty    ${query}
     Disconnect From Database

   

pluspoussé
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${result}=  Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/pluspoussé.sql
     File Should Exist       C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/pluspoussé.sql
     ${myquery}=   Query    ${result}
     Should not Be Empty    ${myquery}
     ${verifier}=   Set Variable    ${myquery[0][2]}
     Should Be Equal As Numbers    ${verifier}    400.90
     Disconnect From Database

la somme
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${result}=  Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/sommepayment.sql
     File Should Exist       C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/sommepayment.sql
     ${myfirstquery}=   Query    ${result}
     Should not Be Empty    ${myfirstquery}
     ${convertion}=   Set Variable   ${myfirstquery[0][0]}
     Should Be Equal As Numbers    ${convertion}   2097.4
     Disconnect From Database

payment existant mais pas dans transaction
     Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     Disconnect From Database


verifier creation paiement
    Create Session    creatednow    https://6957bb19f7ea690182d2e402.mockapi.io/api/andouv1

    ${addvalue}=    Create Dictionary   Card_number=4970100000000014   amount=1845   status=SUCCESS
    ${myadd}=    POST On Session    creatednow    /andouv1api    json=${addvalue}
    Status Should Be    201
    ${verify}=    Set Variable    ${myadd.json()}

    Should Be Equal    ${verify['status']}    SUCCESS
    Should Be Equal   ${verify['amount']}    1845
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

verifiercontenucsvfile
    [Documentation]   vérifie que chaque ligne suivante contient exactement 3 colonnes ex:PAYMENT;ID=2001;STATUS=OK
    ${content}=    Get File    ${pou}
    ${lines}=    Split To Lines    ${content}

    FOR    ${line}    IN    @{lines}[1:]
    ${cols}=    Split String    ${line}    ;
    Length Should Be    ${cols}    3
    END

verifiertimeoutapi
     [Documentation]   verifier le timeout d'un api inferieur a 3s
     Create Session    timeverifier    https://6957bb19f7ea690182d2e402.mockapi.io/api/andouv1
     ${juo}=   POST On Session   timeverifier   /andouv1api   ...   json={"Card_number": 4970100000000012,"amount": 1845.89,"status": "SUCCESS"}
     Status Should Be    201
     ${elapsed}=    Set Variable    ${juo.elapsed.total_seconds()}
     Log    Temps de réponse: ${elapsed} secondes
     Should Be True    ${elapsed} < 2


testerid
      Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
       ${result}=  Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/idfile.sql
        ${query}=   Query    ${result}
       Should Not Be Empty    ${query}
       Should Be Equal As Strings    ${query[0][3]}    FAILED
       Should Be Equal As Numbers    ${query[0][2]}    99.99
       Should Be Equal As Numbers    ${query[0][5]}    7
       Should Be Equal As Numbers    ${query[0][1]}    4970100000000007
       Disconnect From Database
transactiondifferent
    Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
    ${takeit}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/difference.sql
    File Should Exist    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/difference.sql
    ${myquery}=   Query    ${takeit}
    Should Be Equal As Numbers   ${myquery[0][1]}   400.90
    Should Be Equal As Numbers    ${myquery[0][4]}    500.00
    Disconnect From Database
lenteurapi
     Create Session    testlenteur    https://6957bb19f7ea690182d2e402.mockapi.io/api/andouv1
     ${response}=    GET On Session    testlenteur    /andouv1api
     ${elapsed}=    Convert To Number    ${response.elapsed.total_seconds()}
     Should Be True    ${elapsed} < 2    L’API est trop lente : ${elapsed} secondes


settlementmanquant
    Connect To Database  ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
    ${myfile}=   Get File    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/settlementmanquant.sql
    File Should Exist   C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/sql/settlementmanquant.sql
    ${myquery}=   Query    ${myfile}
    Should Not Be Empty    ${myquery}
    ${verify}=   Set Variable   ${myquery[0][1]}
    Should Be Equal As Numbers    ${verify}    546.45
    Disconnect From Database
    
countandsumtransaction
   ${thevariable}=   Countandsum    C:/Users/GENIUS/PycharmProjects/EnterpriseRobotMonetique/data/csv/transactions.txt
   Log To Console    ${thevariable}
   ${convert}=   Convert To Number    ${thevariable[0]}
   ${convert}=   Convert To Number    ${thevariable[1]}
   Should Be Equal As Numbers    ${convert}   755.49

#----------------------likemo-------------------------------
myfirstlikemo
    Connect To Database   ${pysql}   monext_simulation   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
    ${query}=   Query    ${myrequest}
    Should not Be Empty    ${query}
    ${montant}=   Set Variable   ${query[2][1]}
    Should Be Equal As Numbers    ${montant}    152.06
    ${statut}=   Set Variable   ${query[2][4]}
    Should Be Equal As Strings    ${statut}    ACTIVE
    Disconnect From Database

mysecondlikemo
   Connect To Database   ${pysql}   monext_simulation   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
   ${myquery}=   Query    ${myrequest1}
   Should Be Empty    ${myquery}
   Disconnect From Database




#    Connect To Database   ${pysql}   monext_db   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
#    ${myquery}=   Query   select sum(amount) from transaction
#    ${value}=     Set Variable    ${myquery[0][0]}
#    Should Be Equal As Numbers    ${value}    1415.49














#     ou



#     ${result}=    Run Process    wsl    sh    -c    grep FAILED ${pou2} | wc -l
#     Log To Console    \nquantité = ${result.stdout}
#     Should Be Equal As Integers    ${result.stdout}    1












   

     