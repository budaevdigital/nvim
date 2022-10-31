-- lua/options.lua

vim.o.background = 'dark'     -- Темная тема для фона
vim.opt.number = true         -- Показать номер строки слева
vim.opt.relativenumber = true -- Использование 10j или 5yk для передвижения курсора
vim.opt.hlsearch = true       -- Выделение результатов поиска
vim.opt.ignorecase = true     -- Поиск с учётом игнорированного случая
vim.opt.smartcase = true      -- Поиск с учётом регистра
vim.opt.splitright = true     -- Новое split-окно (вертикальное) будет создаваться справа
vim.opt.splitbelow = true     -- Новое split-окно (горизонтальное), например `:help`, будет создаваться снизу
vim.opt.tabstop = 4           -- Tab размерои 4 пробела
vim.opt.softtabstop = 4       -- При вставке будет использоваться 4 пробела вместо Tab
vim.opt.shiftwidth = 0        -- Количество пробелов, используемых для каждого шага (автоматического) отступа
vim.opt.expandtab = true      -- Используйте соответствующее количество пробелов (не очень хорошо для PHP, но мы можем исправить это в ft (vim.fn.))
vim.opt.wrap = false
vim.opt.swapfile = false      -- Отключение резервного копирования
vim.opt.mouse="i"             -- Включение мышки в insert mode
vim.opt.showmatch  = true     -- Выделяет пару закрывающей скобки (для наглядности)
vim.opt.termguicolors = true  -- Требуется для некоторых тем
vim.opt.cursorline = true     -- Выделяет текущую строку курсора (может замедлить работу пользовательского интерфейса)
vim.opt.signcolumn = "yes"    -- Всегда показывайте столбец signcolumn, в противном случае это приведет к смещению текста
vim.opt.hidden = true         -- Разрешить множественные буферы (это окна, в простом понимании)
vim.opt.completeopt = { "menu" , "menuone" , "noselect", "noinsert" } -- Пользователь может выбрать автозаполнение или печатать сам
vim.opt.showmode = false      -- Убирает сообщение -- INSERT -- внизу
vim.opt.updatetime = 750      -- Зарезервированное время на обновление
vim.opt.shortmess:append("c") -- Не передает сообщения в |ins-completion-menu|
vim.opt.encoding = "utf-8"    -- Дополнительная кодировка
vim.opt.cmdheight=2           -- Для лучшей читаемости команд
