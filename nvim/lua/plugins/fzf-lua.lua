return {
  {
    "ibhagwan/fzf-lua",

    keys = {
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader><c-space>", LazyVim.pick("files", { root = true }), desc = "Find Files (current project)" },
    },
    opts = function(_, opts)
      local actions = require("fzf-lua").actions

      return vim.tbl_deep_extend("force", opts or {}, {
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
            ["tab"] = "down",
            ["shift-tab"] = "up",
          },
          grep = {
            ["ctrl-g"] = { actions.grep_lgrep },
          },
        },
      })
    end,
  },
}
