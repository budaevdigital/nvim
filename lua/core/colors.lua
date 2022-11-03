-- lua/config/neosolarized.lua

-- Доку по настройке, можно посмотреть тут:
-- https://github.com/svrana/neosolarized.nvim
-- https://github.com/tjdevries/colorbuddy.nvim

local status_ok, neosol = pcall(require, "neosolarized")
if (not status_ok) then
    return
end

neosol.setup({ comment_italics = true, })

local status_ok, cb = pcall(require, "colorbuddy.init")
if (not status_ok) then
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
Color.new("background", "#2E3440") -- Цвет текста #38214C

Color.new("nord_0", "#2E3440")   -- Серый
Color.new("nord_1","#3B4252")    -- Серый_2
Color.new("nord_2", "#434C5E")   -- Серый_3
Color.new("nord_3", "#4C566A")   -- Серый_4
Color.new("nord_3_light", "#616E88")  -- Светло-серый
Color.new("nord_4", "#D8DEE9")   -- Затемненно-белый
Color.new("nord_5", "#E5E9F0")   -- Белый
Color.new("nord_6", "#ECEFF4")   -- Ярко-белый
Color.new("nord_7", "#8FBCBB")   -- Светло-зеленный
Color.new("nord_8", "#88C0D0")   -- Светло-голубой
Color.new("nord_9", "#81A1C1")   -- Светло-синний
Color.new("nord_10", "#5E81AC")  -- Синий
Color.new("nord_11", "#BF616A")  -- Красный
Color.new("nord_12", "#D08770")  -- Оранжевый
Color.new("nord_13", "#EBCB8B")  -- Желтый
Color.new("nord_14", "#A3BE8C")  -- Оливковый
Color.new("nord_15", "#B48EAD")  -- Светло-малиновый

-- Переопределение существующих цветов
Color.new("bg", "#2E3440")       -- Цвет текста #38214C
Color.new("fg", "#292929")       -- Цвет текста
Color.new("white", "#FFFFFF")    -- #D8DEE9
Color.new("red", "#BF616A")
Color.new("green", "#6BAC6E")
Color.new("yellow", "#EBCB8B")
Color.new("blue", "#6CA7E2")     -- #81A1C1
Color.new("aqua", "#A3BE8C")
Color.new("cyan", "#8FBCBB")
Color.new("purple", "#B48EAD")
Color.new("violet", "#B48EAD")
Color.new("orange", "#D08770")
Color.new("gray", "#C7C4C5")


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

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)


local M = {}

M.night_dark = {
    bg = "#2E3440",
    fg = "#292929",
    pink = "#B48EAD",
    green = "#6BAC6E",
    cyan = "#8FBCBB",
    yellow = "#EBCB8B",
    orange = "#D08770",
    red = "#BF616A",
}

M.onedark_dark = {
  bg = "#282c34",
  fg = "#b2bbcc",
  pink = "#c678dd",
  green = "#98c379",
  cyan = "#56b6c2",
  yellow = "#e5c07b",
  orange = "#d19a66",
  red = "#e86671",
}

M.monokai = {
  bg = "#202328", --default: #272a30
  fg = "#f8f8f0",
  pink = "#f92672",
  green = "#a6e22e",
  cyan = "#66d9ef",
  yellow = "#e6db74",
  orange = "#fd971f",
  red = "#e95678",
}

M.rose_pine = {
  bg = "#111019", --default: #191724
  fg = "#e0def4",
  pink = "#eb6f92",
  green = "#9ccfd8",
  cyan = "#31748f",
  yellow = "#f6c177",
  orange = "#2a2837",
  red = "#ebbcba",
}

return M
