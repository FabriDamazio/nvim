require("config.keymaps")
require("config.lazy")
require("config.options")

vim.cmd.colorscheme("tokyonight-night")
vim.notify = require("notify")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local LspGroup = augroup('LpsKeys', {})

autocmd('LspAttach', {
  group = LspGroup,
  callback = function(e)
    local opts = { buffer = e.buf }

    -- Navigation
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
      vim.tbl_extend("force", opts, { desc = "[G]oto [D]efinition" }))

    -- Workspace Symbols
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
      vim.tbl_extend("force", opts, { desc = "[V]iew [W]orkspace [S]ymbols" }))

    -- Diagnostics
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
      vim.tbl_extend("force", opts, { desc = "[V]iew [D]iagnostics" }))

    -- Code Actions
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
      vim.tbl_extend("force", opts, { desc = "[V]iew [C]ode [A]ctions" }))

    -- References
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
      vim.tbl_extend("force", opts, { desc = "[V]iew [R]eferences" }))

    -- Renaming
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
      vim.tbl_extend("force", opts, { desc = "[V]iew [R]e[N]ame" }))

    -- Signature Help
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
      vim.tbl_extend("force", opts, { desc = "Signature Help" }))

    -- Diagnostic Navigation
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
      vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))

    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
      vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))
  end
})

local function setup_terminal()
  -- Open terminal in bottom split (20% height)
  local height = math.floor(vim.o.lines * 0.2)
  vim.cmd('botright split | resize ' .. height .. ' | terminal')

  -- Apply terminal settings
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = true })
  vim.g.auto_term_winid = vim.fn.win_getid() -- Track terminal window
  vim.cmd('startinsert')                     -- Enter insert mode automatically

  return vim.g.auto_term_winid
end

-- Toggle terminal with <leader>t
vim.keymap.set('n', '<leader>t', function()
  -- Check if terminal window exists and is valid
  if vim.g.auto_term_winid and vim.fn.win_gotoid(vim.g.auto_term_winid) == 1 then
    print("Terminal is already open")
  else
    setup_terminal()
    vim.cmd('startinsert') -- Enter insert mode automatically
  end
end, { desc = 'Toggle [T]erminal' })

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
            default = "qwen2.5-coder:32b-instruct-q4_K_M",
          },
          num_ctx = {
            default = 4096,
          },
          temperature = {
            default = 0.1,
          },
          top_p = {
            default = 0.9,
          },
          num_predict = {
            default = 1024,
          },
          keep_alive = {
            default = '5m',
          }
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
        position = "right",      -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
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

      ---Customize how tokens are displayed
      ---@param tokens number
      ---@param adapter CodeCompanion.Adapter
      ---@return string
      token_count = function(tokens, adapter)
        return " (" .. tokens .. " tokens)"
      end,
    },
  },
})

-- vsplit separator
vim.cmd("highlight WinSeparator guifg=#414868")
