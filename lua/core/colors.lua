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

-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
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
  bg = "#282c34",
  fg = "#b2bbcc",
  pink = "#c678dd",
  green = "#98c379",
  cyan = "#56b6c2",
  yellow = "#e5c07b",
  orange = "#d19a66",
  red = "#e86671",
}

ColorScheme.monokai = {
  bg = "#202328", --default: #272a30
  fg = "#f8f8f0",
  pink = "#f92672",
  green = "#a6e22e",
  cyan = "#66d9ef",
  yellow = "#e6db74",
  orange = "#fd971f",
  red = "#e95678",
}

ColorScheme.rose_pine = {
  bg = "#111019", --default: #191724
  fg = "#e0def4",
  pink = "#eb6f92",
  green = "#9ccfd8",
  cyan = "#31748f",
  yellow = "#f6c177",
  orange = "#2a2837",
  red = "#ebbcba",
}

return ColorScheme
