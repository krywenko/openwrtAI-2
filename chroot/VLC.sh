#!/bin/bash
pkill vlc
sudo -H -u nobody cvlc $1  --sout="#transcode{vcodec=none,acodec=mp3,ab=64,channels=2,samplerate=44100}:http{mux=mp3,dst=:9090/stream}" --sout-keep --loop  >/dev/null 2>&1 & echo "" >  /tmp/vlc.tmp

exit 0

#add nobody to audio  
