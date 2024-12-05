return {
  {
    "danymat/neogen",
    config = true,
    keys = {
      {
        "<leader>rd",
        mode = { "n" },
        function()
          require("neogen").generate()
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = { "n" },
          {
            "<leader>rd",
            group = "Generate docs",
            icon = {
              icon = "󰙵 ",
              color = "blue",
            },
          },
        },
      },
    },
  },
}
