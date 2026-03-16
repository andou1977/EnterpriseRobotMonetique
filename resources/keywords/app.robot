
*** Settings ***
Resource     ../variables/app_variables.robot
Library    OperatingSystem

*** Keywords ***
To Linux
     ${getfileapptolinux}=   Get File   ${variabletolinux}
      Log    ${getfileapptolinux}

