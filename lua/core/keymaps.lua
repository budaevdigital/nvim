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
vim.cmd([[set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]])

-- Сохранение \ Выход и т.д.
map("n", "<Leader>w", ":w<Cr>", opts)
map("n", "<Leader>q", ":q!<Cr>", opts) -- Обратить все изменения и выйти из NVim


-- Выделяет все совпадающие слова (под курсором) в тексте
map("n", "*", "*<C-o>", opts)

-- Показывает поисковые совпадения (следующее или предыдущее выделения)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Удалить поисковые выделения с Ctrl+l 
map("n", "<C-l>", ":noh<Cr>", opts)

-- Числовой инкремент \ декремент
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- Переключить NetRW (Lexplore)
map("n", "<Leader>le", ":Lex 30<Cr>", opts)

-- Повторно выбрать визуальный блок после отступа/выступа
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Копировать/вырезать в системный буфер обмена
cmd "vnoremap <Leader>y '+y"
cmd "nnoremap <Leader>p '+p"

-- Двойной ESC или <C-s> для перехода в normal режим в терминале
map("t", "<C-s>", "<C-\\><C-n>", opts)
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Новый таб
map("n", "te", ":tabedit<Return>", opts) -- Новая пустая вкладка
-- Разделение окна
map("n", "ss", ":split<Return><C-w>w", opts)  
map("n", "sv", ":vsplit<Return><C-w>w", opts)
-- Выбор активного активного окна
map("", "s<left>", "<C-w>h", opts)
map("", "s<rignt>", "<C-w>l", opts)
map("", "s<up>", "<C-w>k", opts)
map("", "s<down>", "<C-w>j", opts)
map("", "sh", "<C-w>h", opts)
map("", "sl", "<C-w>l", opts)
map("", "sj", "<C-w>k", opts)
map("", "sk", "<C-w>j", opts)

-- Изменить размер окна с помощью (Ctrl + w) + Arrows
map("n", "<C-w><up>", ":resize +2<CR>", opts)
map("n", "<C-w><down>", ":resize -2<CR>", opts)
map("n", "<C-w><left>", ":vertical resize -2<CR>", opts)
map("n", "<C-w><right>", ":vertical resize +2<CR>", opts)

-- Перемещайте строку вверх и вниз с помощью J/K
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Измените j и k, когда строка переносится. Перейти к следующей VISUAL строке
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr)

-- vim: ts=2 sw=2 et
