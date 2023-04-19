return {
  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
    keys = {
      {
        "<leader>cn",
        ": lua require('neogen').generate()<cr>",
        desc = "Neogen",
      },
    },
    opts = {
      snippet_engine = "luasnip",
    },
  },
}
