return {
  -- TELESCOPE: common fuzzy finder interface for neovim
  {
    "nvim-telescope/telescope.nvim",
    -- add telescope-fzf-native for faster fuzzy searching
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- TELESCOPE-FILE_BROWSER: file browser extension for Telescope
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<leader>fB",
        ": Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Browse Files",
      },
    },
  },
}
