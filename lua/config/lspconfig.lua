-- lua/config/lspconfig.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/neovim/nvim-lspconfig

local status_ok, nvim_lsp = pcall(require, "lspconfig")
if (not status_ok) then
    return
end