-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local function telescope(func)
  return "<cmd>lua require('telescope.builtin')." .. func .. "<cr>"
end

-- map("n", "<leader>se", telescope("lsp_references()"), { noremap = true, silent = true, desc = "Find References" })
map("n", "<leader>ct", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true, desc = "Terminal Toggle" })
