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
    ${xml}=    Parse Xml    ${filexml}
    Log   ${xml}

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



hello
     ${result}=    Run Process    wsl    sh    -c    grep FAILED ${appcsvlinux} | wc -l
     Log To Console    qandtité = ${result.stdout}

hello2
     ${result}=    Run Process    wsl    sh    -c    cat ${apploglinux}
     Log To Console    \n${result.stdout}
     Should Not Contain    ${result.stdout}    FAILED
     Should Start With    ${result.stdout}    INFO Start batch
     Should Contain    ${result.stdout}    INFO End batch

testing
   ${result}=    Run Process    wsl    sh    -c    grep FAILED ${appcsvlinux}
   Log To Console   \n${result.stdout}
   Should Contain    ${result.stdout}    FAILED
   
do with get file
    ${content}=    Get File    ${filecsv}
    @{lines}=    Split To Lines    ${content}
    ${count}=    Set Variable    0
    FOR    ${line}    IN    @{lines}
         IF    'FAILED' in '${line}'
          ${count}=    Evaluate    ${count} + 1
        END
    END

        Log To Console    FAILED COUNT = ${count}
        Should Be Equal As Integers    ${count}    4

 

















#    ${verifypaiement}=   Split To Lines    ${myfilexml24}
#    FOR    ${element}    IN    @{verifypaiement}
#    Should Contain    ${element}    OK
#
#    END








   

     