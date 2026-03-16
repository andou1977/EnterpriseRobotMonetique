*** Settings ***
Library    DatabaseLibrary
Resource   ../variables/global_variables.robot
Resource   ../variables/account_variables.robot



*** Keywords ***
tcheck data
     Connect To Database   ${pysql}   ${db_name}   ${db_user}   ${db_pass}   ${db_host}   ${db_port}
     ${connexion}=  Query    select * from transactions where transaction_id=${transaction_id} and amount=150.0
     Should Not Be Empty    ${connexion}
     Length Should Be    ${connexion}    1


