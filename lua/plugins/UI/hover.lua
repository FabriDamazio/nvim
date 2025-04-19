return {
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup({
        init = function()
          -- Require providers (uncomment what you need)
          require("hover.providers.lsp")
          -- require("hover.providers.gh")
          -- require("hover.providers.gh_user")
          -- require("hover.providers.jira")
          -- require("hover.providers.dap")
          -- require("hover.providers.man")
        end,
        preview_opts = {
          border = "single" -- "none", "single", "double", "rounded", etc.
        },
        preview_window = true,
        title = true,
        mouse_providers = {
          "LSP"
        },
        mouse_delay = 1000
      })

      -- Keymaps (with which-key descriptions)
      vim.keymap.set("n", "<leader>k", require("hover").hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "Hover (Select Provider)" })

      -- Mouse support
      vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "Hover (Mouse)" })
      vim.o.mousemoveevent = true
    end
  }
}
