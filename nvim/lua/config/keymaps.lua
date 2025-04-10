-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>fs", "<cmd>SessionSearch<cr>", { noremap = true, silent = true, desc = "Sessions" })

map("n", "<leader>fl", "<cmd>FzfLua resume<cr>", { noremap = true, silent = true, desc = "Resume FzfLua" })
map("n", "<leader>fa", "<cmd>FzfLua<cr>", { noremap = true, silent = true, desc = "Find anything" })

-- console.log
map(
  "n",
  "<leader>cc",
  "yiwo<esc>iconsole.log({ <esc>pa })<esc>:w<cr>",
  { noremap = true, silent = true, desc = "Put current word into console.log" }
)

map(
  "v",
  "<leader>cc",
  "yo<esc>iconsole.log({ <esc>pa })<esc>:w<cr>",
  { noremap = true, silent = true, desc = "Put selection into console.log" }
)

map("n", "<leader>cp", function()
  local cwd = vim.fn.expand("%:p")
  local package_json = vim.fs.find("package.json", { path = cwd, upward = true })[1]
  vim.notify(package_json)
  vim.cmd.edit(package_json)
end, { noremap = true, silent = true, desc = "Show closest package.json relative to current buffer" })

local fzf_cword = function()
  local word = vim.fn.expand("<cword>")
  require("fzf-lua").grep({ search = word })
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>", true, true, true), "n", false)
end

map("n", "<leader>*", fzf_cword, { noremap = true, silent = true, desc = "Grep word under cursor" })
map("n", "<leader>#", fzf_cword, { noremap = true, silent = true, desc = "Grep word under cursor" })

map("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

map("n", "gsd", function()
  vim.cmd("vsplit")
  require("fzf-lua").lsp_definitions({
    jump1 = true,
    ignore_current_line = true,
  })
end, { noremap = true, silent = true, desc = "Go to definition open in new buf" })

map("n", "<leader>gC", function()
  require("fzf-lua").git_bcommits()
end, { noremap = true, silent = true, desc = "Git commits (buffer)" })
