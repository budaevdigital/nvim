-- lua/lsp/prettier.lua
--
-- Подробности о настройке смотреть тут:
-- https://github.com/MunifTanjim/prettier.nvim

local prettier_status, prettier = pcall(require, "prettier")
if (not prettier_status) then
    vim.notify("prettier_status not found")
    return 
end

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
