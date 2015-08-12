set loggedInUser to do shell script "whoami"
set nodeName to do shell script "dscl . -read /Users/" & loggedInUser & " | awk '/^OriginalNodeName:/,/^Password:/' | head -2 | tail -1 | cut -c 2-"


set ADHome to do shell script "dscl . -read /Users/" & loggedInUser & "| grep NFSHomeDirectory: | cut -c 19- | sed 's/\\\\/\\//g' "
try
	
	mount volume "smb://" & "domain" & ADHome
	
	
on error
	
end try
