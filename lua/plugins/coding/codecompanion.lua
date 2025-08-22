return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        qwen_coder = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen_coder",
            opts = {
              stream = true,
            },
            schema = {
              model = {
                default = "qwen2.5:32b-instruct",
              },
              --num_ctx = {
              --  default = 4096,
              --},
              --temperature = {
              --  default = 0.1,
              --},
              --top_p = {
              --  default = 0.9,
              --},
              --num_predict = {
              --  default = 1024,
              --},
              --keep_alive = {
              --  default = '5m',
              --}
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "qwen_coder",
        },
        inline = {
          adapter = "qwen_coder",
        },
      },
      display = {
        chat = {
          -- Change the default icons
          icons = {
            buffer_pin = " ",
            buffer_watch = "👀 ",
          },

          -- Alter the sizing of the debug window
          debug_window = {
            ---@return number|fun(): number
            width = vim.o.columns - 5,
            ---@return number|fun(): number
            height = vim.o.lines - 2,
          },

          -- Options to customize the UI of the chat buffer
          window = {
            layout = "vertical", -- float|vertical|horizontal|buffer
            position = "right",  -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
            border = "rounded",
            height = 0.8,
            width = 0.45,
            relative = "editor",
            full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
            sticky = false,     -- when set to true and `layout` is not `"buffer"`, the chat buffer will remain opened when switching tabs
            opts = {
              breakindent = true,
              cursorcolumn = false,
              cursorline = false,
              foldcolumn = "0",
              linebreak = true,
              list = false,
              numberwidth = 1,
              signcolumn = "no",
              spell = false,
              wrap = true,
            },
          },
          diff = {
            provider = "mini_diff",
          },
          ---Customize how tokens are displayed
          ---@param tokens number
          ---@param adapter CodeCompanion.Adapter
          ---@return string
          token_count = function(tokens, adapter)
            return " (" .. tokens .. " tokens)"
          end,
        },
      }
    })
  end,
}
