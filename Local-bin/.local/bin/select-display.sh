#!/usr/bin/env sh

choices="Extend\nDuplicate\neDP-1\nHDMI-1"

chosen=$(echo -e "$choices" | rofi -dmenu)

if pgrep "Hyprland" > /dev/null
then
case "$chosen" in
	Extend) hyprctl keyword monitor eDP-1, 1920x1080, 1920x0, 1 && hyprctl keyword monitor HDMI-A-1, 1920x1080, 0x0, 1 ;;
	Duplicate) hyprctl keyword monitor eDP-1, 1920x1080, auto, 1 && hyprctl keyword monitor HDMI-A-1, preferred, auto, 1, mirror, eDP-1 ;;
	eDP-1) hyprctl keyword monitor eDP-1, 1920x1080, auto, 1 && hyprctl keyword monitor HDMI-A-1, disable;;
	HDMI-1) hyprctl keyword monitor HDMI-A-1, 1920x1080, auto, 1 && hyprctl keyword monitor eDP-1, disable ;;
esac
else
case "$chosen" in
	Extend) xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal && ~/.fehbg ;;
	Duplicate) xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal ;;
	eDP-1) xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off ;;
	HDMI-1) xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal ;;
esac
fi
