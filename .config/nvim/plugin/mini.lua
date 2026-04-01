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

-- LSP/completion
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable('sourcekit')
vim.lsp.config('sourcekit', {
    filetypes = { "swift" },
})
vim.lsp.enable('gopls')
vim.lsp.enable('clangd')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(args)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.format()
    end
})



local imap_expr = function(lhs, rhs)
    vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
require('mini.snippets').setup()
require('mini.completion').setup()


-- Java
vim.pack.add({
    {
        src = 'https://github.com/JavaHello/spring-boot.nvim',
        version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
    },
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/nvim-java/nvim-java'
})
require('java').setup({
    java_debug_adapter = {
        enable = false
    }
})
vim.lsp.enable('jdtls')
