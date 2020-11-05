setlocal colorcolumn=120
setlocal updatetime=100

let g:go_info_mode='guru'
let g:go_auto_type_info = 1

nnoremap <leader>i :setlocal autoread<CR> :!goimports -w %<CR><CR>
nnoremap <leader>f :setlocal autoread<CR> :!go fmt %<CR><CR>
