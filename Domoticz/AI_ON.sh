#!/bin/bash 
cd /root/openwrtAI/
#echo $1 > /tmp/nullAI 2>&1 & echo "" > /tmp/ai
echo $1 | sudo -S ./openwrtAI  >> /tmp/nullAI 2>&1 & echo "" > /tmp/ai
