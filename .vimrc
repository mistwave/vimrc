""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author: Yifu Duan - @mistwave
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > Generals
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" number of lines of vim history
set history=999


" show line numbers
set number


" show line under your cursor
set cursorline


" load filetype-specific indent files
filetype indent on
filetype plugin on


" visual autocomplete for command
set wildmenu

" don't redraw while executing macros
set lazyredraw

" highlight matching {} [] () 
set showmatch


" allows cursor change in tmux mode (block mode or vertical bar mode)
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" use :W to sudo save the file
command! W execute 'w !sudo tee %> /dev/null' <bar> edit!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > searching
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight search result 
set hlsearch

" search as characters are entered
set incsearch

" enable magic regular expressions
set magic

" enable smart cases when searching
set smartcase

" turn off search result highlight
nnoremap <leader><space> :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > key mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader is `,`
let mapleader=","


" visually choosing last inserted text
nnoremap gV `[v`]


" jk is ESC
inoremap jk <esc>

" edit my .vimrc/.zshrc file
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" save session
nnoremap <leader>s :mksession<CR>

" fast saving
nmap <leader>w :w!<CR>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > Colors
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" try to use badwolf theme
try
	colorscheme badwolf
catch
endtry

" syntax highlight
syntax enable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > Spaces & Tabs
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" be smart using TAB
set smarttab

" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" inserting spaces when click TAB
set expandtab

" enable auto indent
set autoindent
set smartindent



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > folding
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" use space to open/close folds
nnoremap <space> za


set foldmethod=indent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > backups
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable backup
set backup
set writebackup


" dir for backup files
set backupdir=~/.vim-tmp,~/.tmp,~/var/tmp,/tmp
" no backup for this files
set backupskip=/tmp/*,/private/tmp/*
" dir for swap files
set directory=~/.vim-tmp,~/.tmp,~/var/tmp,/tmp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use minpac to manage
packadd minpac
call minpac#init()

" use minpac to update itself
call minpac#add('k-takata/minpac', {'type': 'opt'})

" shortcuts for paired command
call minpac#add('tpope/vim-unimpaired')

" helper for writing vimscript
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})



"command for update plugins

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


"file finder tool fzf
call minpac#add('junegunn/fzf')
nnoremap <C-p> :<C-u>FZF<CR>


"run make backgroundly
call minpac#add('tpope/vim-dispatch')



