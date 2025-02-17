return {
  {
    "saghen/blink.cmp",
    version = false,
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      completion = {
        menu = {
          max_height = 20,
        },
      },
    },
  },
}
