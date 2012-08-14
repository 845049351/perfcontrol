#!/bin/bash
sec=$1
if [ -z $sec ];then
	sec=5;
fi

PID=`ps -leaf | grep java | grep server |awk '{print $4}'`;
#PID=`jps | grep Server | awk '{print $1}'`;

if [ "$PID" != "" ]; then
  jstat -gcutil -t $PID ${sec}000
else
  echo "not found java process!"
fi
