vim.g.mapleader = " "       -- Set <Leader> to <Space>
vim.g.maplocalleader = " "  -- Optional: Also set <LocalLeader> to <Space>

require("config.lazy")
require("config.options")

-- Set the default colorscheme
vim.cmd.colorscheme "tokyonight-night"

-- source the file.
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- executes the current line.
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- executes the selected lines
vim.keymap.set("v", "<space>x", ":lua<CR>")
