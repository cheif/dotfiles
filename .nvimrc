"General
syntax on
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set cursorline
set incsearch
set hlsearch
set directory=~/.vim/tmp
set backupdir=~/.vim/backup
set hidden
set statusline=%=%(%p%%%) 

"Fix backspace
set bs=2

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'kingbin/vim-arduino'
Plugin 'sirtaj/vim-openscad'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'

call vundle#end()

filetype plugin indent on

"YouCompleteMe
let g:ycm_filetypes_to_completely_ignore = {
    \ 'notes': 1,
    \ 'markdown': 1,
    \ 'text': 1,
    \ 'tex': 1,
    \}
let g:ycm_seed_identifiers_with_syntax = 0
map gd :YcmCompleter GoToDefinitionElseDeclaration<cr>

"Python
let g:pymode_rope_goto_definition_bind = 'gd'
let g:pymode_folding = 0


"LaTeX
autocmd FileType tex map <buffer> <S-e> :w<CR>:!pdflatex %<CR>
autocmd FileType tex set spell
let g:tex_flavor='latex'

"Javascript/JQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"Autoclose completion preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Mouse scroll
set mouse=a

"Crontab
au FileType crontab set nobackup nowritebackup

"Disable arrow-keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['java'] }
