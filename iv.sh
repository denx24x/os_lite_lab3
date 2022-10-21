#!/bin/bash
script="$HOME/lab3/inf.sh"

bash $script &
pid1=$!
bash $script &
pid2=$!
bash $script &
pid3=$!

data=$(top -b -n 1)
echo "$data" | head -n 7
echo "$data" | grep -e "$pid1" -e "$pid2" -e "$pid3"

cpulimit -l 10 -p $pid1 &

kill -9 $pid3

sleep 10s

top -b -n 1 | grep -e "$pid1"

