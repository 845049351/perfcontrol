#!/bin/bash
USER='admin';
echo "[`date +"%Y-%m-%d %H:%M:%S"`] $0 $*" >> perfcontrol_history 
for ip in `cat .conf/*server`; do
  echo -e "\033[32;1m                              $ip \033[0m"
  ssh $USER@$ip $1
done
exit;
