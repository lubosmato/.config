if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "wslclipboard",
    copy = {
      ["+"] = "/mnt/c/Windows/System32/win32yank.exe -i --crlf",
      ["*"] = "/mnt/c/Windows/System32/win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "/mnt/c/Windows/System32/win32yank.exe -o --lf",
      ["*"] = "/mnt/c/Windows/System32/win32yank.exe -o --lf",
    },
    cache_enabled = false,
  }
end

return {}
