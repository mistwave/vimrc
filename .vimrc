packadd minpac
call minpac#init()

call minpac#add('tpope/vim-unimpaired')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})



"command for update plugins

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


"file finder tool fzf
call minpac#add('junegunn/fzf')
nnoremap <C-p> :<C-u>FZF<CR>

