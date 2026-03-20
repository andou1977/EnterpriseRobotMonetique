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






*** Test Cases ***
Direct to Linux
    To Linux


Fichier.txt
      ${result}=    Get File   ${fileapp}
      File Should Exist    ${fileapp}
      Should Not Contain    ${result}    FAILED
     ${line}=   Split To Lines   ${result}
     ${count}=  Get Length    ${line}
     

Fichier.json
   ${resultjson}=   Load JSON from file    ${filejson}
   Should Be Equal    ${resultjson['status']}    OK


fichier.xml
    ${xml}=    Parse Xml   ${filexml}
    Log    ${xml}

batch.txt
   ${batchtxt}=   Get File    ${filebatchtxt}
   Should Start With    ${batchtxt}     HEADER
   Should Contain    ${batchtxt}    FOOTER;TOTAL=2
   
fixed.txt
   ${fixedtxt}=   Get File    ${filefixedtxt}
   ${line}=   Split To Lines    ${fixedtxt}
   FOR    ${element}    IN    @{line}
       Log    ${element}

   END

myfile.xml
     ${content}=    Get File    ${fileapp}
     @{lines}=    Split To Lines    ${content}
     ${count}=    Set Variable    0

     FOR    ${line}    IN    @{lines}
         Run Keyword If    'INFO' in '${line}'    Set Test Variable    ${count}    ${count + 1}
     END

     Log    ${count}

hello
     ${result}=    Run Process    wsl    sh    -c    grep FAILED ${appcsvlinux} | wc -l
     Log To Console    qandtité = ${result.stdout}











#    ${verifypaiement}=   Split To Lines    ${myfilexml24}
#    FOR    ${element}    IN    @{verifypaiement}
#    Should Contain    ${element}    OK
#
#    END








   

     