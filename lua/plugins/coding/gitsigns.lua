return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Load when opening a file
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    on_attach = function(bufnr)
      -- Keymaps (optional)
      local gs = package.loaded.gitsigns
      vim.keymap.set("n", "]c", gs.next_hunk, { buffer = bufnr, desc = "Next Git hunk" })
      vim.keymap.set("n", "[c", gs.prev_hunk, { buffer = bufnr, desc = "Prev Git hunk" })
    end,
  },
} 
