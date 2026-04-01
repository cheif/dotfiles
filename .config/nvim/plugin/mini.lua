vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
require('mini.cmdline').setup()
require('mini.files').setup()
require('mini.notify').setup()
require('mini.diff').setup()
require('mini.git').setup()
require('mini.comment').setup()

-- Picker
require('mini.icons').setup({
    style = 'ascii'
})
require('mini.pick').setup()
MiniPick = require('mini.pick')
extra = require('mini.extra').pickers
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, {})
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, {})
vim.keymap.set('n', '<leader>fb', function()
    MiniPick.builtin.buffers(opts, {
        mappings = {
            close_buffer = {
                char = '<C-d>',
                func = function()
                    vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
                end
            }
        }
    })
end, {})

vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help, {})
vim.keymap.set('n', '<leader>fr', function()
    extra.lsp({ scope = "references" })
end, opts)
vim.keymap.set('n', '<space>d', function()
    extra.diagnostic()
end, opts)
