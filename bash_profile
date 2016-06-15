. ~/.bashrc

if [[ -f ~/.bash_profile.local ]] ; then
	. ~/.bash_profile.local
elif [[ -x /bin/zsh ]] ; then
	export SHELL=/bin/zsh
	exec /bin/zsh -l
elif [[ -x /usr/bin/zsh ]] ; then
	export SHELL=/usr/bin/zsh
	exec /usr/bin/zsh -l
fi

while ! tput longname > /dev/null 2>&1 ; do
	case $TERM in
		(mrxvt) 	TERM=rxvt ;;
		(screen-*) 	TERM=screen ;;
		(xterm-*) 	TERM=xterm ;;
		(*tmux)		TERM=screen ;;
		(*) echo "TERM=$TERM unknown" ; break ;;
	esac
done

mesg y
uname -a
w
