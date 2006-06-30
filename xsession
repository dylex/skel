#!/bin/sh
cd $HOME
export PATH=/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:$HOME/bin

xmodmap -pke > .Xmodmap.default
[ -f .Xmodmap ] && xmodmap .Xmodmap

[ -p .xtail ] && rm -f .xtail
[ -p .xrw ] && rm -f .xrw

exec fvwm2 -cmd "ModuleSynchronous FvwmM4 -lock $HOME/.fvwm2rc.m4"
