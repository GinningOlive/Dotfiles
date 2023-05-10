#!/bin/sh

choices="Extend\nDuplicate\neDP-1\nHDMI-1"

chosen=$(echo -e "$choices" | rofi -dmenu)

case "$chosen" in
	Extend) xrandr --output eDP-1 --primary --mode 1366x768 --pos 1280x0 --rotate normal --output HDMI-1 --mode 1280x720 --pos 0x48 --rotate normal ;;
	Duplicate) xrandr --output eDP-1 --primary --mode 1280x720 --pos 0x0 --rotate normal --output HDMI-1 --mode 1280x720 --pos 0x0 --rotate normal ;;
	eDP-1) xrandr --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --off ;;
	HDMI-1) xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off ;;
esac
