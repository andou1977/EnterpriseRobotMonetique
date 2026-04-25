
*** Settings ***
Resource     ../variables/app_variables.robot
Library    OperatingSystem
Library    String
Library    RPA.JSON
Library    XML
Library    Process
Library    ../../python/countfailed.py

*** Keywords ***
To Linux
     ${getfileapptolinux}=   Get File   ${fileapp}
      Log    ${getfileapptolinux}

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
     ${content}=    Get File    ${filecsv}
     ${count}=      Get Count     ${content}    FAILED
     Should Be Equal As Integers   ${count}    4
     Log To Console    quantité = ${count}



hello2
     ${result}=   Get File   ${apploglinux}
     Log To Console    \n${result}
     Should Not Contain    ${result}    FAILED
     Should Start With    ${result}    INFO Start batch
     Should Contain    ${result}    INFO End batch

testing
   ${failed}=    Evaluate    [l for l in open(r"${filecsv}") if "FAILED" in l]
   Log To Console    ${failed}

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



test Failed
     ${count}=   Check Failed Payments    ${pou}
     Should Be Equal As Integers    ${count}   1



#hello2
#     ${result}=    Run Process    wsl    sh    -c    cat ${apploglinux}
#     Log To Console    \n${result.stdout}
#     Should Not Contain    ${result.stdout}    FAILED
#     Should Start With    ${result.stdout}    INFO Start batch
#     Should Contain    ${result.stdout}    INFO End batch

#testing
#   ${result}=    Run Process    wsl    sh    -c    grep FAILED ${appcsvlinux}
#   Log To Console   \n${result.stdout}
#   Should Contain    ${result.stdout}    FAILED


#${appcsvlinux}   /home/genius/andoufile2.csv
#${filecsv}   //wsl.localhost/Ubuntu/home/genius/andoufile2.csv
