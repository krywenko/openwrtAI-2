#!/usr/bin/env python3

import speech_recognition as sr

r = sr.Recognizer()
with sr.AudioFile('/tmp/mic.wav') as source:
    audio = r.record(source, duration=60) 

command = r.recognize_google(audio)

text_file = open("Output.txt", "w")
text_file.write(command)
text_file.close()
