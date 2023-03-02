#!/bin/bash

chroot /root/OpenWrtAI/ /bin/bash ./kill.sh
pkill mpg123
pkill read
pkill ABRead
pkill ABCon
