-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local function telescope(func)
  return "<cmd>lua require('telescope.builtin')." .. func .. "<cr>"
end

-- map("n", "<leader>se", telescope("lsp_references()"), { noremap = true, silent = true, desc = "Find References" })
map("n", "<leader>ct", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true, desc = "Terminal Toggle" })

map("n", "<leader>fs", "<cmd>Telescope session-lens<cr>", { noremap = true, silent = true, desc = "Sessions" })

-- copilot
map("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true

-- rest
map("n", "<leader>rr", "<cmd>Rest run<cr>", { noremap = true, silent = true, desc = "Run request under the cursor" })
map("n", "<leader>rl", "<cmd>Rest run last<cr>", { noremap = true, silent = true, desc = "Re-run latest request" })
