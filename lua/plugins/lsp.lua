return {
  {
    "neovim/nvim-lspconfig",
    ft = "php",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function()
          vim.lsp.start({
            name = "intelephense",
            cmd = { "intelephense", "--stdio" },
            filetypes = { "php" },

            -- ВАЖНО: правильный root_dir
            root_dir = vim.fs.root(0, { "composer.json", ".git" }),

            capabilities = capabilities,

            settings = {
              intelephense = {
                files = {
                  maxSize = 5000000,
                },
                environment = {
                  includePaths = { "./" }, -- чтобы видеть require
                },
              },
            },
          })
        end,
      })
    end,
  },
}
