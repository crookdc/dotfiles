.PHONY: sync
sync:
	cp -rsf ~/.dotfiles/. ~/.config/
	rm ~/.config/README.md ~/.config/Makefile ~/.config/xinitrc
