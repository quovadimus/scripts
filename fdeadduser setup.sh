#!/bin/bash


#!/bin/sh
#
############################################################################
#
#About this Script
# Script will utilize the fdeadduser binary to add a user to FileVault after it has been enabled, without requiring admin access. 
# fedadduser should be installed in /usr/bin as an executable file.  It is available here https://github.com/google/macops/tree/master/macdestroyer from the Google MacOps group.
# You can use hardcoded values, though it is not recommended because you will be storing the users passwords.  Paramaters 4 and 5 are the first paramaters available for use when deploying via the casper suite.
#
# By Jennifer Unger
# based on https://derflounder.wordpress.com/2014/11/14/using-os-x-10-8s-fdesetup-tool-and-non-enabled-admin-accounts-to-enable-users-for-filevault-2-on-mavericks-and-yosemite/
#
############################################################################

# HARDCODED VALUES ARE SET HERE
username=""
password=""

# CHECK TO SEE IF VALUES WERE PASSED IN PARAMETERS 4 AND 5 AND, IF SO, ASSIGN TO "username" AND "PASSWORD"

if [ "$4" != "" ] && [ "$username" == "" ]; then
    username=$4
fi

if [ "$5" != "" ] && [ "$password" == "" ]; then
	password=$5
fi

# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#

if [ "$username" == "" ]; then
	echo "Please specify a username"
	exit 1
fi

if [ "$password" == "" ]; then
	echo "Please specify a password"
	exit 1
fi

# GRANT FV2 RIGHTS WITH FDEADDUSER


if  [[ -e "/usr/bin/fdeadduser" ]]; then
	/usr/bin/fdeadduser "$username" "$password"
	
	fi
	
exit 0
