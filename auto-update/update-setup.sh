#!/bin/bash

# setup colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
CSU="[\e[1;34mSUCCESS\e[0m]"

read -rep $'[\e[1;33mACTION\e[0m] - Are you using [b]ash or [z]sh? ' CONTINST
    if [[ $CONTINST == "B" || $CONTINST == "b" ]]; then
	mkdir config &>> /dev/null
	cat ~/auto-update/rc/.bashrc >> $HOME/.bashrc
	chmod +x update
	cd $HOME
	
	read -rep $'[\e[1;34mSUCCESS\e[0m] - Setup succeeded! Would you like to run update? (y,n)' RUNUPD
	if [[ $RUNUPD == "Y" || $RUNUPD == "y" ]]; then
		./update
	else
		exit
	fi

else

  mkdir config &>> /dev/null
  cat ~/auto-update/rc/.zshrc >> $HOME/.zshrc
  chmod +x update
  cd $HOME

  read -rep $'[\e[1;34mSUCCESS\e[0m] - Setup succeeded! Would you like to run update? (y,n)' ZSHUPD
  if [[ $ZSHUPD == "Y" || $RUNUPD == "y" ]]; then
	  ./update
  else
	  exit
   fi
fi