place=\
	args="$$args -p -D -m $${mode:-444}" ;\
	targ='$@' ;\
	[ -f $$targ.keep ] && echo "Preserving $$targ" && targ=$$targ.skel ;\
	[ -w $$targ ] && echo "Backing up $$targ" && args="$$args -b" ;\
	install $$args $< $$targ
install=
HOST:=$(shell hostname -s)

default:

ZSHDIR:=$(shell zsh -c 'echo $${ZDOTDIR:-~}')
$(ZSHDIR)/.%: zsh/%
	$(place)
ZSHFDIR:=$(HOME)/.zsh/func
$(ZSHFDIR)/%: zsh/func/%
	$(place)
%.zwc: %
	zsh -c 'zcompile -U $^'
zshrcs=zshenv zshrc zlogin
zshfunc=$(notdir $(wildcard zsh/func/*))
zshinstall+=$(addprefix $(ZSHDIR)/.,$(zshrcs)) $(addprefix $(ZSHFDIR)/,$(zshfunc))
ifneq ($(ZSHDIR),)
install+=$(zshinstall) $(addsuffix .zwc,$(zshinstall))
endif

home_install+=xsession xkeymap Xdefaults
$(HOME)/.xinitrc: $(HOME)/.xsession
	ln -f $< $@
home_install+=xinitrc
$(HOME)/.fvwm2rc.m4: fvwm/fvwm2rc.m4
	$(place)
home_install+=fvwm2rc.m4
home_install+=fvwm/cdmenu.pl

vimdirs=colors plugins
vimfiles=$(wildcard vim/colors/* vim/plugin/*)
$(HOME)/.vimrc: vim/vimrc
	$(place)
$(HOME)/.vim/%: vim/%
	$(place)
home_install+=vimrc $(vimfiles)

home_install+=screenrc
home_install+=tmux.conf xtmux.conf
home_install+=elinks/elinks.conf
home_install+=inputrc
home_install+=mailrc
home_install+=ghci
home_install+=orpierc
home_install+=nethackrc
home_install+=vimperatorrc
home_install+=gitconfig gitignore
home_install+=drxvtrc
home_install+=gtkrc-2.0

home_install+=less
$(HOME)/.less: lesskey
	lesskey -o $@ $<

home_install+=xpdfrc

$(HOME)/bin/%: bin/%
	mode=555 ; $(place)
install+=$(addprefix $(HOME)/,$(wildcard bin/*))

$(HOME)/.%: %
	$(place)
install+=$(addprefix $(HOME)/.,$(home_install))

install: $(install)
