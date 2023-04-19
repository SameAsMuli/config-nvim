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
        jsonls = {},
        lua_ls = {},
        pyright = {},
      },
    },
  },
}
