#!/bin/bash

# init colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
CSU="[\e[1;34mSUCCESS\e[0m]"

# init log
log="update-install.log"
chk="chklog.log"

echo -e "$CNT - Checking for system updates..."
checkupdates &>> $chk

if grep -wq "-" $chk; then
    read -rep $'[\e[1;33mACTION\e[0m] - Found system update!! Would you like to update packages and system? (y,n) ' CONTINST
    if [[ $CONTINST == "Y" || $CONTINST == "y" ]]; then
	    echo -e "$CNT - Clearing logs..."
	    rm -rf update-install.log
	    rm -rf chklog.log
	    echo -e "$CSU - Logs have been cleared.\n"

	    echo -e "$CNT - Updating system..."
	    yay -Syu --noconfirm &>> $log
	    echo -e "$CSU - System updated!!\n"

	    echo -e "$CNT - Updating packages..."
	    yay -Syu --aur --noconfirm &>> $log
	    echo -e "$CSU - Packages updated!!\n"

	    echo -e "$CNT - System update complete. Check 'update-install.log' for extra install information."
	    rm -rf chklog.log	    
    else
	    echo -e "$CNT - System update cancelled. To run this again restart kitty or run 'exec bash'."
	    exit
    fi

else
	echo -e "$CNT - Your system is up-to-date! No updates were installed."
	exit
fi