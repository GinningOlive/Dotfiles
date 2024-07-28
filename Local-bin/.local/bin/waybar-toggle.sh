#!/usr/bin/env bash

if pgrep waybar > /dev/null
then
    killall waybar
    killall .waybar-wrapped
    killall cava
else waybar
fi
