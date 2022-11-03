-- lua/plugins/auto_tag_pair.lua

-- Подробнее про настройку:
-- https://github.com/windwp/nvim-autopairs
-- https://github.com/windwp/nvim-ts-autotag

local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
if (not autotag_status) then
    vim.notify("nvim-ts-autotag not found")
    return
end

autotag.setup()

local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if (not autopairs_status) then
    vim.notify("nvim-autopairs not found")
    return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
