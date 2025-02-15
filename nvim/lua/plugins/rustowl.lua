return {
  {
    -- requires manually installing LSP (not available in Mason)
    "cordx56/rustowl",
    config = function()
      vim.api.nvim_set_hl(0, "lifetime", { underdouble = true, background = "#003c00", sp = "#00cc00" })
      vim.api.nvim_set_hl(0, "imm_borrow", { underdouble = true, background = "#00005c", sp = "#0000cc" })
      vim.api.nvim_set_hl(0, "mut_borrow", { underdouble = true, background = "#7c007c", sp = "#cc00cc" })
      vim.api.nvim_set_hl(0, "move", { underdouble = true, background = "#3c3c00", sp = "#cccc00" })
      vim.api.nvim_set_hl(0, "call", { underdouble = true, background = "#3c3c00", sp = "#cccc00" })
      vim.api.nvim_set_hl(0, "outlive", { underdouble = true, background = "#6c0000", sp = "#cc0000" })

      local lspconfig = require("lspconfig")
      lspconfig.rustowlsp.setup({
        idle_time = 1000,
      })
    end,
  },
}
