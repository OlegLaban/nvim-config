vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics in float" })

vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = "Code action" })

