set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable

set background=dark
let g:solarized_termcolors=256

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colors-solarized

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required

filetype plugin indent on    " required

colorscheme solarized
