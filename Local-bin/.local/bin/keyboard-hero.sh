#!/bin/bash
# NOTE: Modified from https://superuser.com/questions/1170136/translating-midi-input-into-computer-keystrokes-on-linux
# NOTE: Modified again from https://github.com/chrisdonahue/midi2key_linux
aseqdump -p "Launchkey Mini MK3" | \
while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest; do
    case "$ev1 $ev2 $data1" in
        "Note on 72" ) xdotool keydown q ;; # Green ON
        "Note off 72" ) xdotool keyup q ;; # Green OFF
        "Note on 71" ) xdotool keydown w;; # Red ON
        "Note off 71" ) xdotool keyup w;; # Red OFF
        "Note on 69" ) xdotool keydown e;; # Yellow ON
        "Note off 69" ) xdotool keyup e;; # Yellow OFF
        "Note on 67" ) xdotool keydown r;; # Blue ON
        "Note off 67" ) xdotool keyup r;; # Blue OFF
        "Note on 65" ) xdotool keydown t;; # Orange ON
        "Note off 65" ) xdotool keyup t;; # Orange OFF
        "Note on 64" ) xdotool key space;; # 
        "Note on 62" ) xdotool key enter;; # 
        "Note on 60" ) xdotool key space;; # 
        "Note on 59" ) xdotool key enter;; # 
        "Note on 57" ) xdotool key space;; # 
        "Note on 55" ) xdotool key enter;; # 
        "Note on 53" ) xdotool key space;; # 
        "Note on 52" ) xdotool key enter;; # 
        "Note on 50" ) xdotool key space;; # 
        "Note on 48" ) xdotool key enter;; # 
    esac
done
