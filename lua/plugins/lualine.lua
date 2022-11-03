-- lua/config/lualine.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/nvim-lualine/lualine.nvim

-- Иконки можно подобрать тут:
-- https://www.nerdfonts.com/cheat-sheet

local status_ok, lualine = pcall(require, "lualine")
if (not status_ok) then
  vim.notify("lualine not found!")
  return
end

-- Set colorscheme (from core/colors.lua/colorscheme_name)
local colors = require("core.colors").onedark

lualine.setup {
    options = {
      icons_enabled = true,
      theme = "onedark", -- solarized_dark | onedark
      component_separators = { left = "", right = ""},
      section_separators = { left = "", right = ""},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {
        {"branch", icon = {"", align="left", color={fg=colors.pink}}},
        {
          "diff",
          colored = true, -- Отображает статус цветной разницы, если установлено значение true
          diff_color = {
            -- Здесь можно использовать те же значения цвета, что и в опции "Общий цвет".
            added = { fg = colors.green },    -- Изменить цветовые группы можно в настройках своей темы
            modified = { fg = colors.orange },
            removed  = { fg = colors.red },
          },
          symbols = { added = " ", modified = " ", removed = " " },
          source = { added = add_count, modified = modified_count, removed = removed_count },
        },
      },
      lualine_c = {
        {
          "diagnostics",
          -- Таблица диагностических источников, доступными источниками являются:
          --   "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic", "coc", "ale", "vim_lsp".
          sources = { "nvim_diagnostic", "coc" },
          -- Отображает диагностику для определенных типов серьезности
          sections = { "error", "warn", "info", "hint" },
          diagnostics_color = {
            -- Задаём группы для цветов
            error = { fg = colors.red },
            warn  = { fg = colors.yellow },
            info  = { fg = colors.aqua }, 
            hint  = { fg = colors.violet }, 
          },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          colored = true,           -- Отображает состояние диагностики в цвете, если установлено значение true
          update_in_insert = false, -- Обновите диагностику в режиме вставки (INSERT)
          always_visible = false,   -- Показывать диагностику, даже если ее нет
        },
      },
      lualine_x = { 
          { 
            "filetype",
            colored = true,   -- Отображает значок типа файла в цвете, если установлено значение true
            icon_only = true, -- Отображать только значок для типа файла
            icon = { align = "left" },
            separator = { left = '', right = ''},
          },
          {
            "filename",
            file_status = true, -- Отображает статус файла (статус только для чтения, статус изменения)
            path = 0,            -- Без указания директорий файла (цифра - глубина вложенности)
            shorting_target = 40,
            symbols = {
              modified = '',      -- Text to show when the file is modified.
              readonly = '',      -- Text to show when the file is non-modifiable or readonly.
              unnamed = '﬒', -- Text to show for unnamed buffers.
              newfile = '',     -- Text to show for new created file before first writting
            },
          },
          "encoding",
      },
      lualine_y = {"progress"},
      lualine_z = {"location"}
    },
    inactive_sections = {
      lualine_a = {},   
      lualine_b = {},
      lualine_c = {{
        "filename",
        file_status = true,
        path = 1        -- На неактивных окнах будет показываться директория файлов
      }},
      lualine_x = {"location"},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "fugitive" }
  }