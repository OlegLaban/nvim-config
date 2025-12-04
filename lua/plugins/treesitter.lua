return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- автоматически обновляет парсеры после установки
  event = { "BufReadPost", "BufNewFile" }, -- загружается при открытии файла
  config = function()
    require("nvim-treesitter.configs").setup {
      -- список парсеров: можно указать конкретные языки или 'all'
      ensure_installed = { "lua", "go", "python", "javascript", "html", "css" },
      -- если хочешь все парсеры: ensure_installed = "all",
      ignore_install = { "phpdoc" }, -- можно исключить проблемные парсеры
      highlight = {
        enable = true, -- включить подсветку синтаксиса
        additional_vim_regex_highlighting = false, -- отключить старую подсветку
      },
      indent = { enable = true }, -- авто‑отступы
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
    }
  end,
}
 
