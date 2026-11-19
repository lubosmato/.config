-- nixd: Nix language server, installed outside mason (`nix profile add nixpkgs#nixd`).
--
-- nixd only documents the packages and options it is told how to evaluate, so
-- its settings are built per project root:
--   * flake project: packages come from the flake's own locked nixpkgs input,
--     NixOS and Home Manager options from one of its nixosConfigurations
--   * anything else: packages from the `nixpkgs` flake registry entry
--
-- The host whose options are used is `vim.g.nixd_host` (set it in a project's
-- .nvim.lua), else the first nixosConfiguration by name. Pick the host that
-- imports the most modules: options of a module no host imports are unknown.

---@param root? string
local function nixd_settings(root)
  if not (root and vim.uv.fs_stat(root .. "/flake.nix")) then
    return { nixpkgs = { expr = 'import (builtins.getFlake "nixpkgs") { }' } }
  end

  -- The flake is read from the git index, so a new .nix file is invisible to
  -- nixd until it is `git add`ed.
  local flake = ('(builtins.getFlake "%s")'):format(root)
  local host = vim.g.nixd_host and ('%s.nixosConfigurations."%s"'):format(flake, vim.g.nixd_host)
    or ("(builtins.head (builtins.attrValues %s.nixosConfigurations))"):format(flake)

  return {
    nixpkgs = { expr = ('import (%s.inputs.nixpkgs or (builtins.getFlake "nixpkgs")) { }'):format(flake) },
    options = {
      nixos = { expr = host .. ".options" },
      -- Home Manager used as a NixOS module: its options are the submodule
      -- type of `home-manager.users.<name>`.
      ["home-manager"] = { expr = host .. ".options.home-manager.users.type.getSubOptions [ ]" },
    },
  }
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = { enabled = false },
        nixd = {
          mason = false,
          -- nixd traces every message to stderr, which Neovim writes to lsp.log.
          cmd = { "nixd", "--log=error" },
          -- The client keeps a reference to this table, so before_init fills
          -- it in place rather than replacing it.
          settings = { nixd = {} },
          before_init = function(_, config)
            config.settings.nixd = vim.tbl_deep_extend("force", nixd_settings(config.root_dir), config.settings.nixd)
          end,
          on_init = function(client)
            -- nixd formats by running `nixfmt`; without it every format-on-save fails.
            if vim.fn.executable("nixfmt") == 0 then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end,
        },
      },
    },
  },
}
