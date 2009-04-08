#!/bin/sh
cd $HOME
export PATH=$HOME/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin
unset SHLVL

xmodmap -pke > .Xmodmap.default
[ -f .Xmodmap ] && xmodmap .Xmodmap
xset $( for i in 37 50 62 64 66 `seq 67 76` 77 95 96 106 109 113 115 116 117 ; do echo "-r $i" ; done )

[ -p .xtail ] && rm -f .xtail
[ -p .xrw ] && rm -f .xrw

rm -f /tmp/fvwmrc*
exec fvwm2 -cmd "ModuleSynchronous FvwmM4 -lock -outfile $HOME/.fvwm2rc.out -debug $HOME/.fvwm2rc.m4"
