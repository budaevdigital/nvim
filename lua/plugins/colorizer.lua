-- lua/plugins/colorizer.lua

-- Подробнее о настройке тут:


local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if (not colorizer_status_ok) then
  vim.notify("colorizer not found!")
  return
end

colorizer.setup() = {
    "*";
}
