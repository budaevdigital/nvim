-- lua/keymaps.lua

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",

-- Закинем в переменные нужные аргументы и значение api_nvim, для сокращения
local set = vim.keymap.set
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }
local KeySettings = {}

-- Зададим "leader_key" - основную клавишу вызова команд(пробел)
map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Чтобы работали команды даже на русской раскладке
cmd([[set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]])

-- Сохранение \ Выход и т.д.
map("n", "<Leader>w", "<cmd>w<CR>", opts)
map("n", "<Leader>q", "<cmd>q<CR>", opts)
map("n", "<Leader>Q", "<cmd>q!<CR>", opts) -- Обратить все изменения и выйти из NVim

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

-- Повторно выбрать визуальный блок после отступа/выступа
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Копировать/вырезать в системный буфер обмена
cmd "vnoremap <Leader>y '+y"
cmd "nnoremap <Leader>p '+p"

-- Двойной ESC или <C-s> для перехода в normal режим в терминале
map("t", "<C-s>", "<C-\\><C-n>", opts)
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Новый таб (буфер)
map("n", "te", ":tabedit<Return>", opts) -- Новая пустая вкладка
-- Переключение между табами (буферами)
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
-- Закрыть таб (буфер)
map("n", "<Tab>C", "<Cmd>lua require('bufdelete').bufdelete(0, true)<CR>", opts)
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

-- Изменить размера окна с помощью (Ctrl + w) + Arrows
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

-- Показать / Скрыть дерево файлов
map("n", "<Leader>le", "<cmd>Neotree filesystem reveal left toggle<CR>", opts)

-- Команды для LSP Saga - пояснения к библиотекам и функциям
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)          -- Показать пояснение и переход к сл. ошибке
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)                         -- Показать подробную информацию LSP об объекте под курсором (Shift+k - фокус на этом окне)

map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

map('n', '<Leader>gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)               -- MUST! Показывает информацию об объекте и места, где он используется
map('n', '<Leader>gp', '<Cmd>Lspsaga peek_definition<CR>', opts)          -- MUST! Открывает окно (с возможностью редактирования) с местом объявления объекта
map('n', '<Leader>gr', '<Cmd>Lspsaga rename<CR>', opts)                   -- MUST! Переименовать данный объект(все его переменные под курсором), только в месте его объявления. 


-- [[ Команды для Telescope (поиск) ]] --
local builtin = require("telescope.builtin")
set("n", ";f", function()
    builtin.find_files({ no_ignore=false, hidden=true }) end, {}) -- аналогично записи :lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.5}})
set("n", ";r", builtin.live_grep, {}) -- аналогично записи ":lua require('telescope.builtin').live_grep({grep_open_files=true})", {}) 
set("n", "\\\\", builtin.buffers, {})
set("n", ";t", builtin.help_tags, {})
set("n", ";;", builtin.resume, {})
set("n", ";e", builtin.diagnostics, {})

local telescope = require("telescope")
telescope.load_extension("file_browser")

-- Парметры, которые отображаются в брайзере файлов (название файла \ размер \ дата создания)
local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end
-- Браузер файлов Telescope
set("n", ";bf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 20, width = 0.4 }
  })
end)


-- [[ Команды для LSP ]] --
-- Используйте функцию on_attach, чтобы отображать только следующие ключи
-- после того, как языковой сервер присоединится к текущему буферу
KeySettings.onattach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Выделение ссылок
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end

    -- Функция, для завершения режима вставки с помощью CTRL-X CTRL-O
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Введите (:help vim.lsp.*) для ознакомления с нужноой функцией
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<Leader>eeeeQ", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)  
end

-- Вызов окна Mason (установка LSP, DAP, Linters, Formatters)
KeySettings.mason_toggle_open = "<Leader><C-p>"
-- Остальные клавиши по-молчанию, работают в окне Mason:
-- i = Установка пакета; u = Обновление пакета; c = Проверка версии пакета;
-- U = Обновление всех пакетов; X = Удаление пакета; Ctrl+c = Отмета установки;
-- Ctrl+f = Настройка фильтра для поиска нужного пакета


return KeySettings


-- Альтернативные мапинги
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(
--     bufnr,
--     "n",
--     "<space>wl",
--     "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
--     opts
-- )
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

