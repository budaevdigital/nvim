-- init.lua

vim.opt.number = true
vim.o.background = 'dark'

require("options")
require("keymaps")
require("plugins")
vim.cmd[[silent! colorscheme tokyonight]]