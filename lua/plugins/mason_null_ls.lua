-- lua/plugins/mason_null_ls.lua

-- Подробности по настройке тут:
-- https://github.com/jayp0521/mason-null-ls.nvim


local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if (not mason_null_ls_status) then
    vim.notify("mason_null_ls not found")
    return 
end

mason_null_ls.setup({
    automatic_setup = true,
})
