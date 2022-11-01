-- lua/keymaps.lua

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",

-- Закинем в переменные нужные аргументы и значение api_nvim, для сокращения
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

-- Зададим "leader_key" - основную клавишу вызова команд(пробел)
map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Чтобы работали команды даже на русской раскладке
cmd "set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Выделяет все совпадающие слова (под курсором) в тексте
map("n", "*", "*<C-o>", opts)

-- Показывает поисковые совпадения
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Переключить NetRW (Lexplore)
map("n", "<Leader>le", ":Lex 30<Cr>", opts)

-- Удалить поисковые выделения с Ctrl+l 
map("n", "<C-l>", ":noh<Cr>", opts)

-- Повторно выбрать визуальный блок после отступа/выступа
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- YY/XX Копировать/вырезать в системный буфер обмена
-- vim.cmd([[
-- noremap YY "+y<CR>
-- noremap XX "+x<CR>
-- ]])
cmd 'noremap <Leader>y "+y'
cmd 'noremap <Leader>p "+p'

-- Двойной ESC или <C-s> для перехода в normal режим в терминале
map("t", "<C-s>", "<C-\\><C-n>", opts)
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Изменить размер окна с помощью Shift+<arrow>
map("n", "<S-Up>", ":resize +2<CR>", opts)
map("n", "<S-Down>", ":resize -2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Перемещайте строку вверх и вниз с помощью J/K
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Измените j и k, когда строка переносится. Перейти к следующей VISUAL строке
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr)

-- vim: ts=2 sw=2 et