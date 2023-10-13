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

"Plugins
call plug#begin()

Plug 'gmarik/Vundle.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kingbin/vim-arduino'
Plug 'sirtaj/vim-openscad'
Plug 'fatih/vim-go'
Plug 'klen/python-mode'
Plug 'jgdavey/tslime.vim'
Plug 'honza/dockerfile.vim'
Plug 'janko-m/vim-test'
Plug 'plasticboy/vim-markdown'
Plug 'wlangstroth/vim-racket'
Plug 'altercation/vim-colors-solarized'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'strogonoff/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'udalov/kotlin-vim'
Plug 'keith/swift.vim'
Plug 'elmcast/elm-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate' }
Plug 'kristijanhusak/orgmode.nvim', {'branch': 'master'}
Plug 'vim-syntastic/syntastic'

"LSP-support
Plug 'neovim/nvim-lspconfig'
"Autocomplete-support for LSP
Plug 'mfussenegger/nvim-lsp-compl'

call plug#end()

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = 'python3'

filetype plugin indent on
syntax enable
set background=light
colorscheme solarized

"Python
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_run_bind = '<leader>e'
let g:pymode_python = 'python3'
au! FileType python setl nosmartindent

"LaTeX
autocmd FileType tex map <buffer> <S-e> :w<CR>:!pdflatex %<CR>
autocmd FileType tex set spell
let g:tex_flavor='latex'

"Javascript/JQuery/Coffeescript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set softtabstop=2
autocmd FileType javascript set tabstop=2
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

"Typescript
let g:deoplete#enable_at_startup = 1
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescript set softtabstop=2
autocmd FileType typescript set tabstop=2
autocmd FileType typescript nmap gd :TSDef<CR>
autocmd FileType typescriptreact set shiftwidth=2
autocmd FileType typescriptreact set softtabstop=2
autocmd FileType typescriptreact set tabstop=2
autocmd FileType typescriptreact nmap gd :TSDef<CR>

"Org mode
lua << EOF
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}


require('orgmode').setup({
  org_agenda_files = {'~/repos/org/*'},
  org_default_notes_file = '~/repos/org/M.org',
})
EOF

" LSP
lua << EOF
local lspconfig = require('lspconfig')
local on_attach = require('lsp_compl').attach

lspconfig.rust_analyzer.setup{
    on_attach = on_attach
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

EOF

"Automatically reload files
set autoread
au CursorHold,CursorHoldI * checktime
