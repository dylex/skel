[[ ! -f /etc/bashrc ]] || . /etc/bashrc

umask 022

export PATH=$HOME/bin:$PATH:/sbin:/usr/sbin
[[ -d /usr/local/bin ]] && PATH=$PATH:/usr/local/bin:/usr/local/sbin

PS1='\h:\w [\j]>'

export PAGER=`which less 2> /dev/null`
[[ -n $PAGER ]] || PAGER=`which more 2> /dev/null`
export VISUAL=`which vim 2> /dev/null`
[[ -n $VISUAL ]] || VISUAL=`which vi 2> /dev/null`
#export EDITOR=$VISUAL
export CVS_RSH=ssh
export BROWSER=`which elinks 2> /dev/null`
export PERLLIB=$HOME/bin/perllib
#export PYTHONSTARTUP=~/.pythonrc
#export CC=gcc
#export CXX=g++
export MANSECT=2:3:1:8:6:4:5:7:9:0:x:n:l
export TZ=America/New_York
unset LANG

#eval `dircolors -b ~/.dircolors` 
case $TERM in
	(*rxvt*|xterm-*|screen*|*tmux*) # 256 color/xtermy
		export LS_COLORS='no=00:fi=00:di=07:ln=04:or=04;05:do=07;35:pi=07;34:so=07;35:bd=07;31:cd=07;33:ex=38;5;87:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:*.c=01;34:*.cc=01;38;5;26:*.cpp=01;38;5;26:*.h=01;38;5;21:*.hh=01;38;5;25:*.ml=01;38;5;57:*.mli=01;38;5;56:*.hs=01;38;5;93:*.hsc=01;38;5;57:*.s=38;5;38:*.m=01;38;5;33:*.o=38;5;68:*.a=38;5;110:*.so=38;5;117:*.cmi=38;5;62:*.cmo=38;5;68:*.cmx=38;5;104:*.hi=38;5;98:*.mex=38;5;69:*Makefile=04;38;5;111:*.cgi=38;5;159:*.sh=38;5;147:*.pl=38;5;141:*.pm=38;5;135:*.php=38;5;129:*.tar=01;38;5;249:*.tgz=01;38;5;254:*.tar.gz=01;38;5;254:*.tar.bz2=01;38;5;255:*.gz=38;5;254:*.bz2=38;5;255:*.jpg=38;5;118:*.jpeg=38;5;118:*.gif=38;5;40:*.png=38;5;46:*.bmp=38;5;41:*.ppm=38;5;42:*.pnm=38;5;42:*.xbm=38;5;36:*.xpm=38;5;37:*.xcf=38;5;47:*.fig=01;38;5;38:*.wav=38;5;119:*.au=38;5;119:*.mp3=38;5;155:*.midi=38;5;114:*.tex=01;38;5;220:*.html=01;38;5;184:*.ps=38;5;186:*.pdf=38;5;222:*.dvi=38;5;185:*.doc=38;5;148:*.xls=38;5;149:*.gnumeric=38;5;192:*.xml=38;5;180:*.diff=04;38;5;146:*.txt=38;5;161:*.log=38;5;132:*INSTALL=38;5;203:*README=38;5;203:*.dump=38;5;172:*,v=04;38;5;126:' ;;
	(*)
		export LS_COLORS='no=00:fi=00:di=07:ln=04:or=04;05:pi=07;34:so=07;35:bd=07;31:cd=07;33:ex=01;36:*.cgi=36:*.c=01;34:*.cc=01;34:*.cpp=01;34:*.h=01;34:*.hh=01;34:*.ml=01;34:*.mli=01;34:*.hs=01;34:*.hsc=01;34:*.s=01;34:*.m=01;34:*.o=34:*.a=34:*.so=34:*.cmi=34:*.cmo=34:*.cmx=34:*.hi=34:*.mex=34:*Makefile=04;34:*.sh=35:*.pl=35:*.pm=01;35:*.php=01;35:*.tar=01:*.tgz=01:*.gz=01:*.bz2=01:*.jpg=01;32:*.jpeg=01;32:*.gif=01;32:*.png=01;32:*.bmp=01;32:*.ppm=01;32:*.pnm=01;32:*.xbm=01;32:*.xpm=01;32:*.xcf=01;32:*.fig=32:*.wav=01;33:*.au=01;33:*.mp3=01;33:*.midi=33:*.tex=33:*.html=33:*.ps=01;33:*.pdf=01;33:*.dvi=01;33:*.doc=01;33:*.xls=01;33:*.gnumeric=01;33:*.xml=33:*.diff=04;34:*.txt=31:*.log=31:*INSTALL=31:*README=31:*,v=04;32:' ;;
esac

alias c='cd; clear;'
alias f='fg'
alias b='bg'
alias j='jobs'
case $OSTYPE in
	(linux*)
		alias ls='ls --color=auto'
		alias p='ps -AH So pid,user,stat,pcpu,bsdtime,start_time,vsz,command'
		alias pw='ps -AH o pid,user,group,tty8,stat,pcpu,cputime,etime,pmem,rsz,vsz,command'
		alias pl='ps -A o comm,pid,uid,gid,sz,rssize,vsize,nice,s,alarm,flags,wchan --sort session,pgrp,pid'
		alias w='w -f'
		;;
	(freebsd*)
		alias ls='gls --color=auto'
		alias l='\ls -li'
		alias p='ps -auxf'
		alias make='gmake'
		alias seq='gseq'
		;;
	(darwin*)
		alias p='ps -axf'
		;;
	(*)
		alias p='ps -auxf'
		;;
esac
alias vi='vim'
alias v='vim -c "normal '"'"'0"'

alias ht=$BROWSER
alias rm='rm -I'
alias grep='grep -n --color'
alias gerp='grep'
alias spell='aspell -a'
alias sr='screen -r main || screen -r'
alias sz='su zoot'
alias mplay='mplayer'
alias mplaya='mplayer -profile music'
alias xtmux='tmux -f ~/.xtmux.conf -x'

[[ ! -f ~/.bashrc.local ]] || . ~/.bashrc.local
