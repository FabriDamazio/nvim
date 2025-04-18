return {
  "echasnovski/mini.pairs",
  event = "InsertEnter", -- Load only when entering insert mode
  config = function()
    require("mini.pairs").setup()
  end,
}
