return {
  {
    "joshuavial/aider.nvim",
    opts = {
      -- your configuration comes here
      -- if you don't want to use the default settings
      auto_manage_context = true, -- automatically manage buffer context
      default_bindings = true, -- use default <leader>A keybindings
      debug = false, -- enable debug logging
    },
    keys = {
      { "<leader>aa", ":AiderOpen --no-auto-commits --code-theme=one-dark<CR>", desc = "Open aider" },
      {
        "<leader>aw",
        ":AiderOpen --no-auto-commits --code-theme=one-dark --watch-files<CR>",
        desc = "Watch files with aider",
      },
      { "<leader>am", ":AiderAddModifiedFiles<CR>", desc = "Add modified files to aider" },
    },
  },
  -- {
  --   "giuxtaposition/blink-cmp-copilot",
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   enabled = true,
  --   event = "VeryLazy",
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --       hide_during_completion = true,
  --       debounce = 75,
  --       keymap = {
  --         accept = "<C-j>",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --         dismiss = "<C-]>",
  --       },
  --     },
  --   },
  --   keys = {
  --     -- TODO: fix this keymap, it does nothing
  --     { "<leader>ac", ":Copilot toggle<CR>", desc = "Toggle copilot (does nothing, broken)" },
  --   },
  -- },
}
