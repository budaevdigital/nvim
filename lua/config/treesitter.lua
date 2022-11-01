-- lua/config/treesitter.lua

require("nvim-treesitter.configs").setup({
    -- Чтобы установить дополнительные языки, выполните:
    -- `:TSInstall <mylang>`. `:TSInstall Maintenance`
    --- для установки всех описанных ЯП
    ensure_installed = "maintained",
    sync_installed = true,
    highlight = {
     enable = true, -- Включает работу плагина
     additional_vim_regex_highlighting = {
      "lua", "rust", "javascript",
      "css", "dockerafile", "go",
      "python", "typescript", "bash",
      "html"
    },
    },
    indent = {
     enable = false,
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

   -- Включить сворачивание (fold) в редакторе кода (zc and zo) для функций и классов. Но не по-умолчанию
   vim.cmd([[
     set nofoldenable
     set foldmethod=expr
     set foldexpr=nvim_treesitter#foldexpr()
   ]])