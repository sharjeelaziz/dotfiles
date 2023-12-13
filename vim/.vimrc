set nocompatible
filetype off

" syntax highlighting
syntax on

" for plug-ins to load
filetype plugin indent on

" turn off modelines
set modelines=0

" spell check

set spell spelllang=en_us

" automatically wrap text
set wrap

" vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" display 6 lines above/below the cursor when scrolling with a mouse
set scrolloff=6

" fixes common backspace problems
set backspace=indent,eol,start

" speed up scrolling in Vim
set ttyfast

" status bar
set laststatus=2

" display options
set showmode
set showcmd

" highlight matching pairs of brackets. Use the '%' character to jump between them
set matchpairs+=<:>

" display different types of white spaces
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" show line numbers
set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" encoding
set encoding=utf-8

" highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" include matching uppercase words with lowercase search term
set ignorecase

" include only uppercase words with uppercase search term
set smartcase

" store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files
set viminfo='100,<9999,s100

" map the <Space> key to toggle a selected fold opened/closed
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" Map key chord `jk` to <Esc>
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
