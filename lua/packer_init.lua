-- lua/plugins.lua

-- Место, куда packer плагин будет сохранен
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Установка плагина packer, если его ещё нет
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Автокоманда, которая перезагружает neovim всякий раз, когда вы сохраняете файл plugins.lua.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Используйте защищенный вызов require (pcall), чтобы мы не ошиблись при первом использовании
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Показывать сообщения упаковщика во всплывающем окне. Выглядит круче
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Альтернативная установка упаковщика без функции
packer.reset()
local use = packer.use

-- Install your plugins here
return packer.startup(function(use)
  --[[
  =================================
    Место для добавления плагинов
  =================================
  --]]

  -- Не забыть добавить самого менеджера плагинов packer
  use ("wbthomason/packer.nvim")

  -- [[ Всё, касаемо UI ]] --
  use ({ "nvim-tree/nvim-web-devicons",
    run = function()
      require("nvim-web-devicons").setup({ default = true, override = {} })
    end,
  })

  use ("tjdevries/colorbuddy.nvim") -- Для переопределения цветов

  -- Color schemes
  use ({ "svrana/neosolarized.nvim",
    require = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("core.colors") -- Вызывает файл с дополнительными настройками из директории config
    end,
  })

  use ({ "onsails/lspkind-nvim",  -- Пиктограммы как в VSCode
    config = function()
      require("lsp.lspkind")
    end,
  })
  -- Полоска статусов
  use ({ "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("plugins.lualine")
    end,
  })

  -- Найстройка отображения табов буферов (окон)
  use ({ "akinsho/bufferline.nvim",
    tag = "v3.*", 
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.bufferline")
    end,
  })

  -- Правильное закрытие буферов
  use ({ "famiu/bufdelete.nvim" })

  -- Подстветка пробелов и отступов
  use ({ "lukas-reineke/indent-blankline.nvim",
    run = function()
        vim.opt.list = true
        vim.opt.listchars:append("eol:↴")
        require("indent_blankline").setup {
            show_end_of_line = true,}
    end,
  })

  -- Оповещения
  use ("rcarriga/nvim-notify")

  -- Раскрашивает HEX-код в его цвет (прямо в коде)
  use ({ "norcalli/nvim-colorizer.lua",
    config = function()
        require("plugins.colorizer")
    end, 
  })


  -- Удобное дерево файлов

  use ({ "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      { "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        config = function()
          require"window-picker".setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = function ()
      require("plugins.neo_tree")
    end,
  })

  -- [[ Всё, касаёмо ЯП и написанию кода ]] --

  -- Трекер времени программиста. Ввод своего Api командой (:WakaTimeApiKey)
  use ("wakatime/vim-wakatime")

  -- Настройка LSP для ЯП
  use ({ "neovim/nvim-lspconfig",
    config = function()
      require("lsp.lspconfig")
    end,
  })

  -- Пояснение к Ошибкам и Дополнениям
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")
        saga.init_lsp_saga({
          -- server_filetype_map = {
            -- Указать сервера LSP если не используется nvim-lsp-config
          -- }
        })
    end,
  })

  -- Автодополнение
  use ({
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("lsp.nvim-cmp")
    end,
  })

  -- Автозакрытие тегов
  use ({ "windwp/nvim-ts-autotag",
    config = function()
      require("plugins.auto_tag_pair")
    end, })

  -- Автозакрытие скобок
  use ({ "windwp/nvim-autopairs",
    config = function()
      require("plugins.auto_tag_pair")
    end, })

  -- Подсветка синтаксиса и другие функции
  use ({ "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter")
    end,
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end, })

  -- Удобные поисковик (файлов, тексты и т.д.)
  use ({ "nvim-telescope/telescope.nvim",
    requires = { 
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep", -- Нужно установить ripgrep в саму систему (sudo dnf install ripgrep)
    },
    config = function()
      require("plugins.telescope")
    end, })
  use ({ "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("plugins.telescope")
    end, })

  -- Удобный инсталятор LSP, DAP, линтеров и форматеров для ЯП
  use ({ "williamboman/mason.nvim",
    config = function()
      require("plugins.mason")
    end,
  })

  use ({ "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugins.mason")
    end,
  })

  -- Автоматически настроить конфигурацию после клонирования packer.nvim
  -- Поместите это в конце после всех плагинов
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
