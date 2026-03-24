
*** Settings ***
Library    OperatingSystem
Resource  ../variables/transactions_variables.robot

*** Keywords ***
Verify File
   ${myfile}=   Get File    ${myfiletransactionstxt}
   File Should Exist     ${myfiletransactionstxt}



Verify File Failed
   ${myfilefailed}=   Get File    ${myfiletransactionstxt}
   File Should Exist   ${myfiletransactionstxt}
   Should Contain    ${myfilefailed}   FAILED
   Should not Contain    ${myfilefailed}    900







