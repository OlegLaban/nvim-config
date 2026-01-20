vim.opt.ignorecase = true
vim.opt.smartcase = true

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




vim.api.nvim_create_augroup("SystemLayoutSwitch", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = "SystemLayoutSwitch",
  pattern = {"*.txt", "*.tex" },
  callback = function()
    vim.opt_local.keymap = "russian-jcukenwin"
    print("Keymap: Russian JCuken")
  end,
})



vim.keymap.set("i", "<F3>", function()
  vim.opt_local.keymap = ""
  print("Keymap: English")
end, { silent = true })

vim.keymap.set("i", "<F4>", function()
  vim.opt_local.keymap = "russian-jcukenwin"
  print("Keymap: Russian JCuken")
end, { silent = true })


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex" },  -- только для файлов с filetype=tex
  callback = function()
    vim.keymap.set("n", "<F5>", function()
      local filename = vim.fn.expand("%:t")
      local root = vim.fn.getcwd()
      local cmd = string.format("cd %s && pdflatex -shell-escape %s", root, filename)
      vim.fn.system(cmd)
      print("Запущено: " .. cmd)
    end, { buffer = true })
  end,
})
