-- lua/lsp/null_ls.lua

-- Подробности о настроке смотреть тут:
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls_status, null_ls = pcall(require, "null-ls")
if (not null_ls_status) then
    vim.notify("null-ls not found")
    return 
end

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>ff :vim.lsp.buf.format { async = true }<CR>")

      -- Форматирование при сохранении
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format { async = true }")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>ff :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

