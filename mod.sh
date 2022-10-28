#!/bin/bash
for i in $(seq 1 10)
do
	at -f "example.sh" now + $i minutes
done
for user in $(cat /etc/passwd | cut -d: -f1)
do
	echo "$user"
	at -l | grep "$user" |
	while read -r line
	do
		num=$(echo "$line" | awk '{ print $1 }')
		echo "$line"
		at -c "$num"
	done
done
