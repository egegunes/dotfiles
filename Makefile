all: dotfiles vim dconf

dotfiles:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".dotfiles"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

vim:
	mkdir -p $(HOME)/.vim/
	ln -sfn $(CURDIR)/vimrc $(HOME)/.vim/vimrc

dconf:
	dconf load /com/gexperts/Tilix/ < $(CURDIR)/tilix.dconf
	dconf load /org/gnome/nautilus/ < $(CURDIR)/nautilus.dconf
	dconf load /org/gnome/desktop/wm/keybindings/ < $(CURDIR)/keybindings.system.dconf
	dconf load /plugins/media-keys/custom-keybindings/ < $(CURDIR)/keybindings.custom.dconf

dconf-dump:
	dconf dump /com/gexperts/Tilix/ > $(CURDIR)/tilix.dconf
	dconf dump /org/gnome/nautilus/ > $(CURDIR)/nautilus.dconf
	dconf dump /org/gnome/desktop/wm/keybindings/ > $(CURDIR)/keybindings.system.dconf
	dconf dump /plugins/media-keys/custom-keybindings/ > $(CURDIR)/keybindings.custom.dconf
