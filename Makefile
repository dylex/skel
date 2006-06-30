place=\
	[ -d $(dir $@) ] || mkdir -p $(dir $@) ;\
	args="$$args -m $${mode:-444}" ;\
	targ='$@' ;\
	[ -f $$targ.keep ] && targ=$$targ.skel ;\
	[ -w $$targ ] && args="$$args -b" ;\
	install $$args $< $$targ
install=

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
install+=$(zshinstall) $(addsuffix .zwc,$(zshinstall))

home_install+=xsession xkeymap Xdefaults
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

$(HOME)/.%: %
	$(place)
install+=$(addprefix $(HOME)/.,$(home_install))

install: $(install)
