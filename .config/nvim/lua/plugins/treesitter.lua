return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            configs = require('nvim-treesitter.configs')
            configs.setup {
                highlight = { enable = false },
                indent = { enable = true },
                ensure_installed = {
                    'org', 'swift', 'rust', 'toml', 'go', 'typescript', 'tsx', 'beancount', 
                    'lua',
                    'vim',
                    'vimdoc',
                    'luadoc'
                },
                sync_install = false,
            }
        end,
    }
}
