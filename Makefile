place=\
	[ -d $(dir $@) ] || mkdir -p $(dir $@) ;\
	args="$$args -m $${mode:-444}" ;\
	[ -w $@ ] && args="$$args -b" ;\
	install $$args $< $@
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

home_install+=xsession
home_install+=fvwm2rc.m4

vimdirs=colors plugins
vimfiles=$(wildcard vim/colors/* vim/plugin/*)
$(HOME)/.vimrc: vim/vimrc
	$(place)
$(HOME)/.vim/%: vim/%
	$(place)
install+=$(HOME)/.vimrc $(addprefix $(HOME)/.,$(vimfiles))

home_install+=screenrc

$(HOME)/.%: %
	$(place)
install += $(addprefix $(HOME)/.,$(home_install))

install: $(install)
