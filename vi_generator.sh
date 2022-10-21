#!/bin/bash
while true; do
	read line
	case $line in
		"+")
			kill -USR1 $(cat .pid)
			;;
		"*")
			kill -USR2 $(cat .pid)
			;;
		*)
			if [[ $line == *"TERM"* ]]; then
				kill -SIGTERM $(cat .pid)
				exit
			fi
			;;
	esac
done
