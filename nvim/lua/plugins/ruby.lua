return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ruby" } },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        solargraph = {
          enabled = false,
        },
        ruby_lsp = {
          enabled = true,
          cmd = { os.getenv("HOME") .. "/.local/share/mise/shims/ruby-lsp" },
          -- TODO: this is a bit suboptimal config
          -- settings = {
          --   rubyLsp = {
          --     rubyVersionManager = { miseExecutablePath = "/opt/homebrew/bin/mise" },
          --   },
          -- },
        },
        rubocop = {
          enabled = true,
          -- TODO: had to install bunch of gems manually at specific version
          cmd = { os.getenv("HOME") .. "/.local/share/mise/shims/rubocop", "--lsp" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        rubocop = {
          -- TODO: had to install bunch of gems manually at specific version
          command = os.getenv("HOME") .. "/.local/share/mise/shims/rubocop",
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "erb-formatter", "erb-lint" } },
  },
  {
    "olimorris/neotest-rspec",
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
        eruby = { "erb_format" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          -- rspec_cmd = function()
          --   return vim.tbl_flatten({
          --     "bundle",
          --     "exec",
          --     "rspec",
          --   })
          -- end,
        },
      },
    },
  },

  -- TODO: ror.nvim needs more configuration love to work properly
  -- {
  --   "weizheheng/ror.nvim",
  --   dependencies = {
  --     -- TODO: can we get rid of telescope and use instead fzf-lua?
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "stevearc/dressing.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     require("ror").setup({
  --       test = {
  --         message = {
  --           file = "Running test file...",
  --           line = "Running single test...",
  --         },
  --         coverage = {
  --           up = "DiffAdd",
  --           down = "DiffDelete",
  --         },
  --         notification = {
  --           timeout = false,
  --         },
  --         pass_icon = "✅",
  --         fail_icon = "❌",
  --       },
  --     })
  --   end,
  --   keys = {
  --     -- Main command menu
  --     {
  --       "<leader>ru",
  --       function()
  --         require("ror.commands").list_commands()
  --       end,
  --       desc = "RoR Commands Menu",
  --     },
  --   },
  -- },
}
