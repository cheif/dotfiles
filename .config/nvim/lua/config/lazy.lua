-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.foldenable = false

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = true
})

-- Make keymap
vim.keymap.set('n', '<leader>mm', '<cmd>make<CR>', opts)


-- Terminal settings
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],{noremap=true})

function get_first_terminal()
    terminal_chans = {}

    for _, chan in pairs(vim.api.nvim_list_chans()) do
        if chan["mode"] == "terminal" and chan["pty"] ~= "" then
            table.insert(terminal_chans, chan)
        end
    end

    table.sort(terminal_chans, function(left, right)
        return left["buffer"] < right["buffer"]
    end)

    local first = next(terminal_chans)
    if first == nil then
        return nil
    else
        return terminal_chans[1]["id"]
    end
end

vim.keymap.set('n', '<space>r', function()
    terminal_channel = get_first_terminal()
    -- If we don't have a terminal open, open one and wait for command
    if not terminal_channel then
        vim.cmd.vnew()
        vim.cmd.term()
        vim.cmd.wincmd("L")
        vim.cmd.startinsert()
        terminal_channel = vim.bo.channel
    else
        -- Terminal is already open
        -- Send Ctrl-C first
        local keys = vim.api.nvim_replace_termcodes('<C-c>', true, true, true)
        vim.fn.chansend(terminal_channel, keys)

        -- re-run last command
        local keys = vim.api.nvim_replace_termcodes('!!<CR><CR>', true, true, true)
        vim.fn.chansend(terminal_channel, keys)
    end
end)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
    checker = {
        enabled = true,
        frequency = 1200000, -- About every other week
    }
})
