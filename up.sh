#!/bin/bash

exit_gracefully() {
	echo "Ending this program... No changes were commit to git"
	sleep 2
	exit
}

commit_git() {
	git add .
	read -p "Enter commit msg: " commit_msg
	git commit -m "$commit_msg"
	git push -u origin main
}

exit_successful() {
	echo "Commit was successful... Ending script"
	sleep 2
	exit
}

read -p "Would you liek to upload changes to git?: " ans

if [ $ans == "y" ]; then
	commit_git
	if [ $? -eq 0 ]; then
		exit_successful
	else
		exit_gracefully
	fi
else
	exit_gracefully
fi
