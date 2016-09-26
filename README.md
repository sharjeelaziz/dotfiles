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

Install Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
#### Notes
```.oh-my-zsh``` is subtree and can be created using the following:

```
git subtree add --prefix oh-my-zsh/.oh-my-zsh git@github.com:robbyrussell/oh-my-zsh.git master --squash
```

Issue a subtree pull to update the ```oh-my-sh``` folder.

```
git subtree pull --prefix oh-my-zsh/.oh-my-zsh git@github.com:robbyrussell/oh-my-zsh.git master --squash
```
