-- lua/plugins/mason.lua

-- Подробности о настройке тут:
-- https://github.com/williamboman/mason.nvim


local mason_status_ok, mason = pcall(require, "mason")
if (not mason_status_ok) then
    vim.notify("mason not found!")
    return
end

local lspconfig_status_ok, mason_config = pcall(require, "mason-lspconfig")
if (not lspconfig_status_ok) then
    vim.notify("mason-lspconfig not found!")
    return
end

local user_keymaps = require("core.keymaps").mason_toggle_open

local SHORT_SETTINGS = {
    ui = { 
        -- Проверка обновлений пакетов при открытии Mason
        check_outdated_packages_on_open = true,
        border = "rounded",

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },

        keymaps = {
            toggle_package_expand = user_keymaps,
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    },
}

mason.setup(SHORT_SETTINGS)
mason_config.setup(SHORT_SETTINGS)
