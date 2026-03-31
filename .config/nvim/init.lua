vim.pack.add({ 'https://github.com/maxmx03/solarized.nvim' })
require('solarized').setup()
vim.o.termguicolors = true
vim.o.background = 'light'
vim.cmd.colorscheme 'solarized'
vim.schedule(function()
	require("config.lazy")
end)
