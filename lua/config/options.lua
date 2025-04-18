-- Cursor settings
vim.opt.guicursor = table.concat({
  -- Non-blinking block in Normal/Visual mode.
  "n-v-c:block",
  -- Blinking line in Insert mode.
  "i-ci-ve:ver25-blinkon100-blinkoff100-blinkwait100",
  -- Non-blinking block in Replace mode.
  "r-cr-o:hor20",
}, ",")

-- show absolute and relative line numbers.
vim.opt.nu = true
vim.opt.relativenumber = true 

-- tab/indentation
vim.opt.tabstop = 2        -- 1 tab = 2 spaces
vim.opt.softtabstop = 2    -- Tab key inserts 2 spaces
vim.opt.shiftwidth = 2     -- Auto-indent uses 2 spaces
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true  -- Auto-indent new lines

vim.opt.wrap = false  -- Disable line wrapping
vim.opt.swapfile = false  -- Disable swap files
vim.opt.backup = false    -- Disable backup files
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.incsearch = true  -- Enable incremental search
vim.opt.scrolloff = 8      -- Keep 8 lines above/below cursor
vim.opt.signcolumn = "yes" -- Always show sign column (for diagnostics)
vim.opt.isfname:append("@-@")  -- Allow `@` in filenames
vim.opt.updatetime = 50  -- Faster CursorHold events (default: 4000ms)
vim.opt.colorcolumn = "80" -- highlight the column

return {}
