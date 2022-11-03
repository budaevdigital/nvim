-- lua/config/lspconfig.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/neovim/nvim-lspconfig

-- Конфигурации ЯП для подключения:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local status_ok, nvim_lsp = pcall(require, "lspconfig")
if (not status_ok) then
    return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- -- TypeScript
-- nvim_lsp.tsserver.setup {
--     on_attach = on_attach,
--     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--     cmd = { "typescript-language-server", "--stdio" }
-- }

-- Python
nvim_lsp.pyright.setup{
    on_attach = on_attach,
    filetypes = { "python" },
    cmd = { "pyright-langserver", "--stdio" },
    -- root_dir,
    -- single_file_support = true,
    settings = { 
        python = {
            analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
            }
        }
    }
}

-- Lua
-- nvim_lsp.sumneko_lua.setup {
--     on_attach = on_attach,
--     filetypes = { "lua" },
--     cmd = { "lua-language-server" },
--     settings = {
--       Lua = {
--         runtime = {
--           version = 'LuaJIT',
--         },
--         diagnostics = {
--           globals = {'vim'},
--         },
--         workspace = {
--           library = vim.api.nvim_get_runtime_file("", true),
--         },
--         telemetry = {
--           enable = false,
--         },
--       },
--     },
--   }  