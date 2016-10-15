## Installation
Clone the repoostory first.
```
git clone git@github.com:sharjeelaziz/dotfiles.git ~/.dotfiles
```

### [GNU Stow](https://www.gnu.org/software/stow/)

Install .oh_my_zsh

https://github.com/robbyrussell/oh-my-zsh

Install vim

Install Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Install GNU Stow

    Mac:      brew install stow
    Ubuntu:   apt-get install stow
    Fedora:   yum install stow
    Arch:     pacman -S stow

Use stow to install the dotfiles you want to use:

    cd ~/.dotfiles
    stow vim
    stow tmux

Install vim plugins with :PluginInstall
