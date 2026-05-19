return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          filtered_items = {
            hide_dotfiles = false,
          },
          window = {
            mappings = {
              -- disable fuzzy finder
              ["/"] = "noop",
            },
          },
        },
      })
    end,
  },
}
