# Sully's Neovim configuration

It's always a work in progress.

## Showcase
![Normal editor](https://cdn.discordapp.com/attachments/830634208803160125/1073807313254744127/image.png)

![File explorer](https://cdn.discordapp.com/attachments/830634208803160125/1073807615043317861/image.png)

![Fuzzy finder](https://cdn.discordapp.com/attachments/830634208803160125/1073807716147015802/image.png)

## TODO
- [ ] Make an install script
- [ ] Add extra smart logic for lexima plugin (Ex. Don't create 2 spaces in markdown file when creating checkmark, etc.)
- [ ] Start using tmux, then remove tab system
- [ ] Find a better way to manage themes & color overrides (specifically color overrides)
- [X] Finish lspsaga support
- [X] Customize the netrw menu
- [ ] Find a good easymotions-like plugin (jump via character match instead of line number)
- [X] Fix bug with GitSigns sidebar where gitsign characters have different background highlight than normal background
- [ ] Rewrite customized cmp overrides in a better way (currently using a bunch of vim.cmd highlight lines)

## Requirements
- Neovim v0.8.0 (Tested with .deb package installation)
- [Ripgrep system package](https://github.com/BurntSushi/ripgrep#installation) (This is needed for the todo-comments plugin)

## Optional tweaks 
- [Install Jetbrains Mono Nerd Font](.fonts/)
- For Kitty terminal theme: run `kitty +kitten theme` and select 'Square' [View the theme here](https://github.com/dexpota/kitty-themes#square)
- For Alacrity terminal theme: use [this](https://github.com/nyoom-engineering/oxocarbon-alacritty)

## Installing (Only tested with .deb neovim install method)
- Clone repo and move/rename directory to `<YOUR-HOME-PATH>/.config/nvim`
- ![Install packer according to their repository](https://github.com/wbthomason/packer.nvim):
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
- Open lua/plugins.lua and run excommand `:PackerSync`
- When prompted by the editor about configuring your work environment, select option 1 (Apply and modify settings)
- Done!

## Uninstalling (Only tested with .deb neovim install method)
- Run the following commands to completely uninstall nvim binary & configuration
```
# Removes the binary
sudo rm -rf /usr/nvim

# Removes the configuration
rm -rf ~/.config/nvim

# Removes packer plugins and other misc things
rm -rf ~/.local/share/nvim
```
