vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false

vim.opt.mouse = "a"
vim.opt.mousefocus = true

vim.opt.number = true
--vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true

--clipboard
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
