return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
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
