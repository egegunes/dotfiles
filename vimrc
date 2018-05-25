set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/csapprox'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

"colors
set t_Co=256
set background=dark
highlight Normal guibg=black guifg=white
highlight LineNr guibg=black guifg=white
highlight CursorLineNr guibg=black guifg=yellow
highlight StatusLine guibg=white guifg=black
highlight Pmenu guibg=black guifg=yellow
highlight PmenuSel guibg=yellow guifg=black
highlight Visual guibg=yellow guifg=black
highlight ExtraWhitespace ctermbg=red guibg=red
highlight DiffAdd guibg=black guifg=green
highlight DiffChange guibg=black guifg=yellow
highlight DiffDelete guibg=black guifg=red
match ExtraWhitespace /\s\+$/

"allow backspacing over everything in insert mode
set backspace=eol,indent,start

"store lots of :cmdline history
set history=1000

"show incomplete cmds down the bottom
set showcmd
"show current mode down the bottom
set showmode
"show matching braces
set showmatch

"show relative line numbers
set relativenumber
"show current line number
set number

"find the next match as we type the search
set incsearch
"highlight searches by default
set hlsearch
"Ignore case in search patterns
set ignorecase
"Override the ignore case option if the search pattern contains upper case characters.
set smartcase

"dont wrap lines
set wrap
"wrap lines at convenient points
set linebreak

"default indent settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

"turn on syntax highlighting
syntax on

"load ftplugins and indent files
filetype plugin on
filetype indent on

au FileType json set syntax=off
au FileType yaml,html
    \ set shiftwidth=2 |
    \ set softtabstop=2
au FileType markdown set tw=79
au FileType asciidoc
    \ set syntax=asciidoc |
    \ set tw=79 |
    \ set formatoptions=tcqn
au FileType go set noexpandtab
au FileType php
    \ set noexpandtab |
    \ set softtabstop=4 |
    \ set shiftwidth=4


"disable mouse
set mouse=c

"it's good for performance, but idk how
set lazyredraw

"undo settings
set noundofile

set noswapfile

"always show status line
set laststatus=2
"status line setup
set statusline=%n\ %f\ %y    "tail of the filename
set statusline+=%*
"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%h      "help file flag
"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*
"modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*
set statusline+=\ 
set statusline+=%{fugitive#statusline()}
set statusline+=%=(%l/%L):%v\ %P

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set wildchar=<Tab> wildmenu wildmode=full

set rtp+=~/.fzf

"MAPPINGS
let mapleader="\<Space>"
let maplocalleader=","

map q: :q
map gb :Gblame<CR>
map gl :Commits<CR>
map gd :Gdiff<CR>
map <C-x> :bdelete<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> 0 g0
nnoremap <silent> $ g$
nnoremap <C-p> :Files<CR>
nnoremap L :bprevious<CR>
nnoremap H :bnext<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

noremap <leader>h :nohlsearch<CR>
noremap <CR> o<Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap ı i
noremap Y y$

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap jk <esc>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
inoremap <C-d> <C-o>x

" ABBREVIATIONS
func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

iabbr cnslg console.log();jkhi<C-R>=Eatchar('\s')<CR>
iabbr ipdb import ipdb; ipdb.set_trace()<C-R>=Eatchar('\s')<CR>
iabbr srak self, request, *args, **kwargs<C-R>=Eatchar('\s')<CR>
