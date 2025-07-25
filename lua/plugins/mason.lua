return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    "Saghen/blink.cmp"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = {
        "html",
        "ts_ls",
        "cssls",
        "lua_ls",
        "tailwindcss",
        "gopls",
        "emmet_ls",
        "emmet_language_server",
        "eslint",
        "basedpyright",
        "marksman"
      }
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "pylint",
        "clangd",
        "denols"
      }
    })
  end
}
