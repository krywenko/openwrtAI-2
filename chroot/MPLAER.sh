#!/bin/bash
pkill mplayer


sudo -H -u nobody  mplayer $1 $2  -ao alsa  #-vo null >> /tmp/mplayer.out

##add nobody to audio group
