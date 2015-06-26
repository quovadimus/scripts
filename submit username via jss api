#!/bin/bash

#CocoaDialog prompts an input box asking the user for their username

#use set -x for troubleshooting, comment out if not needed
#set -x


CD="/Applications/CocoaDialog.app/Contents/MacOS/CocoaDialog"

rv=($("$CD" inputbox --title "UserName" --no-newline \
    --informative-text "Please enter your UserName" \
 	--text "username" \
    --button1 "Submit" --button2 "Cancel" \
    --width 600))
    
 if [ "$rv" -eq "2" ]; then
    		echo "user canceled"
   error 0
   	fi
    
  if [ "$rv" -eq "1" ]; then
     
		username=${rv[1]}
	fi

#set your jss api variables here

apiUsername="jssadmin"
apiPassword="jssadmin"

xmlFile="<computer><location><username>$username</username></location></computer>"

jssServer="https://reston04.local:8443"

#grab the serial number of the current machine

serialnumber=`ioreg -l | grep IOPlatformSerialNumber | cut -d " " -f 10 | tr -d '"'`

#curl command to submit the data to the API

curl -s -k -u ${apiUsername}:${apiPassword} -H "Content-Type: application/xml"  ${jssServer}/JSSResource/computers/serialnumber/${serialnumber}  -X PUT -d ${xmlFile}


