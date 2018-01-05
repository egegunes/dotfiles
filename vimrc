set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'henrik/vim-indexed-search'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/csapprox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

"colors
set t_Co=256
set background=dark
highlight Normal guibg=black guifg=white
highlight LineNr guifg=white
highlight CursorLineNr guifg=yellow
highlight StatusLine guibg=white guifg=black
highlight Pmenu guibg=black guifg=yellow
highlight PmenuSel guibg=yellow guifg=black
highlight Visual guibg=yellow guifg=black
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ErrorMsg '\%>120v.\+'

"allow backspacing over everything in insert mode
set backspace=eol,indent,start

"store lots of :cmdline history
set history=1000

"show incomplete cmds down the bottom
set showcmd
"show current mode down the bottom
set showmode

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

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

set formatoptions-=o "dont continue comments when pushing o/O

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
    \ set softtabstop=8 |
    \ set shiftwidth=8

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"disable mouse
set mouse=c

"show matching braces
set showmatch

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

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

map q: :q

nnoremap <leader><leader> @
nnoremap Q @@

nnoremap <leader>r gq}

nnoremap <leader>sv :source ~/.vim/vimrc<CR>

"make wrapped lines more intuitive
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> 0 g0
nnoremap <silent> $ g$

nnoremap <silent> B ge

nnoremap <C-p> :Files<CR>

map gb :Gblame<CR>
map gl :Commits<CR>

nnoremap <leader>j J

nnoremap J <C-e>
nnoremap K <C-y>

nnoremap L :bprevious<CR>
nnoremap H :bnext<CR>
map <C-x> :bdelete<CR>

" highlight last inserted text
noremap gV `[v`]

noremap <leader>h :nohlsearch<CR>

noremap <leader>p "+p
noremap <leader>d "+d
noremap <leader>y "+y

noremap <leader>S :%s//g<LEFT><LEFT>
noremap <leader>s :s//g<LEFT><LEFT>

noremap <leader>l @:
noremap <CR> o<Esc>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap ı i

noremap Y y$

inoremap jk <esc>

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
inoremap <C-d> <C-o>x

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Make DEL delete the selected text
vmap <BS> x

" navigation between splits map
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

cmap w!! w !sudo tee % >/dev/null

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" ABBREVIATIONS
iabbr cnslg console.log();jkhi<C-R>=Eatchar('\s')<CR>
iabbr ipdb import ipdb; ipdb.set_trace()<C-R>=Eatchar('\s')<CR>
iabbr srak self, request, *args, **kwargs<C-R>=Eatchar('\s')<CR>

let g:ale_python_flake8_options = "--max-line-length=120"
