--neovim config
vim.opt.shiftwidth = 4     -- indentation width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard

-- diagnostics / visual settings
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",  -- or "▎", "▶", etc
    spacing = 4,
  },
  virtual_lines = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- settings for all lsp servers
vim.lsp.config("*", {
  root_markers = { ".git", "go.mod" },  -- tweak as needed
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true
      },
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
})


-- enable line numbers
vim.opt.number = true        -- absolute line numbers
vim.opt.relativenumber = true -- relative line numbers

--load plugins
require("config.lazy")
