#!/bin/bash
crontab -r
for i in $(seq 0 5 59); do
	echo "$i * * * 5 bash $HOME/lab3/i.sh"
done | crontab
