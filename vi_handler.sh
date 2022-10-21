#!/bin/bash
echo $$ > .pid
val=1
mode=1

usr1()
{
	mode=1
	echo "+"
}

usr2()
{
	mode=2
	echo "*"
}


sigterm()
{
	echo "exit by signal"
	mode=0
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM

while [[ $mode -ne 0 ]]; do
	if [[ $mode -eq 1 ]]
	then
		val=$(( $val + 2 ))
	else
		val=$(( $val * 2 ))
	fi
	echo "$val"
	sleep 1s
done
