return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({})
    local builtin = require('telescope.builtin')

    -- File Search
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {
      desc = "[P]roject [F]iles (find_files)"
    })

    vim.keymap.set('n', '<C-p>', builtin.git_files, {
      desc = "Git Files (git_files)" -- Shown in which-key when pressing <C-p>
    })

    -- Word-based Search
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, {
      desc = "[P]roject [W]ord [S]earch (current word)"
    })

    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, {
      desc = "[P]roject [W]ORD [S]earch (including symbols)"
    })

    -- Interactive Search
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, {
      desc = "[P]roject [S]earch (interactive grep)"
    })

    -- Help Tags
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {
      desc = "[V]iew [H]elp tags"
    })

    -- LSP References
    vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {
      desc = "[L]SP [R]eferences"
    })
  end
}
