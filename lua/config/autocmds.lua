-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

local Shell = require("util.shell")

-- revert a file's modification time (to prevent make rebuilding it)
map("n", "<leaderfu", function()
  Shell.run({ "touch", "-m", "-t", "7001010100", vim.api.nvim_buf_get_name(0) }, { title = "untouch" })
end, "untouch (revert modified time)")
