#!/bin/bash
# NOTE: Modified from https://superuser.com/questions/1170136/translating-midi-input-into-computer-keystrokes-on-linux
# NOTE: Modified again from https://github.com/chrisdonahue/midi2key_linux
aseqdump -p "USB MIDI Interface" | \
while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest; do
    case "$ev1 $ev2 $data1" in
        "Note on 38" ) xdotool keydown h && echo Down On ;; # Snare
        "Note on 40" ) xdotool keyup h && echo Down Off ;; # Snare Rim
        "Note on 48" ) xdotool keydown j && echo Left On ;; # Tom 1
        "Note on 50" ) xdotool keyup j && echo Left Off ;; # Tom 1 Rim
        "Note on 45" ) xdotool keydown k && echo Up On ;; # Tom 2
        "Note on 47" ) xdotool keyup k && echo Up Off ;; # Tom 2 Rim
        "Note on 43" ) xdotool keydown l && echo Right On ;; # Tom 3
        "Note on 58" ) xdotool keyup l && echo Right Off ;; # Tom 3 Rim
        "Note on 46" ) xdotool keyup c && echo Z Up ;; # High Hat Open
        "Note on 42" ) xdotool key v && echo C Down ;; # High Hat Closed
        "Note on 49" ) xdotool key i && echo L ;; # Crash
        "Polyphonic aftertouch 49" ) xdotool key b && echo C Left ;; # Grab Crash
        "Note on 51" ) xdotool key o && echo R ;; # Ride
        "Polyphonic aftertouch 51" ) xdotool key n && echo C Up ;; # Grab Ride
        "Note on 57" ) xdotool key p && echo B ;; # China
        "Not a thing but i wish it was" ) xdotool key m && echo C Right ;; # Grab China
        "Note on 36" ) xdotool keydown x && sleep 0.2 && xdotool keyup x && echo A ;; # Kick
        "Note on 44" ) xdotool keydown c && echo Z Down ;; # High Hat Pedal
    esac
done
