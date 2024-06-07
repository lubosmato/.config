return {
  -- NOTE: had some troubles with luarocks installing lua-curl
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup({
        client = "curl",
        skip_ssl_verification = false,
        logs = { level = "info", save = true },
        highlight = {
          enabled = true,
          timeout = 750,
        },
      })
    end,
  },
}
