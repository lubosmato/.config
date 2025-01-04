return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = { "n" },
          {
            "<leader>r",
            group = "refactor/generate",
            icon = { icon = "󱕅", color = "red" },
          },
        },
      },
      preset = "classic",
    },
  },
}
