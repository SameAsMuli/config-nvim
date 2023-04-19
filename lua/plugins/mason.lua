return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "flake8",
        "json-lsp",
        "lua-language-server",
        "pyright",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
      },
    },
  },
}
