set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on

"colors
set t_Co=256
set background=dark
highlight Normal ctermbg=black ctermfg=white
highlight LineNr ctermbg=black ctermfg=white
highlight CursorLineNr ctermbg=black ctermfg=yellow
highlight StatusLine ctermbg=black ctermfg=white
highlight Pmenu ctermbg=black ctermfg=yellow
highlight PmenuSel ctermbg=yellow ctermfg=black
highlight Visual ctermbg=yellow ctermfg=black
highlight ExtraWhitespace ctermbg=red ctermbg=red
highlight DiffAdd ctermbg=black ctermfg=green
highlight DiffChange ctermbg=black ctermfg=yellow
highlight DiffDelete ctermbg=black ctermfg=red
match ExtraWhitespace /\s\+$/
if version >= 700
  autocmd InsertEnter * highlight StatusLine ctermbg=black ctermfg=yellow
  autocmd InsertLeave * highlight StatusLine ctermbg=black ctermfg=white
endif

set colorcolumn=120
highlight ColorColumn ctermbg=grey

"allow backspacing over everything in insert mode
set backspace=eol,indent,start

"store lots of :cmdline history
set history=1000

"show incomplete cmds down the bottom
set showcmd
"show matching braces
set showmatch
set noshowmode

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
set tabstop=8
set expandtab

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

"turn on syntax highlighting
syntax on

"disable mouse
set mouse=c

"it's good for performance, but idk how
set lazyredraw

set noundofile
set noswapfile

set rtp+=~/.fzf

set autowrite

set laststatus=2
set statusline=[%n]\ 
set statusline+=%F\ 
set statusline+=%{fugitive#statusline()}
set statusline+=%y
set statusline+=\[%{mode()}\]
set statusline+=%m
set statusline+=%r
set statusline+=%=%v\ 
set statusline+=(%l/%L)

"load ftplugins and indent files
filetype plugin on
filetype indent on


au FileType python call PYTHON()
function! PYTHON()
    set makeprg=flake8\ --max-line-length=120\ %:S
    set errorformat=%f:%l:%c:\ %t%n\ %m
endfunc

au FileType json call JSON()
function! JSON()
    set syntax=off
endfunc

au FileType yaml call YAML()
function! YAML()
    set shiftwidth=2
    set softtabstop=2
endfunc

au FileType html call HTML()
function! HTML()
    set shiftwidth=2
    set softtabstop=2
endfunc

au FileType markdown call MD()
function! MD()
    set tw=79
endfunc

au FileType asciidoc call ADOC()
function! ADOC()
    set syntax=asciidoc
    set tw=79
    set formatoptions=tcqn
endfunc

au FileType go call GO()
function! GO()
    set noexpandtab
endfunc

au FileType php call PHP()
function! PHP()
    set noexpandtab
    set softtabstop=4
    set shiftwidth=4
endfunc

"MAPPINGS
" :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
" :nmap  :nnoremap :nunmap    Normal
" :vmap  :vnoremap :vunmap    Visual and Select
" :smap  :snoremap :sunmap    Select
" :xmap  :xnoremap :xunmap    Visual
" :omap  :onoremap :ounmap    Operator-pending
" :map!  :noremap! :unmap!    Insert and Command-line
" :imap  :inoremap :iunmap    Insert
" :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
" :cmap  :cnoremap :cunmap    Command-line

let mapleader="\<Space>"
let maplocalleader=","

noremap q: :q
noremap gb :Gblame<CR>
noremap gl :Commits<CR>
noremap gd :Gdiff<CR>
noremap <C-x> :bdelete<CR>
noremap <leader>h :nohlsearch<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap ı i
noremap Y y$
noremap <leader>c :copen<CR>

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
nnoremap <CR> o<Esc>

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
