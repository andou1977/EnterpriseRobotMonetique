*** Settings ***
Library    OperatingSystem
Library    RPA.FTP
Library    RPA.FileSystem
Resource   ../../resources/keywords/transactions.robot




*** Test Cases ***
Verify the File
     Verify File

verify failed
    Verify File Failed


Verify file CSV
   verify file for csv


