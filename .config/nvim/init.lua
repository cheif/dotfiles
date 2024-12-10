vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

require("config.lazy")
