## Installation
Clone this repository first to the home folder.
```
$ git clone git@github.com:sharjeelaziz/dotfiles.git ~/.dotfiles
```

Install zsh, vim, stow, tmux

```
$ sudo apt-get install -y zsh vim stow tmux
```

Install .oh_my_zsh from the following:

https://github.com/robbyrussell/oh-my-zsh

Install Vundle
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Use stow to install the dotfiles you want to use:
```
$ cd ~/.dotfiles
$ stow vim
$ stow tmux
$ stow zsh
```
Install vim plugins in vim with the command ```:PluginInstall```

Note:
Fix for "Cannot find color scheme solarized" error.

```
$ cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
```

Refer to gpg-yubikey.md for gpg siging with github.
