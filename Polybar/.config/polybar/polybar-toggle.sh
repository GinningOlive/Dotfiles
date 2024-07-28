#!/usr/bin/env bash

if pgrep "polybar" > /dev/null
then
    killall polybar
    killall .polybar-wrapped
else ~/.config/polybar/launch.sh
fi
