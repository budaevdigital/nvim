-- lua/plugins/treesitter.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitter_status, ts = pcall(require, "nvim-treesitter.configs")
if (not treesitter_status) then 
  vim.notify("nvim-treesitter.configs not found!")
  return 
end

ts.setup({
  -- Чтобы установить дополнительные языки, выполните:
  -- `:TSInstall <mylang>` 
  -- `:TSInstall Maintenance` - для установки всех описанных ЯП
  ensure_installed = {
    "lua",
    "rust",
    "javascript",
    "css",
    "dockerfile",
    "go",
    "python",
    "typescript",
    "bash",
    "html",
    "tsx",
    "json",
    "css",
    "toml",
    "yaml"
  },
  sync_installed = true,
  highlight = {
    enable = true, -- Включает работу подсветки плагина
    additional_vim_regex_highlighting = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
  },
  },
})
-- У некоторых пользователей Пакера, возникают ошибки при использовании сворачиваний (фолд)
-- они получают ошибку "No folds found"
-- Код снизу решает эту проблему
-- Подробнее о сворочивании (fold): :help foldmethod
vim.api.nvim_create_autocmd({"BufEnter","BufAdd","BufNew","BufNewFile","BufWinEnter"}, {
  group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
  callback = function()
    vim.opt.foldmethod = "syntax" -- expr | manual | indent | marker | syntax | diff
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end
})

