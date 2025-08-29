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
        http = {
          qwen_coder = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "qwen_coder",
              opts = {
                stream = true,
              },
              schema = {
                model = {
                  default = "qwen3:30b-a3b-instruct-2507-q4_K_M",
                },
                num_ctx = {
                  default = 32768,
                },
                temperature = {
                  default = 0.7,
                },
                top_p = {
                  default = 0.8,
                },
                top_k = {
                  default = 20,
                },
                repetition_penalty = {
                  default = 1.05,
                },
              },
            })
          end,
          opts = {
            -- se você precisar passar configs globais do http adapter
          },
        },
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
          icons = {
            buffer_pin = " ",
            buffer_watch = "👀 ",
          },
          debug_window = {
            width = vim.o.columns - 5,
            height = vim.o.lines - 2,
          },
          window = {
            layout = "vertical",
            position = "right",
            border = "rounded",
            height = 0.8,
            width = 0.4,
            relative = "editor",
            full_height = true,
            sticky = false,
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
            enabled = true,
            provider = "mini_diff",
          },
          token_count = function(tokens, adapter)
            return " (" .. tokens .. " tokens)"
          end,
        },
      },
    })
  end,
}

