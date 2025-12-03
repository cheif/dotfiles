return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "fredrikaverpil/neotest-golang",
            "mmllr/neotest-swift-testing",
        },
        config = function() 
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-golang")({
                        runner = "gotestsum"
                    }),
                    require("neotest-swift-testing"),
                }
            })
            vim.keymap.set('n', '<leader>tt', function()
                neotest.run.run()
            end, opts)
            vim.keymap.set('n', '<leader>tf', function()
                neotest.run.run(vim.fn.expand('%'))
            end, opts)
            vim.keymap.set('n', '<leader>ts', neotest.summary.toggle, opts)
        end
    }
}
