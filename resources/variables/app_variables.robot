
*** Settings ***
Resource   ../variables/global_variables.robot


*** Variables ***
${fileapp}   ${EXECDIR}/data/csv/app.log
${filecsv}   ${EXECDIR}/data/csv/andoufile2.csv
${filejson}   ${EXECDIR}/data/csv/andou.json
${filexml}   ${EXECDIR}/data/csv/payment.xml
${filebatchtxt}   ${EXECDIR}/data/csv/batch.txt
${filefixedtxt}   ${EXECDIR}/data/csv/fixed.txt
${apploglinux}   ${EXECDIR}/data/csv/app.log
${appcsvlinux}   ${EXECDIR}/data/csv/andoufile2.csv
${pou}     ${EXECDIR}/data/csv/result.csv
${pou2}    ${EXECDIR}/data/csv/result.csv

${appcsvlinux2}    /home/genius/andoufile2.csv