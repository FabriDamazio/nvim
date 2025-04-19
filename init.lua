require("config.keymaps")
require("config.lazy")
require("config.options")

-- Set the default colorscheme
vim.cmd.colorscheme "tokyonight-night"

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

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))

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

