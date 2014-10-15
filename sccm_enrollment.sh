#!/bin/bash

## Calum Hunter
## 12-08-2014
## DEC NSW SCCM PoC Project
## Version 0.1
## 
## Script to enroll the Mac OS X Device into Production SCCM Environment

## Define some variables
server_address="YOUR SERVER ADDRESS"
sccmusername="YOUR USERNAME"
sccmpassword="YOUR PASSWORD"
cmenroll="/Library/Application Support/Microsoft/CCM/Tools/CMEnroll" 

## Now hand off to the expect script to perform the enrollment
/tmp/expect_enrollment.sh $server_address $sccmusername $sccmpassword "$cmenroll"

exit 0
