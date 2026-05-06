vim.pack.add({ 
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})
require('nvim-treesitter').install({
    'swift', 
    'rust', 
    'toml', 
    'go', 
    'typescript', 
    'tsx', 
    'beancount',
    'lua',
    'vim',
    'vimdoc',
    'luadoc',
    'java'
})
