#!/bin/sh
############################################################################
# Send a command of configuration via SSH to RouterBoards Mikrotik
# enviacomandomkt.sh – v.0.1 – 2017/05/01
#
# Autor: Átila Castro
############################################################################

# Step-by-step to create the key for don't need authentic at mikrotik
# Create key dsa at FreeBSD/linux
# ssh-keygen -t dsa
# Copy the key to Mikrotik 
# ftp 10.20.1.1 (RB's IP)
# ftp> put id_dsa.pub
# Import at mikrotik the key
# [admin@mikrotik]> user ssh-keys import public-key-file=id_dsa.pub user=admin

CERTPATH="/root/.ssh/id_dsa"

# Do you want to send a command to a specific RB
# uncomment the rows bellow
# And comment th for i in $(cat rbs,txt); do
# export host=$i

#echo "Insert the RB's IP:"
#read iprb
#export iprb=$iprb

echo "Insert the command to be excecuted at RB:"
read comando
export comando=$comando

for i in $(cat rbs.txt); do
export host=$i

ssh -l admin -i $CERTPATH $host "$comando";
done

echo "Command sended to networks:"
cat /usr/local/sbin/rbs.txt
