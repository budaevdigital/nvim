-- lua/plugins/bufferline.lua

-- Подробности про настройку тут:
-- https://github.com/akinsho/bufferline.nvim

local bufferline_status, bufferline = pcall(require, "bufferline")
if (not bufferline_status) then 
    vim.notify("bufferline not found!")
    return 
end

local colors = require("core.colors").tab_color

bufferline.setup({
  options = {
    mode = tabs,
    numbers = "none",
    middle_mouse_command = nil,
    indicator_style = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = "nvim_lsp",     --| "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
        -- filter out filetypes you don't want to see
        if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            return true
        end
        -- filter out by buffer name
        if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            return true
        end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo
        if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            return true
        end
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick", -- { '', '' }, --"slant" | "thick" | "thin" | { '', '' }`
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id'
  },
  highlights = {
    separator = {
      fg = colors.sep_fg,
      --bg = colors.sep_bg,
    },
    separator_selected = {
      fg = colors.sel_sep_fg,
      --bg = colors.sel_sep_bg,
    },
    background = {
      fg = colors.back_ui_fg,
      --bg = colors.back_ui_bg,
    },
    buffer_selected = {
      fg = colors.buf_sel_fg,
      --bg = colors.buf_sel_bg,
      -- underline = true, undercurl = true, italic = true
      italic = true,
    },
    fill = {
      bg = colors.fill_bg,
    },
  },
})
