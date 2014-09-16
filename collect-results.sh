#!/bin/bash
echo "[`date +"%Y-%m-%d %H:%M:%S"`] $0 $*" >> perfcontrol_history 
USER='$USER';
LOGFILE='zq-perf/*.log';

del=true;
dir=$1
if [ "$1" == "" ];then
  dir="results"
fi
for ip in `cat .conf/*server`; do
  echo -e "\033[32;1m                              $ip \033[0m"
  mkdir -p $dir/$ip/
  scp $USER@$ip:/home/$USER/$LOGFILE $dir/$ip/
  if [ $del ];then
    ssh $USER@$ip "rm -rf /home/$USER/$LOGFILE"
  fi
done

#ip=zqueue.lab4.imbugs.com
#mkdir -p $dir/nmon
#scp $USER@$ip:/home/$USER/.lab*/*.nmon $dir/nmon/
