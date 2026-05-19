return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>cs", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        position = "right",
        width = 25,
        auto_width = {
          enabled = true,
        },
        relative_width = true,
      },
      symbol_folding = {
        autofold_depth = false,
      },
    },
  },
}
