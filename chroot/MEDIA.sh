#!/bin/bash

pkill mplayer

 cd $2    #folder of media 

 if [ $1 == 'house' ] ; then
          find  -iname '*.mp3' -exec mplayer -shuffle -af channels=4:4:0:2:0:0:1:3:1:1 {} \+    #channel mapping audio on 5.1 device  front  and rear playing
  elif [ $playback == 'livingroom' ] ; then
           find  -iname '*.mp3' -exec mplayer -shuffle -af channels=4:2:0:2:1:3 {} \+     ##channel mapping audio on 5.1 device  only rear playing
  else
        find  -iname '*.mp3' -exec mplayer -shuffle  {} \+

  fi

