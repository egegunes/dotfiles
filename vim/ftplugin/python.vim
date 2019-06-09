setlocal makeprg=flake8\ %:S
setlocal errorformat=%f:%l:%c:\ %t%n\ %m

nnoremap <F9> :term ipython3 -i %<CR>
nnoremap <leader>s :term ipython3<CR>
