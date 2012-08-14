#!/bin/bash
jstat=`jps | grep Jstat | awk '{print $1}'`;
for pid in $jstat; do
	kill -9 $pid
done
killall -9 nmon
killall -9 jstat.sh
