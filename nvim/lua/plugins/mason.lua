local is_nixos = vim.fn.filereadable("/etc/NIXOS") == 1

if is_nixos then
  return {
    { "mason-org/mason.nvim", enabled = false },
    { "mason-org/mason-lspconfig.nvim", enabled = false },
  }
end

return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        -- "checkstyle",
        "clang-format",
        "clangd",
        "codelldb",
        "html-lsp",
        "prettier",
        "yaml-language-server",
        "gitlab-ci-ls",
        "ruff",
        "gh-actions-language-server",
        -- "arduino-language-server",
        "biome",
        "css-lsp",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "mdx-analyzer",
        "pyright",
        "rust-analyzer",
        "tailwindcss-language-server",
        "taplo",
        "vtsls",
        "nil",
      },
    },
  },
}
