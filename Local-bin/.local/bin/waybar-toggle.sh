#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    killall waybar
    killall cava
else waybar
fi
