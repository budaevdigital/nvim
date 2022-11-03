-- init.lua

-- Ознакомиться со структурой директорий Lua файлов на примере:
-- https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files

require("packer_init")
require("core.options")
require("core.keymaps")
require("core.colors")
require("lsp.lspconfig")
require("lsp.lspkind")
require("lsp.nvim-cmp")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.bufferline")
require("plugins.lualine")

-- Функция, которая проверят систему и возвращает bool значение
-- Нужна для синхронизации янкирования и системного клипбоарда
-- Ввести :lua print(vim.loop.os_uname().sysname) для определения действующей системы
local system = function(x)
    return vim.fn.has(x) == 1
end

local is_unix = system "linux"
local is_windows = system "win32"
local is_macos = system "macunix"

if is_windows then
    require("core.config.windows")
elseif is_unix or is_macos then
    require("core.config.unix")
end

