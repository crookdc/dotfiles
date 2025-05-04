.PHONY: sync
sync:
	cp -rsf ~/.dotfiles/alacritty/ ~/.config/
	cp -rsf ~/.dotfiles/i3/ ~/.config/
	cp -rsf ~/.dotfiles/polybar/ ~/.config/
	cp -rsf ~/.dotfiles/rofi/ ~/.config/
	cp -rsf ~/.dotfiles/nvim/ ~/.config/
	cp -u ~/.dotfiles/snippets/*.json ~/.vsnip/
	cp -u zshrc ~/.zshrc
