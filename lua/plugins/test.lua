return {
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tn", ":TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>tf", ":TestFile<CR>",    desc = "Run tests in file" },
      { "<leader>ts", ":TestSuite<CR>",   desc = "Run entire test suite" },
      { "<leader>tl", ":TestLast<CR>",    desc = "Run last test" },
      { "<leader>tv", ":TestVisit<CR>",   desc = "Visit test file" },
    },
    config = function()
      -- стратегия запуска: встроенный терминал Neovim
      vim.g["test#strategy"] = "neovim"

      -- runner для Go
      vim.g["test#go#runner"] = "gotest"
    end,
  },
}

