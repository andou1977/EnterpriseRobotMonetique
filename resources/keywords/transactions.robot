
*** Settings ***
Library    OperatingSystem
Resource  ../variables/transactions_variables.robot

*** Keywords ***
Verify File
   ${myfile}=  Get File   ${myfiletransactionstxt}
   File Should Exist    ${myfiletransactionstxt}

Verify File Failed
   ${myfilefailed}=   Get File    ${myfiletransactionstxt}
   File Should Exist   ${myfiletransactionstxt}
   Should Contain    ${myfilefailed}   FAILED
   Should Not Contain    ${myfilefailed}    900

verify file for csv
     ${myfilecsv}=  Get File    ${myfiletransactionscsv}
      File Should Exist    ${myfiletransactionscsv}
      Should Contain    ${myfilecsv}    FAILED






