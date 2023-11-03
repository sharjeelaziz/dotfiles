# Installation

Clone this repository first to the home folder.

```bash
git clone git@github.com:sharjeelaziz/dotfiles.git ~/.dotfiles
```

Install zsh, vim, stow, tmux

```bash
sudo apt-get install -y zsh vim stow tmux
```

Install Tmux Plugin Manager

<https://github.com/tmux-plugins/tpm>

Clone TPM:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Put this at the bottom of ~/.tmux.conf ($XDG_CONFIG_HOME/tmux/tmux.conf works too):

```text
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Reload TMUX environment so TPM is sourced:

```bash
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

Hit `prefix + I` to fetch the plugin and source it.

Install .oh_my_zsh from the following:

<https://github.com/robbyrussell/oh-my-zsh>

Download cleaner themne

```bash
curl https://raw.githubusercontent.com/sharjeelaziz/clean-zsh-theme/main/cleaner.zsh-theme -o ~/.oh-my-zsh/themes/cleaner.zsh-theme
```

Install Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Use stow to install the dotfiles you want to use:

```bash
cd ~/.dotfiles
stow vim
stow tmux
stow zsh
```

Install vim plugins in vim with the command `:PluginInstall`

Note:
Fix for "Cannot find color scheme solarized" error.

```bash
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
```

Refer to [GPG-Yubikey](gpg-yubikey.md) for signing commits.

Refer to [TMUX](TMUX.md) for a refresher.
