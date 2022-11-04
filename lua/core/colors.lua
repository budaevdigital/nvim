-- lua/config/neosolarized.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/svrana/neosolarized.nvim
-- https://github.com/tjdevries/colorbuddy.nvim

local status_ok, neosol = pcall(require, "neosolarized")
if (not status_ok) then
  vim.notify("neosolarized not found!")
  return
end

neosol.setup({ comment_italics = true, })

local status_ok, cb = pcall(require, "colorbuddy.init")
if (not status_ok) then
  vim.notify("colorbuddy.init not found!")
  return
end

local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles


-- Создадим цвета
Color.new("todocolor", "#9BE24A")  -- Ярко-ядовитый для TODO
Color.new("foractiveline", "#464646") -- Для подсветки номера действующей строки
Color.new("background", "#9BE24A") -- Цвет фона (переопределен, для использования) #38214C #2E3440

-- Шаблон и параметры наименований Coloring(group, guibg, guifg, gui, ctermbg, ctermfg)
Group.new("TODO", colors.todocolor, colors.none, styles.bold) -- Делает TO`DO более выразительным в тексте
Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1) -- Выделение строки
Group.new("CursorLineNr", colors.yellow, colors.foractiveline, styles.NONE, colors.base1) -- Выделение номера строки
Group.new("Visual", colors.none, colors.base03, styles.reverse)
-- Group.new("LineNr", colors.coloradded, colors.none, styles.NONE) -- Номера строк

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

-- Цвета "Текста рядом" с ошибкой
-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)

-- Цвета подчеркивания ошибок
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)


local ColorScheme = {}

ColorScheme.night_dark = {
    bg = "#2E3440",
    fg = "#292929",
    pink = "#B48EAD",
    green = "#6BAC6E",
    cyan = "#8FBCBB",
    yellow = "#EBCB8B",
    orange = "#D08770",
    red = "#BF616A",
}

ColorScheme.onedark = {
  bg = "#282C34",
  fg = "#B2BBCC",
  pink = "#C678DD",
  green = "#98C379",
  cyan = "#56B6C2",
  yellow = "#E5C07B",
  orange = "#D19A66",
  red = "#E86671",
}

ColorScheme.monokai = {
  bg = "#202328", --default: #272a30
  fg = "#F8F8F0",
  pink = "#F92672",
  green = "#A6E22E",
  cyan = "#66D9EF",
  yellow = "#E6DB74",
  orange = "#FD971F",
  red = "#E95678",
}

ColorScheme.rose_pine = {
  bg = "#111019", --default: #191724
  fg = "#E0DEF4",
  pink = "#EB6F92",
  green = "#9CCFD8",
  cyan = "#31748F",
  yellow = "#F6C177",
  orange = "#2A2837",
  red = "#EBBCBA",
}

-- Цвета табов
ColorScheme.tab_color = {
  sep_fg = "#073642",
  sep_bg = "#002B36",
  sel_sep_fg = "#073642",
  sel_sep_bg = "#657B83",
  back_ui_fg = "#657B83",
  back_ui_bg = "#282C34", -- Фон неактивного таба
  buf_sel_fg = "#FDF6E3",
  buf_sel_bg = "#F8F8F0",
  buf_sel_font = "bold",
  fill_bg = "#073642",
}

return ColorScheme
