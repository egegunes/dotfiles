.PHONY: all bash vim emacs git tmux dconf

all: bash vim git

bash:
	for file in $(CURDIR)/bash/*; do \
		name=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.$$name; \
	done; \

vim:
	mkdir -p $(HOME)/.vim/
	ln -sfn $(CURDIR)/vim/vimrc $(HOME)/.vim/vimrc
	ln -sfn $(CURDIR)/vim/ftplugin $(HOME)/.vim/ftplugin
	ln -sfn $(CURDIR)/vim/indent $(HOME)/.vim/indent

emacs:
	mkdir -p $(HOME)/.emacs.d/
	ln -sfn $(CURDIR)/emacs.d/init.el $(HOME)/.emacs.d/init.el

git:
	ln -sfn $(CURDIR)/git/gitconfig $(HOME)/.gitconfig

tmux:
	git clone https://github.com/arl/tmux-gitbar.git ~/.tmux-gitbar
	ln -sfn $(CURDIR)/tmux/tmux.conf $(HOME)/.tmux.conf

dconf:
	dconf load /com/gexperts/Tilix/ < $(CURDIR)/dconf/tilix.dconf
	dconf load /org/gnome/nautilus/ < $(CURDIR)/dconf/nautilus.dconf
	dconf load /org/gnome/desktop/wm/keybindings/ < $(CURDIR)/dconf/keybindings.system.dconf
	dconf load /plugins/media-keys/custom-keybindings/ < $(CURDIR)/dconf/keybindings.custom.dconf

dconf-dump:
	dconf dump /com/gexperts/Tilix/ > $(CURDIR)/dconf/tilix.dconf
	dconf dump /org/gnome/nautilus/ > $(CURDIR)/dconf/nautilus.dconf
	dconf dump /org/gnome/desktop/wm/keybindings/ > $(CURDIR)/dconf/keybindings.system.dconf
	dconf dump /plugins/media-keys/custom-keybindings/ > $(CURDIR)/dconf/keybindings.custom.dconf
