return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          },
        },
      })
    end,
  },
}
