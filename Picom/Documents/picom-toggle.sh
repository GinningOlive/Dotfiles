#!/bin/sh
if pgrep -x "picom" > /dev/null
then
killall picom
else
picom -b --focus-exclude "x = 0 && y = 0 && override_redirect = true"
fi
