vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics in float" })

vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = "Code action" })

local opts = { noremap = true, silent = true }
for _, mode in ipairs({'n','i','v'}) do
  vim.keymap.set(mode, '<Up>', '<Cmd>echo "Use - k"<CR>', opts)
  vim.keymap.set(mode, '<Down>', '<Cmd>echo "Use - j"<CR>', opts)
  vim.keymap.set(mode, '<Left>', '<Cmd>echo "Use - h"<CR>', opts)
  vim.keymap.set(mode, '<Right>', '<Cmd>echo "Use - l"<CR>', opts)
end

