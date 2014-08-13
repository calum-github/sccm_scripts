#!/bin/expect

## Calum Hunter
## 12-08-2014
## DEC NSW SCCM PoC Project
## Version 0.1

# Grab the variables from the sccm enrollment script
set server_address [lindex $argv 0]; # Get the Server Address from the sccm_enrollment script
set sccmusername [lindex $argv 1]; # Get the sccmuser name form the sccm_enrollment script
set sccmpassword [lindex $argv 2]; # get the sccmpassword from the sccm_enrollment script
set cmenroll [lindex $argv 3]; # get the cmenroll from the sccm_enrollment script

# set a generous timeout
set timeout 20

## Do the script
spawn $cmenroll -s $server_address -ignorecertchainvalidation -u $sccmusername
expect "Please enter your password."
send $sccmpassword
send \n 
expect "Successfully enrolled"
interact
exit 0
