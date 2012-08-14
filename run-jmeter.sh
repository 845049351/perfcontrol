#!/bin/bash

########################
# JMeter命令行运行工具 #
########################

PWD=`pwd`;
JMETER=/home/log/apache-jmeter-2.7/bin/jmeter
JMXFILE=$1
if [ -z $JMXFILE ];then
	echo "JMeter命令行运行工具,在.jmx文件所在目录执行JMeter,并生成相应报告"
	echo "usage: $0 jmxfile"
	exit -1;
fi
DIR=`dirname $JMXFILE`;
FILE=`basename $JMXFILE`;
FILENAME=`basename $JMXFILE .jmx`;

echo $DIR
echo $FILE
echo $FILENAME

cd $DIR
	echo "Run Command: $JMETER -n -t $FILE -l $FILENAME.jtl -j $FILENAME.log"
	$JMETER -n -t $FILE -l $FILENAME.jtl -j $FILENAME.log
cd $PWD
