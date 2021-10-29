setlocal colorcolumn=120
setlocal updatetime=100

nnoremap <leader>f :setlocal autoread<CR> :!go fmt %<CR> :!goimports -w % <CR><CR>
