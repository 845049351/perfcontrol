#!/bin/bash
baseDir=$(cd "$(dirname "$0")"; pwd)
sec=$1
if [ -z $sec ];then
	sec=5;
fi

$baseDir/stop.jstat-nmon.sh
rm -rf *.nmon

$baseDir/nmon -f -s $sec -c 99999999
$baseDir/jstat.sh $sec > jstat.nmon &

echo "record every 5 sec";
