return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave" },
    opts = {
      debounce_delay = 2000,
    },
  },
}
