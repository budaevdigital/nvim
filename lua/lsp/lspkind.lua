-- lua/lsp/lspkind.lua

-- Подробности про настройку тут:
-- https://github.com/onsails/lspkind.nvim

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if (not lspkind_status_ok) then
  vim.notify("lspkind not found!")
  return
end

lspkind.init({
    -- defines how annotations are shown
    -- "text", "text_symbol", "symbol_text", "symbol"
    mode = "symbol_text",

    -- default symbol map
    -- can be either "default" (requires nerd-fonts font) or
    -- "codicons" for codicon preset (requires vscode-codicons font)
    preset = "codicons",
    -- override preset symbols
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
