return {
  {
    "joshuavial/aider.nvim",
    opts = {
      -- your configuration comes here
      -- if you don't want to use the default settings
      auto_manage_context = true, -- automatically manage buffer context
      default_bindings = true, -- use default <leader>A keybindings
      debug = false, -- enable debug logging
      -- how to configure to use different model, AI?
    },
    keys = {
      {
        "<leader>aa",
        ":AiderOpen --config ~/.config/.aider.conf.yml<CR>",
        desc = "Open aider",
      },
      {
        "<leader>ar",
        ":AiderOpen --restore-chat-history --config ~/.config/.aider.conf.yml<CR>",
        desc = "Open aider and restore session",
      },
      {
        "<leader>aw",
        ":AiderOpen --config ~/.config/.aider.conf.yml --watch-files<CR>",
        desc = "Watch files with aider",
      },
      { "<leader>am", ":AiderAddModifiedFiles<CR>", desc = "Add modified files to aider" },
    },
  },
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()`, required for `toggle()` — otherwise optional
      { "folke/snacks.nvim", opts = { input = { enabled = true } } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
      }

      -- Required for `vim.g.opencode_opts.auto_reload`
      vim.opt.autoread = true

      -- Recommended/example keymaps
      vim.keymap.set({ "n", "x" }, "<leader>ta", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask about this" })

      vim.keymap.set({ "n", "x" }, "<leader>t+", function()
        require("opencode").prompt("@this")
      end, { desc = "Add this" })

      vim.keymap.set({ "n", "x" }, "<leader>te", function()
        require("opencode").prompt("Explain @this and its context", { submit = true })
      end, { desc = "Explain this" })

      vim.keymap.set({ "n", "x" }, "<leader>ts", function()
        require("opencode").select()
      end, { desc = "Select prompt" })

      vim.keymap.set("n", "<leader>tt", function()
        require("opencode").toggle()
      end, { desc = "Toggle embedded" })

      vim.keymap.set("n", "<leader>tn", function()
        require("opencode").command("session_new")
      end, { desc = "New session" })

      vim.keymap.set("n", "<leader>ti", function()
        require("opencode").command("session_interrupt")
      end, { desc = "Interrupt session" })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("messages_half_page_up")
      end, { desc = "Messages half page up" })

      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("messages_half_page_down")
      end, { desc = "Messages half page down" })
    end,
  },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    event = "VeryLazy",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-j>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
    keys = {
      -- TODO: fix this keymap, it does nothing
      { "<leader>ac", ":Copilot toggle<CR>", desc = "Toggle copilot (does nothing, broken)" },
    },
  },
}
