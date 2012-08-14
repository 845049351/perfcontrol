#!/bin/bash
for i in `cat .conf/*server`; do
	echo $i;
	scp -r $1 admin@$i:zq-perf/lib
done
