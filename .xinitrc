#!/bin/sh

# key bindings
if [ -f ~/.xmodmaprc ]; then
    xmodmap ~/.xmodmaprc
    ~/libs/xcape/xcape -e 'Control_L=Escape;Alt_R=Caps_Lock'
fi

. /etc/

synclient TouchpadOff=1

xpmroot ~/cracked-screen.png
