# openwrtAI-2
openwrtAI 
openwrt Basic AI software V2 . has built in levenshtein  for fuzzy logic control , also  set up to work with kaldi docker for offline usage . if it  detected you are offline it will start the docker container for uninterrupted basic usage and then once online again it will shut down the container ( if you have enough memory to run it as it requires  ~ 6 gigs of memory.. if not  then use whisper tiny  that requires 1gig of memory).
 
 fuzzy logic of levenshtien -- it compares a know list  of patterns for your voice  (ITEM.list) to what was transcribed  via kaldi or speech.reconginition   ITEM.list corrisponds to your if/elif conditions.  - so if say you wanted  to listem to peggy FM .. and you say "play Peggy FM"  but it was transcribed as  "play peg"  or "a play peggy FM" or even "play peggy of em" levenshien  will  compare that to the list of know conditions  and choose  "play peggy fm"  if the range is with in -a 3 (3 degrees of seperation) you can adjust it up or down for more or less flexiblity .  benifit of it greatly reduces if/elif conditions.  for commands that are unlikely to have very little variation ie "play peggy fm" then a single if/elif condition   is enough..  stuff that has  multiple variences such "turn on/off kitchen light"  or pluralized version, or kitchen lights on/off -  levenshtien  will reduce  it to a couple  if/elif  conditions "turn on kitchen light"  "kitchen light on" --there a information section just say information- then you will enter the information chat bot. you can continuously ask questions 
 
 it can be uses  on systems  that do not require chroot or within chroot  you just need to adjust chroot sections to  localize copies . so instead of coping  the bash files from chroot directory  to your chroot /bin folder you would jus copy it to your localized /bin folder  and install all programs locally , vlc, mplayer and flite. 
 included is the bash script to build the chroot folder for you, with all the required sofware installed, if you want the higher functions of multichannel manipulation ( 4.0, 5.1 and 7.1 sound systems)  and better webradio playback support. otherwise it not required for a very small foot print install.. such as speech.recognition, gtts  and mpg123
 domoticz folder contains the basic on/off switch for openwrtAI- since domotizc  runs as nobody.  you have to pass your password to it  
 ```
 AI_ON.sh "password"   # to raise  it level
 ```
 what required for a basic install 
```
pip install SpeechRecognition
```
for open wrt follow this then install SpeechRecognition
```
opkg install git
opkg install alsa-utils
opkg install alsa-lib
opkg install portaudio
opkg install ar
opkg install python3-dev
# Make a working directory
mkdir /opt/tmp/
cd /opt/tmp
# Fetch PyAudio source
git clone https://people.csail.mit.edu/hubert/git/pyaudio.git
# Fetch portaudio.h (required for the build)
cd /opt/tmp/pyaudio/src
wget https://raw.githubusercontent.com/EddieRingle/portaudio/master/include/portaudio.h
# build away!
cd /opt/tmp/pyaudio
python setup.py build
python setup.py install
# done
```
compile flac
```
opkg install gcc make 
wget https://github.com/xiph/flac/releases/download/1.3.4/flac-1.3.4.tar.xz -O flac.tar.xz
tar -xvf fac.tar.xz
cd flac
chmod +x configure
./configure
make 
make install  # but it installs to /usr/local/bin  just copy flac to /usr/bin afterwards  or manually do it from the build dir
```
install gtts
```
# pip install gTTS
# opkg install mpg123
```
and install fuzzy logic
```
git clone https://github.com/rbm78bln/levenshtein.git
make 
cp levenshtein exec to /bin
```
to install chatGPT - openai
get your free  personal key from https://beta.openai.com/  add it to openai
```
pip install aiohttp typing_extensions tqdm requests
git clone https://github.com/openai/openai-python.git
cd openai-python
python setup.py install
```
and you are off and running

openwrtAI is the main executable

if you want speech across all speaker ports  based on where playback is  or fixed acroos all.  just run MPLAYER ( found in the openrtAI folder instead of mpg123 in the program speak also found same folder). it only currenly works with using online speach translation as i have not figured out how  force flite   to do it directly - but can be done if you tell flite to record TTS and then play it with MPLAYER afterwards 

updated to cache elevenlabs speech-synthesis  add api key to script called eleven for more human like speech you can also make custom voices ad  clone voices  so if you want the AI to talk like john wayne or a lost one  it will
usage: ( based on aqara zigbee cube ) 
```
OpenWrtAI usage

    • flipping cube 90 degree – initiates the AI
    • flipping the cube 180 – stops the AI
    • rotating the cube right plays radio in the office
    • rotating the cube left plays radio in the house
      
     VOICE Commands 
        ◦ “Stop”  voice command to stop AI
        ◦ Information” for duck duck go search chat box
        ◦ “CHAT”    for ChatGTP  chat box
        ◦ “Sci-Fi”  Random play back   of Sci-fi audio book
        ◦ “Horror”  Random Play back of Horror audio book
        ◦ “continue”   reading a book where you left off
        ◦ “continue audiobook”  will continue play back of audio book
        ◦ “configure house” set default playback to entire house
        ◦ “configure living room”  playback  in living room
        ◦ “configure office” playback in office
        ◦ “weather update”  gets current weather conditions
        ◦ “weather forecast”  gets 7 day forecast
        ◦ “weather Alert”  tells what the weather alert  are 
        ◦ “Play Music”  local play back of stored music
        ◦ “Play Peggy FM”
        ◦ “Play City FM”
        ◦ “Play Virgin Radio”
        ◦ “Play kiss FM”
        ◦ “Play Power 97”
        ◦ “Play Mix FM”
        ◦ “Play CJOB”
        ◦ “Play TSN”
        ◦ “Play Top Hits”
        ◦ “Play Comedy”
        ◦ “Play UK Radio”
        ◦ “Play Frankfurt Radio”
        ◦ “Play Berlin Radio”
        ◦ “Read Book”  enters book section
                1. “list books” list book collection
                2.  “ chapter #”  jumps to book chapter
                3. “read ‘Title of book ‘ ”  will begin reading that book
        ◦ “Audio Book” enters audio section
                • “Chapter #”   jumps to specified chapter
                • “List Books”
                • “Random short stories” plays random short stories 
                • “Random Sci-fi” play randon scifi novel
                • “Random Horror” Plays random Horror Novel
                • “Random Novel” Plays Random Novel
                • “ Read ‘Title of Book’ ” 
                   
      Domoticz (Home Automation)
        ◦ “turn off/on office lights”
        ◦ “bathroom on/off” bathroom outlets
        ◦ “office on/off”   office outlets 
        ◦ . . . etc
```
