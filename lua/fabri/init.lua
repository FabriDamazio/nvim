require("fabri.set")
require("fabri.remap")
require("fabri.lazy_init")

local augroup = vim.api.nvim_create_augroup
local FabriGroup = augroup('Fabri', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = FabriGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('BufEnter', {
    group = FabriGroup,
    callback = function()
      vim.cmd.colorscheme("solarized")
    end
})


-- Define the Lua function for folding Elixir doc blocks
_G.ElixirDocFold = function(lnum)
  local line = vim.fn.getline(lnum)

  if line:match('^%s*@(doc)%s*"""') or line:match('^%s*@(moduledoc)%s*"""') or line:match('^%s*@(typedoc)%s*"""') then
    return 'a1'  -- Start of fold
  elseif line:match('^%s*"""') then
    return 's1'  -- End of fold
  end
  return '='      -- No fold change for other lines
end

-- Set up folding specifically for Elixir files
autocmd('FileType', {
  group = FabriGroup,
  pattern = 'elixir',
  callback = function()
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'v:lua.ElixirDocFold(v:lnum)'
  end,
})

-- Automatically close all folds when opening Elixir files
autocmd('BufReadPost', {
  group = FabriGroup,
  pattern = '*.ex,*.exs',
  command = 'normal! zM',
})


autocmd('LspAttach', {
    group = FabriGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
