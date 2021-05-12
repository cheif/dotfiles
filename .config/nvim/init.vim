"General
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
set laststatus=2
filetype off

"Fix backspace
set bs=2

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kingbin/vim-arduino'
Plugin 'sirtaj/vim-openscad'
Plugin 'fatih/vim-go'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'cheif/tslime.vim'
Plugin 'honza/dockerfile.vim'
Plugin 'janko-m/vim-test'
Plugin 'plasticboy/vim-markdown'
Plugin 'wlangstroth/vim-racket'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'strogonoff/vim-coffee-script'
Plugin 'benekastah/neomake'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'udalov/kotlin-vim'
Plugin 'keith/swift.vim'
Plugin 'elmcast/elm-vim'

call vundle#end()

filetype plugin indent on
syntax enable
set background=light
colorscheme solarized

"YouCompleteMe
let g:ycm_filetypes_to_completely_ignore = {
            \ 'notes': 1,
            \ 'markdown': 1,
            \ 'text': 1,
            \ 'tex': 1,
            \}
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
map gd :YcmCompleter GoToDefinitionElseDeclaration<cr>

"Python
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_run_bind = '<leader>e'
au! FileType python setl nosmartindent

"Javascript/json
autocmd BufReadPost *.json %!python -m json.tool

"LaTeX
autocmd FileType tex map <buffer> <S-e> :w<CR>:!pdflatex %<CR>
autocmd FileType tex set spell
let g:tex_flavor='latex'

"Javascript/JQuery/Coffeescript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set softtabstop=2
autocmd FileType javascript set tabstop=2
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescript set softtabstop=2
autocmd FileType typescript set tabstop=2
au BufRead,BufNewFile *.coffee set ft=coffee
autocmd FileType coffee set shiftwidth=2
autocmd FileType coffee set softtabstop=2
autocmd FileType coffee set tabstop=2
autocmd BufWritePre * %s/\s\+$//e

"Racket
au BufReadPost *.rkt,*.rktl set filetype=racket
au FileType racket set lisp
au FileType racket set autoindent

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

"Leader
let mapleader=" "

"Neomake
autocmd! BufWritePost * Neomake

"Tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

nmap <silent> <leader>r :call Send_keys_to_Tmux("Up Enter")<CR>

"Testing
let g:test#strategy = 'tslime'
let g:test#python#runner = 'pytest'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

"pytest-runner
" nmap <silent> <leader>t :RunCurrentTest<CR>

"XVim: https://github.com/XVimProject/XVim/blob/master/Documents/Developers/MenuActionList.txt
nmap gd <c-]>
nmap gb :xccmd goBackInHistoryByCommand<CR>
nmap gf :xccmd goForwardInHistoryByCommand<CR>
set tags=tags

set nofoldenable
