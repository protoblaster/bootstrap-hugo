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

read -p "Would you liek to upload changes to git?: " ans

if [ $ans == "y" ]; then
	commit_git
	exit_gracefully
else
	exit_gracefully
fi
