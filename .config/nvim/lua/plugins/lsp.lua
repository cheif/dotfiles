return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "nvim-telescope/telescope.nvim",
        },
        setup = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local telescope = require("telescope.builtin")
            vim.lsp.config.sourcekit.setup {
                capabilities = capabilities,
                filetypes = { "swift" },
            }
            vim.lsp.config.gopls.setup {
                capabilities = capabilities
            }
            vim.lsp.config.clangd.setup {
                capabilities = capabilities,

                -- Use clang from homebrew
                cmd = { '/opt/homebrew/opt/llvm/bin/clangd' }
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP Actions',
                callback = function(args)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<space>d', function()
                        telescope.diagnostics()
                    end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end,
    }
}
