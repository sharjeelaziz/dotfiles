# Installation

Clone this repository first to the home folder.

```command
git clone git@github.com:sharjeelaziz/dotfiles.git ~/.dotfiles
```

Install zsh, vim, stow, tmux

```command
sudo apt-get install -y zsh vim stow tmux
```

Install Tmux Plugin Manager

<https://github.com/tmux-plugins/tpm>

Clone TPM:

```command
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Put this at the bottom of ~/.tmux.conf ($XDG_CONFIG_HOME/tmux/tmux.conf works too):

```text
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Reload TMUX environment so TPM is sourced:

```command
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

Hit `prefix + I` to fetch the plugin and source it.

Install .oh_my_zsh from the following:

<https://github.com/robbyrussell/oh-my-zsh>

Download cleaner theme

```command
curl https://raw.githubusercontent.com/sharjeelaziz/clean-zsh-theme/main/cleaner.zsh-theme -o ~/.oh-my-zsh/themes/cleaner.zsh-theme
```

Install Vim-Plug from Github

```command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Create a new directory to store plugins

```command
mkdir ~/vimplug-plugins
```

{{< note >}}
Any additional plug-ins to be installed need to be added between the "plug#begin" and "plug#end" lines in `~/.vimrc.plug`.

If you receive an error similar to `E117 Unknown Function: plug#end` check permissions over `~/.vim/` you may need to `chmod -R 0755`.
{{< /note >}}

Use stow to install the dotfiles you want to use:

```bash
cd ~/.dotfiles
stow vim
stow tmux
stow zsh
```

Run vim and install the plugins

```command
:PlugInstall
```

Refer to [GPG-Yubikey](gpg-yubikey.md) for signing commits.

Refer to [ssh resident keys](resident-keys.md).

Refer to [TMUX](TMUX.md) for a refresher.

Refer to [vim](vim.md) for a vim refresher.
