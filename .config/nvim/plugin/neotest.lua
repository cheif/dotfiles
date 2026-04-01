vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/antoinemadec/FixCursorHold.nvim",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/nvim-neotest/neotest",
    "https://github.com/fredrikaverpil/neotest-golang",
    "https://github.com/mmllr/neotest-swift-testing",
    "https://github.com/rcasia/neotest-java",
})

neotest = require("neotest")
neotest.setup({
    adapters = {
        require("neotest-golang")({
            runner = "gotestsum"
        }),
        require("neotest-swift-testing"),
        require("neotest-java"),
    },
    icons = {
        failed = "❌",
        passed = "✅",
        running = "⏳",
        skipped = "⏭️",
        unknown = "❓",
        watching = "👀"
    },
})
vim.keymap.set('n', '<leader>tc', function()
    neotest.run.run()
end, opts)
vim.keymap.set('n', '<leader>tf', function()
    neotest.run.run(vim.fn.expand('%'))
end, opts)
vim.keymap.set('n', '<leader>tt', function()
    neotest.output_panel.clear()
    neotest.run.run_last()
end, opts)
vim.keymap.set('n', '<leader>ts', neotest.summary.toggle, opts)
vim.keymap.set('n', '<leader>to', neotest.output_panel.toggle, opts)
