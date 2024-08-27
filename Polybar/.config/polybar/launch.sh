#!/usr/bin/env bash

source ~/.cache/wal/colors.sh
export color0_alpha="#bf${color0/'#'}"

killall polybar &
killall .polybar-wrapped &
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main -c ~/.config/polybar/config.ini
