return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    triggers = {}, -- Disable automatic popup
  },
  keys = {
    {
      "<C-k>",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
