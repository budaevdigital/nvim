-- lua/lsp/lspconfig.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/neovim/nvim-lspconfig

-- Конфигурации ЯП для подключения:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md


local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
  vim.notify("lspconfig not found!")
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
  vim.notify("cmp_nvim_lsp not found!")
  return
end

-- Подробнее смотрите по команде (:help vim.diagnostic.config)
vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = "●", -- Может быть "■", "▎", "x"
  },
  update_in_insert = true,
  severity_sort = true,
  float = {
    -- focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    -- prefix = "",
	},
})



-- Show line diagnostics automatically in hover window
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

-- Add additional capabilities supported by nvim-cmp
-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local on_attach = require("core.keymaps").onattach

--[[
Language servers setup:
For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
Language server installed:
Bash          -> bashls
Python        -> pyright
C-C++         -> clangd
HTML/CSS/JSON -> vscode-html-languageserver
JavaScript/TypeScript -> tsserver
Lua           -> sumneko_lua
--]]

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches.
-- Add your language server below:
local servers = { "bashls", "pyright", "clangd", "html", "cssls", "tsserver" }

-- Call setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    flags = {
      -- default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Information = "",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
