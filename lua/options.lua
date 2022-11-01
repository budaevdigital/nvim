-- lua/options.lua

vim.opt.spelllang= { 'en_us', 'ru' }
vim.opt.backup = false
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
-- vim.opt.smarttab = true
vim.opt.expandtab = true      -- Используйте соответствующее количество пробелов (не очень хорошо для PHP, но мы можем исправить это в ft (vim.fn.))
vim.opt.wrap = false
vim.opt.swapfile = false      -- Отключение резервного копирования
vim.opt.mouse = "i"             -- Включение мышки в insert mode
vim.opt.showmatch  = true     -- Выделяет пару закрывающей скобки (для наглядности)
vim.opt.hidden = true         -- Разрешить множественные буферы (это окна, в простом понимании)
vim.opt.completeopt = { "menu" , "menuone" , "noselect", "noinsert" } -- Пользователь может выбрать автозаполнение или печатать сам
vim.opt.updatetime = 750      -- Зарезервированное время на обновление
vim.opt.shortmess:append("c") -- Не передает сообщения в |ins-completion-menu|
vim.opt.encoding = "utf-8"    -- Дополнительная кодировка
vim.opt.showmode = false      -- Убирает сообщение -- INSERT -- внизу
vim.opt.showcmd = true        -- Показывает ввод команды
vim.opt.cmdheight = 1         -- Для лучшей читаемости команд
vim.opt.laststatus = 2

vim.opt.inccommand = "split"  -- Позволяет сразу видеть что меняется на что
vim.opt.ai = true             -- Auto indent
vim.opt.si = true             -- Smart Indent
