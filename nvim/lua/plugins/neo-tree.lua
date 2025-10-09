return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "f1deac7ecec88c28a250d890ba7bb35843e69cbd",
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
