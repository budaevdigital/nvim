-- lua/highlights.lua

vim.g.colors_name = "NeoSolarized" -- вместо cmd[[silent! colorscheme tokyonight]]
vim.o.background = "dark"     -- Темная тема для фона
vim.opt.termguicolors = true  -- Требуется для некоторых тем
vim.opt.signcolumn = "yes"    -- Всегда показывайте столбец signcolumn (там где цифры строк), в противном случае это приведет к смещению текста
vim.opt.cursorline = true     -- Выделяет текущую строку курсора (может замедлить работу пользовательского интерфейса)
