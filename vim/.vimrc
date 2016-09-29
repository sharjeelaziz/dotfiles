set nocompatible              " be iMproved, required
filetype off                  " required

" Solarized Dark
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch
let python_highlight_all = 1
set shiftround

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colors-solarized

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'

call vundle#end()            " required

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
filetype plugin indent on    " required
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"colorscheme solarized
