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
-- packer.reset()
-- local use = packer.use

-- Install your plugins here
return packer.startup(function(use)
  --[[
  =================================
    Место для добавления плагинов
  =================================
  --]]

  -- Не забыть добавить самого менеджера плагинов packer
  use ("wbthomason/packer.nvim")

  -- use { 
  --   "williamboman/mason.nvim",
  --   config = function()
  --     require("config.mason.lua") -- Вызывает файл с дополнительными настройками из директории config
  --   end,
  -- }

  -- Всё, касаемо UI
  use ("nvim-tree/nvim-web-devicons")

  use ("tjdevries/colorbuddy.nvim") -- Для переопределения цветов

  use ({ "svrana/neosolarized.nvim",   -- Тема для NVim
    require = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("core.colors") -- Вызывает файл с дополнительными настройками из директории config
    end,
  })

  use ({ "nvim-lualine/lualine.nvim",  -- Полоска статусов
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("plugins.lualine") -- Вызывает файл с дополнительными настройками из директории config
    end,
  })

  -- use({ -- Порт темы Tokyo Night от VSCode
  --   "folke/tokyonight.nvim",
  --   require = { "tjdevries/colorbuddy.nvim" },
  --   config = function()
  --     vim.g.tokyonight_style = "night" -- Также возможны настройки: storm, night and day
  --   end,
  -- })

  -- Всё, касаёмо ЯП и написанию кода
  use ("wakatime/vim-wakatime") -- Трекер времени программиста. Ввод своего Api командой (:WakaTimeApiKey)

  use ({ "neovim/nvim-lspconfig",
    config = function()
      require("lsp.lspconfig") -- Вызывает файл с дополнительными настройками из директории config
    end,
  })

  use ({ "williamboman/mason.nvim",
    config = function()
      require("plugins.mason") -- Вызывает файл с дополнительными настройками из директории config
    end,
  })

  use ("williamboman/mason-lspconfig.nvim")

  -- use({ -- Устанавливает и настаивает плагин для ЯП (Tree-sitter)
  --  "nvim-treesitter/nvim-treesitter",
  --  run = ":TSUpdate",
  --  config = function()
  --   require("config.treesitter") -- Вызывает файл с дополнительными настройками из директории config
  --  end,
  -- })

  -- Автоматически настроить конфигурацию после клонирования packer.nvim
  -- Поместите это в конце после всех плагинов
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
-- vim: ts=2 sw=2 et