set nocompatible

set cindent
autocmd FileType python setlocal foldmethod=marker smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

let g:airline_theme='bubblegum'
execute pathogen#infect()
syntax on

filetype on
filetype indent on
filetype plugin on
set t_Co=256

colorscheme peachpuff

set term=$TERM      " Make arrow keys and mouse work

highlight clear LineNr

" basic settings
set nowrap
set noswapfile
set backspace=indent,eol,start
set mouse=a
set number

set noerrorbells
"set foldmethod=syntax

set vb t_vb=
set fillchars+=vert:│
set list
set listchars=tab:\│\ ,trail:-
set laststatus=2
set splitright
set splitbelow
set completeopt=longest,menuone


" CTRL-V and SHIFT-Insert are Paste
inoremap <C-V>   	<ESC>"+gp

" cursorline
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" statusline
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset



