#!/bin/sh
export PATH=/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:$HOME/bin
xmodmap -pke > $HOME/.Xmodmap.default
xmodmap $HOME/.Xmodmap
rm -f $HOME/.xtail $HOME/.xrw
exec fvwm2 -cmd "ModuleSynchronous FvwmM4 -lock -debug $HOME/.fvwm2rc.m4"
