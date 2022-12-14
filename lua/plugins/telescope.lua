-- lua/plugins/telescope.lua

-- Подробности про настройку тут:
-- https://github.com/nvim-telescope/telescope.nvim-telescope
-- nvim-telescope/telescope-file-browser.nvim

local telescope_status, telescope = pcall(require, "telescope")
if (not telescope_status) then 
    vim.notify("telescope not found!")
    return 
  end

local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close
        },
      },
      layout_config = {
        vertical = { width = 0.5 }
      },
    },
    extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
          -- Команды в INSERT режиме
          ["i"] = {
            ["<C-w>"] = function() vim.cmd("normal vbd") end,
          },
          -- Команды в NORMAL режиме
          ["n"] = {
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd("startinsert")
            end
          },
        },
      },
    },
  }
