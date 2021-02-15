#!/bin/bash
if [ $2 -gt 0 ] ; then
	amount=$(($2 / 100))
	echo "producing ${1} messages in ${amount} iterations"
	for i in {1..${amount}} 
	do
		sh ${1} FILE_100_LINES
	done
else
	for (( ; ; ))
	do
   		echo "producing activities infinitly [ hit CTRL+C to stop]"
		sh ${1} FILE_100_LINES
		sleep 0.1
	done
fi
