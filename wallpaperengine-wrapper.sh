#!/bin/bash
ACTIVE_WALLPAPER=$(jq -r .active_wallpaper ~/.config/linux-wallpaperengine/wallpaper.json)
MONITORS=$(niri msg -j outputs | jq -r 'keys[0]')

pkill linux-wallpaper

while read -r line; do
	niri msg action spawn-sh -- "linux-wallpaperengine -r $line -b $ACTIVE_WALLPAPER --scaling fill --screenshot ~/Pictures/Wallpapers/${ACTIVE_WALLPAPER}.png"
done < <(echo $MONITORS)

qs -c noctalia-shell ipc call wallpaper set ~/Pictures/Wallpapers/${ACTIVE_WALLPAPER}.png eDP-1
