*** Settings ***
Library    OperatingSystem
Library    Process
Library    RPA.FTP
Library    String
Resource   ../../resources/keywords/app.robot






*** Test Cases ***
Direct to Linux
    To Linux


command to linux
      ${result}=    Get File   ${variabletolinux}
      File Should Exist    ${variabletolinux}
      Should Not Contain    ${result}    FAILED
     ${line}=   Split To Lines   ${result}
     ${count}=  Get Length    ${line}

   
   

     