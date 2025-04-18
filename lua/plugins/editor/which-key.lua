return {
  "folke/which-key.nvim",
  event = "VeryLazy",
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
