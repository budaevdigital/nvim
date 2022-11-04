-- lua/plugins/colorizer.lua

-- Подробнее о настройке тут:
-- https://github.com/norcalli/nvim-colorizer.lua

local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if (not colorizer_status_ok) then
  vim.notify("colorizer not found!")
  return
end


colorizer.setup()
-- Можно исключить выделения в файлах указанного типа
-- { "*";
--  "!vim"; }
