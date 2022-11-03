-- lua/config/lualine.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/nvim-lualine/lualine.nvim

-- Иконки можно подобрать тут:
-- https://www.nerdfonts.com/cheat-sheet

local status_ok, lualine = pcall(require, "lualine")
if (not status_ok) then
    return
end


lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'onedark', -- solarized_dark | onedark
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
        "branch",
        {
          "diff",
          colored = true, -- Отображает статус цветной разницы, если установлено значение true
          diff_color = {
            -- Здесь можно использовать те же значения цвета, что и в опции "Общий цвет".
            added = { fg = green },    -- Изменить цветовые группы можно в настройках своей темы
            modified = { fg = orange },
            removed  = { fg = red },
          },
          symbols = { added = ' ', modified = ' ', removed = ' ' },
          source = { added = add_count, modified = modified_count, removed = removed_count },
        },
      },
      lualine_c = {
        {
          'diagnostics',
          -- Таблица диагностических источников, доступными источниками являются:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          sources = { 'nvim_diagnostic', 'coc' },
          -- Отображает диагностику для определенных типов серьезности
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            -- Задаём группы для цветов
            error = { fg = red },
            warn  = { fg = yellow },
            info  = { fg = aqua }, 
            hint  = { fg = violet }, 
          },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          colored = true,           -- Отображает состояние диагностики в цвете, если установлено значение true
          update_in_insert = false, -- Обновите диагностику в режиме вставки  
          always_visible = false,   -- Показывать диагностику, даже если ее нет
        },
      },
      lualine_x = {
          { 
            "filetype",
            colored = true,   -- Отображает значок типа файла в цвете, если установлено значение true
            icon_only = true, -- Отображать только значок для типа файла
            icon = { align = "right" },
          },
          {
            "filename",
            file_status = true, -- Отображает статус файла (статус только для чтения, статус изменения)
            path = 0            -- Без указания директорий файла (цифра - глубина вложенности)
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