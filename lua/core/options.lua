-- lua/options.lua

-- С полным перечнем команд и их описанием можно ознакомиться тут:
-- https://github.com/vim/vim/blob/master/runtime/doc/options.txt

vim.opt.spelllang= { 'en_us', 'ru' }
vim.opt.backup = false
vim.opt.swapfile = false      -- Отключение резервного копирования
vim.opt.wrap = false
vim.opt.number = true         -- Показать номер строки слева
vim.opt.relativenumber = true -- Использование 10j или 5yk для передвижения курсора
vim.opt.hlsearch = true       -- Выделение результатов поиска
vim.opt.ignorecase = true     -- Игнорировать регистр в шаблонах поиска
vim.opt.smartcase = true      -- Поиск с учётом регистра
vim.opt.iminsert = 0          -- Чтобы при переходе в режим ВСТАВКА по-умолчанию был английский (клавиша i)
vim.opt.imsearch = 0          -- Чтобы при старте поиск был на английском, а не русском (команда /)
vim.opt.splitright = true     -- Новое split-окно (вертикальное) будет создаваться справа
vim.opt.splitbelow = true     -- Новое split-окно (горизонтальное), например `:help`, будет создаваться снизу
vim.opt.smarttab = true       -- При использовании Tab, вставляет пробелы
vim.opt.tabstop = 4           -- Tab размером 4 пробела
vim.opt.softtabstop = 4       -- При вставке будет использоваться 4 пробела вместо Tab
vim.opt.shiftwidth = 0        -- Количество пробелов, используемых для каждого шага (автоматического) отступа
vim.opt.expandtab = true      -- Используйте соответствующее количество пробелов (не очень хорошо для PHP, но мы можем исправить это в ft (vim.fn.))
vim.opt.mouse = "i"           -- Включение мышки в insert mode
vim.opt.showmatch  = true     -- Выделяет пару закрывающей скобки (для наглядности)
vim.opt.title = true
vim.opt.hidden = true         -- Разрешить множественные буферы (это окна, в простом понимании)
vim.opt.completeopt = { "menu" , "menuone" , "noselect", "noinsert" } -- Пользователь может выбрать автозаполнение или печатать сам
vim.opt.updatetime = 750      -- Зарезервированное время на обновление
vim.opt.shortmess:append("c") -- Не передает сообщения в |ins-completion-menu|
-- vim.opt.guifont = "monospace:h17"
vim.opt.encoding = "utf-8"    -- Дополнительная кодировка
vim.opt.showmode = false      -- Убирает сообщение -- INSERT -- внизу
vim.opt.showcmd = true        -- Показывает ввод команды
vim.opt.cmdheight = 1         -- Для лучшей читаемости команд (высота)
vim.opt.laststatus = 2        -- Показывать строку статуса всегда и во всех окнах (цифра 2)

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.inccommand = "split"  -- Позволяет сразу видеть что меняется на что (в дополнительном окне)
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true    -- "Умные" отступы
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append { "**" }  -- Find, Search (внутри под директорий)
vim.opt.wildignore:append { "*/node_modules/*", "*/venv/*" }  -- Исключая директории ...

-- UnderCurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Отключение режима вставки при выходе из Insert режима
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste"
})  

vim.opt.formatoptions:append { "r" }


-- highlights
-- vim.g.colors_name = "NeoSolarized" -- вместо cmd[[silent! colorscheme tokyonight]]
-- vim.o.background = "dark"     -- Темная тема для фона
vim.opt.termguicolors = true  -- Требуется для некоторых тем
vim.opt.signcolumn = "yes"    -- Всегда показывайте столбец signcolumn (там где цифры строк), в противном случае это приведет к смещению текста
vim.opt.cursorline = true     -- Выделяет текущую строку курсора (может замедлить работу пользовательского интерфейса)
