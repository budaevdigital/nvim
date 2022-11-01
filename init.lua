-- init.lua

require("options")
require("highlights")
require("keymaps")
require("plugins")

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
    require("config.windows")
elseif is_unix or is_macos then
    require("config.unix")
end
