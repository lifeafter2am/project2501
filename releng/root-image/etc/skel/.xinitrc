#!/bin/bash

# Fire up apps
urxvtd &
xbindkeys & 
xscreensaver -no-splash &
feh --bg-scale ./abstract-x3.png

# Launch selected WM with background

case "$1" in
	xmonad)
		feh --bg-scale --no-fehbg .wallpaper/fryguybig.png
		exec xmonad
		;;
	subtle)
		feh --bg-scale --no-fehbg .wallpaper/subtle.jpg
		exec subtle
		;;
	dwm)
		feh --bg-scale --no-fehbg .wallpaper/3952427276_dab508d537_o.png
		exec dwm
		;;
esac
