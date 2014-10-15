#!/bin/bash

##############################################################################
#                                                                            #
# Author: 	Calum Hunter                                                     #
# Date: 	15-10-2014                                                       #
# Version:	0.1                                                              #
# Purpose:  Return the Enrollment status of the SCCM Agent on Mac OS X       #
#                                                                            #
##############################################################################

# CCM Pref lives here
ccmpref="/var/root/Library/Preferences/com.microsoft.ccmclient.plist"

# Lets get the enrollment status
status=`defaults read $ccmpref EnrollmentStatus`

getmoreinfo() # If we are enrolled, lets pull some more info
{
echo "Current Status: Enrolled"

# Get the Management point
mp=`defaults read $ccmpref MP`
echo "Management Point: $mp"

# Get the user name of the user who enrolled device
enrolluser=`defaults read $ccmpref EnrollmentUserName`
echo "Enrollment User Name: $enrolluser"

# Get the Enrollment Server Address
enrollserver=`defaults read $ccmpref EnrollmentServerName`
echo "Enrollment Server Address: $enrollserver"

# Get the last Check in time
checkin=`defaults read $ccmpref OMALastConnectTime`
echo "Last Check in Time: $checkin"

# Get the Certificate Expiration date
certexp=`defaults read $ccmpref CertExpDate`
echo "Client Certificate Expiry Date: $certexp"
}

# Determine if we are enrolled
if [ $status = "0" ]; 
	then
	echo "Current Status: Not Enrolled"
	echo "No more information avaialble"
elif [ $status = "1" ];
	then
	getmoreinfo
fi 


exit 0