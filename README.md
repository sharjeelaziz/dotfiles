## Installation
Clone the repoostory first.
```
git clone git@github.com:sharjeelaziz/dotfiles.git ~/.dotfiles
```

### [GNU Stow](https://www.gnu.org/software/stow/)

Install GNU Stow

    Mac:      brew install stow
    Ubuntu:   apt-get install stow
    Fedora:   yum install stow
    Arch:     pacman -S stow

Use stow to install the dotfiles you want to use:

    cd ~/.dotfiles
    stow vim
    stow tmux
