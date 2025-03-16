vim.g.mapleader = "\\"

-- open the file  explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- open terminal
vim.keymap.set("n", "<leader>t", "<cmd>:terminal<CR>")
vim.keymap.set("n", "<leader>r", "20<C-w>_")

-- Move selected blocks up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- this is theprimeagen idea, dont judge
-- leaves insert mode on ctrl+c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Dont use capital Q
vim.keymap.set("n", "Q", "<nop>")

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make it rain!
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- :so :so :so
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- show error messages in a nice float window
vim.keymap.set({ "n", "i", "v" }, "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- add empty line after the cursor line
vim.keymap.set("n", "<CR>", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>j")

-- select all
vim.keymap.set("n", "<leader>a", "ggVG")
