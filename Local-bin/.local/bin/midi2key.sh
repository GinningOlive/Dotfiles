#!/bin/bash
# NOTE: Modified from https://superuser.com/questions/1170136/translating-midi-input-into-computer-keystrokes-on-linux
# NOTE: Modified again from https://github.com/chrisdonahue/midi2key_linux
aseqdump -p "USB MIDI Interface" | \
while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest; do
    case "$ev1 $ev2 $data1" in
        "Note on 38" ) xdotool key && echo Snare ;; # Snare
        "Note on 40" ) xdotool key && echo Snare Rim ;; # Snare Rim
        "Note on 48" ) xdotool key && echo Tom 1 ;; # Tom 1
        "Note on 50" ) xdotool key && echo Tom 1 Rim ;; # Tom 1 Rim
        "Note on 45" ) xdotool key && echo Tom 2 ;; # Tom 2
        "Note on 47" ) xdotool key && echo Tom 2 Rim ;; # Tom 2 Rim
        "Note on 43" ) xdotool key && echo Tom 3 ;; # Tom 3
        "Note on 58" ) xdotool key && echo Tom 3 Rim ;; # Tom 3 Rim
        "Note on 46" ) xdotool key && echo High Hat Open ;; # High Hat Open
        "Note on 42" ) xdotool key && echo High Hat Closed ;; # High Hat Closed
        "Note on 49" ) xdotool key && echo Crash ;; # Crash
        "Polyphonic aftertouch 49" ) xdotool key && echo Grab Crash ;; # Grab Crash
        "Note on 51" ) xdotool key && echo Ride ;; # Ride
        "Polyphonic aftertouch 51" ) xdotool key && echo C Up ;; # Grab Ride
        "Note on 57" ) xdotool key && echo China ;; # China
        "Not a thing but i wish it was" ) xdotool key && echo Grab China ;; # Grab China
        "Note on 36" ) xdotool key && echo Kick ;; # Kick
        "Note on 44" ) xdotool key && echo High Hat Pedal ;; # High Hat Pedal
    esac
done
