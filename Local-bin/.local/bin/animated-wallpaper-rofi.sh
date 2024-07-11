#!/bin/sh

# killall bash ; back4.sh 0.01 ~/Pictures/gifs/$(ls ~/Pictures/gifs/ | rofi -dmenu)

killall bash ; gif-wallpaper.sh 0.01 ~/Pictures/gifs/$(ls ~/Pictures/gifs/ | rofi -dmenu)
