 #!/bin/bash
cd /root/openwrtAI/
#echo $1 > /tmp/nullAIa 2>&1 & echo "" > /tmp/ai  
echo $1 | sudo -S ./stop.sh  >> /tmp/nullAIa 2>&1 & echo "" > /tmp/ai
