-- store state
local format_on_save = true
_G.wk = require "which-key"

-- toggle function
function _G.toggle_format_on_save()
  format_on_save = not format_on_save
  print("Format on save:", format_on_save and "ON" or "OFF")
end

-- autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if format_on_save then vim.lsp.buf.format { async = false } end
  end,
})

--toggle neotree focus
function toggle_neotree()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd "p"
  else
    vim.cmd "Neotree focus"
  end
end

--custom :q function to check buffers then quit
vim.api.nvim_create_user_command("Q", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "modified") then
      print "You have unsaved buffers! if you are sure, use :q! to force close"
      return
    end
  end
  vim.cmd "qa"
end, {})

-- Make :q call our Q command
vim.cmd [[cnoreabbrev q Q]]
