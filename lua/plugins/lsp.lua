return {
  -- CMAKE-TOOLS: disabling as it hangs outside of git repos
  { "Civitasv/cmake-tools.nvim", enabled = false },

  -- MASON: install and maintain language servers
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "eslint-lsp",
        "flake8",
        "json-lsp",
        "lua-language-server",
        "pyright",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
  },

  -- NVIM_LSPCONFIG: configure language server integration with neovim
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        bashls = {},
        clangd = {},
        cmake = {},
        eslint = {},
        jsonls = {},
        lua_ls = {},
        pyright = {},
        tsserver = {},
        yamlls = {},
      },
    },
  },
}
