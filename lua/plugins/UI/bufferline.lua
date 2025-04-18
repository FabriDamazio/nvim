return {
  "akinsho/bufferline.nvim",
  version = "*", -- Use the latest version
  dependencies = "nvim-tree/nvim-web-devicons", -- Optional, for icons
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs", -- "tabs" or "buffers"
        separator_style = "slant", -- or "thick", "thin", "slant"
        color_icons = true,
      },
    })
  end,
}
