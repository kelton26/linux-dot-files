#!/bin/bash

WALL1="/home/kelton/wallpapers/wall.jpg"
WALL2="/home/kelton/wallpapers/wall1.jpg"

chosen=$(printf \
  "Wallpaper 1\0icon\x1f%s\nWallpaper 2\0icon\x1f%s\nbtop\nKill all\nFans\nKeyboard\n" \
  "$WALL1" "$WALL2" |
  rofi -dmenu -p "Switch Wallpaper" -show-icons)

case "$chosen" in
"Wallpaper 1")
  pkill -f 'kitten panel'
  awww-daemon
  awww img "$WALL1" --transition-type random --transition-fps=60
  ;;
"Wallpaper 2")
  pkill -f 'kitten panel'
  awww-daemon
  awww img "$WALL2" --transition-type random --transition-fps=60
  ;;
"btop")
  kitten panel --edge=background btop
  ;;
"Kill all")
  pkill awww-daemon
  pkill -f 'kitten panel'
  ;;
"Fans")
  hyprctl 'dispatch exec [float] nbfc-gtk'
  ;;
"Keyboard")
  python ~/python/app.py
  ;;
esac
