-- Leader key setup
vim.g.mapleader = "\\"

-- File Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
  desc = "[P]roject [V]iew (File Explorer)"
})

-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>", {
  desc = "Open [T]erminal"
})

-- Move Lines (Visual Mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move line down"
})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
  desc = "Move line up"
})

-- System Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {
  desc = "[Y]ank to system clipboard"
})
vim.keymap.set("n", "<leader>Y", [["+Y]], {
  desc = "[Y]ank line to system clipboard"
})

-- Delete to Void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {
  desc = "[D]elete to void (no yank)"
})

-- Find and Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "[S]ubstitute word under cursor"
})

-- Fun Effects
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", {
  desc = "[M]ake it [R]ain (fun effect)"
})

-- Reload Config
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, {
  desc = "Reload Neovim config"
})

-- Execute Lua
vim.keymap.set("n", "<leader>x", ":.lua<CR>", {
  desc = "E[x]ecute current line as Lua"
})
vim.keymap.set("v", "<leader>x", ":lua<CR>", {
  desc = "E[x]ecute selection as Lua"
})

-- Diagnostics
vim.keymap.set({ "n", "i", "v" }, "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {
  desc = "Show diagnostic [E]rrors"
})

-- Select All
vim.keymap.set("n", "<leader>a", "ggVG", {
  desc = "[A]ll (Select entire buffer)"
})

-- New Tab
vim.keymap.set("n", "<C-t>", "<Cmd>tabnew<CR>", {
  desc = "New [T]ab"
})

-- Window split
vim.keymap.set('n', '<leader>sh', ':split<CR>', { 
  desc = "[H]orizontal split window"
})
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { 
  desc = "[V]ertical split window"
})

-- LSP Mappings

-- Go to Definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "[G]oto [D]efinition"
})

-- Go to Declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
  desc = "[G]oto [D]eclaration"
})

-- Go to Implementation
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
  desc = "[G]oto [I]mplementation"
})

-- Go to References
vim.keymap.set("n", "gr", vim.lsp.buf.references, {
  desc = "[G]oto [R]eferences"
})

-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
  desc = "[R]e[n]ame symbol"
})

-- Hover Documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover, {
  desc = "Hover Documentation"
})

-- Code Action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "[C]ode [A]ction"
})

-- Open Diagnostics Float
vim.keymap.set("n", "gl", vim.diagnostic.open_float, {
  desc = "[G]lobal Diagnostic Float"
})

-- Next Diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
  desc = "Next [D]iagnostic"
})

-- Previous Diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
  desc = "Previous [D]iagnostic"
})

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {
  desc = "[F]ormat buffer (LSP)"
})

