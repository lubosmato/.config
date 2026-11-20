-- Locate a project venv for pyright: `<root>/.venv/bin/python`, walking up from
-- the LSP root so files inside `libs/` or nested packages still resolve. Falls
-- back to $VIRTUAL_ENV, then to whatever `python` pyright finds on PATH.
local function find_venv_python(root_dir)
  if vim.env.VIRTUAL_ENV then
    local py = vim.env.VIRTUAL_ENV .. "/bin/python"
    if vim.fn.executable(py) == 1 then
      return py
    end
  end
  for dir in vim.fs.parents(root_dir .. "/.") do
    for _, name in ipairs({ ".venv", "venv" }) do
      local py = dir .. "/" .. name .. "/bin/python"
      if vim.fn.executable(py) == 1 then
        return py
      end
    end
  end
  return nil
end

return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          before_init = function(_, config)
            local py = find_venv_python(config.root_dir)
            if py then
              config.settings = config.settings or {}
              config.settings.python = config.settings.python or {}
              config.settings.python.pythonPath = py
            end
          end,
        },
      },
    },
  },
}
