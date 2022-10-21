#!/bin/bash
mode=0
val=1
(tail -f pipe) |
while true; do
	read line
	case $line in
		"QUIT")
			killall tail
			echo "quit"
			exit
			;;
		"+")
			mode=0
			echo "+"
			;;
		"*")
			mode=1
			echo "*"
			;;
		*)
			was=$val
			if [ $mode -eq 0 ]; then
				val=$(( $val + $line ))
				echo "$was + $line = $val"
			else
				val=$(( $val * $line ))
				echo "$was * $line = $val"
			fi
	esac
done
