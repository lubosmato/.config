return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        biome = {
          command = "biome",
          args = {
            "check",
            "--write",
            "--stdin-file-path",
            "$FILENAME",
          },
        },
      },
      formatters_by_ft = {
        ["astro"] = { "biome" },
        ["css"] = { "biome" },
        ["graphql"] = { "biome" },
        ["javascript"] = { "biome" },
        ["javascriptreact"] = { "biome" },
        ["json"] = { "biome" },
        ["jsonc"] = { "biome" },
        ["svelte"] = { "biome" },
        ["typescript"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["vue"] = { "biome" },
      },
    },
  },
}
