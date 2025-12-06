return {
  {
    "neovim/nvim-lspconfig",
    
config = function()
  --   vim.lsp.
  -- -- создаём конфиг для LTeX
  local ltex_config = vim.lsp.config("ltex", {
    cmd = { "/home/oleglaban/opt/ltex-ls-16.0.0/bin/ltex-ls" }, -- бинарник или путь к jar
    filetypes = { "tex", "bib", "markdown" },
    root_dir = vim.fn.getcwd(), -- или другой root_dir
    settings = {
      ltex = {
        language = "ru-RU",
        dictionary = {
          ["ru-RU"] = vim.fn.readfile(
            vim.fn.stdpath("config") .. "/spell/ru.utf-8.add"
          ),
        },
      },
    },
  })

    vim.lsp.enable('ltex')
end,
  },
}
