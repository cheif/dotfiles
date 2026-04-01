vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
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
