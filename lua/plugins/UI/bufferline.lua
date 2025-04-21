return {
  "akinsho/bufferline.nvim",
  version = "*",                                -- Use the latest version
  dependencies = "nvim-tree/nvim-web-devicons", -- Optional, for icons
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        mode = "tabs",             -- "tabs" or "buffers"
        style_preset = bufferline.style_preset.no_italic,
        separator_style = "slant", -- or "thick", "thin", "slant"
        color_icons = true,
      },
    })
  end,
}
