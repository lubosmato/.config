return {
  {
    "saghen/blink.cmp",
    version = false,
    opts = {

      enabled = function()
        local disabled = false
        disabled = disabled or (vim.tbl_contains({ "markdown" }, vim.bo.filetype))
        disabled = disabled or (vim.bo.buftype == "prompt")
        disabled = disabled or (vim.fn.reg_recording() ~= "")
        disabled = disabled or (vim.fn.reg_executing() ~= "")
        return not disabled
      end,

      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },

      completion = {
        menu = {
          max_height = 20,
        },

        list = {
          selection = {
            auto_insert = false,
          },

          cycle = {
            from_bottom = true,
            from_top = true,
          },
        },
      },
    },
  },
}
