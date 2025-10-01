--neovim config
vim.opt.shiftwidth = 4     -- indentation width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- enable line numbers
vim.opt.number = true        -- absolute line numbers
vim.opt.relativenumber = true -- relative line numbers

--load plugins
require("config.lazy")
