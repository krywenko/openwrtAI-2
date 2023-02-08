# openwrtAI-2
openwrtAI 
openwrt Basic AI software V2 . has built in levenshtein  for fuzzy logic control , also  set up to work with kaldi docker for offline usage . if it  detected you are offline it will start the docker container for uninterrupted basic usage and then once online again it will shut down the container ( if you have enough memory to run it as it requires  ~ 6 gigs of memory.. if not  then use whisper tiny  that requires 1gig of memory).
 
 fuzzy logic of levenshtien -- it compares a know list  of patterns for your voice  (ITEM.list) to what was transcribed  via kaldi or speech.reconginition   ITEM.list corrisponds to your if/elif conditions.  - so if say you wanted  to listem to peggy FM .. and you say "play Peggy FM"  but it was transcribed as  "play peg"  or "a play peggy FM" or even "play peggy of em" levenshien  will  compare that to the list of know conditions  and choose  "play peggy fm"  if the range is with in -a 3 (3 degrees of seperation) you can adjust it up or down for more or less flexiblity .  benifit of it greatly reduces if/elif conditions.  for commands that are unlikely to have very little variation ie "play peggy fm" then a single if/elif condition   is enough..  stuff that has  multiple variences such "turn on/off kitchen light"  or pluralized version, or kitchen lights on/off -  levenshtien  will reduce  it to a couple  if/elif  conditions "turn on kitchen light"  "kitchen light on"
 
 it can be uses  on systems  that do not require chroot or within chroot  you just need to adjust chroot sections to  localize copies . so instead of coping  the bash files from chroot directory  to your chroot /bin folder you would jus copy it to your localized /bin folder  and install all programs locally , vlc, mplayer and flite. 
 included is the bash script to build the chroot folder for you, with all the required sofware installed, if you want the higher functions of multichannel manipulation ( 4.0, 5.1 and 7.1 sound systems)  and better webradio playback support. otherwise it not required for a very small foot print install.. such as speech.recognition, gtts  and mpg123
 domoticz folder contains the basic on of switch for openwrtAI- since domotizc  runs as nobody.  you have to pass your password to it  
 ``
 ie: AI_ON.sh "password"    to raise  it level
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
tar -xvf fac.tar.xzgit clone https://github.com/rbm78bln/levenshtein.git
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
and you are off and running

openwrtAI is the main executable
