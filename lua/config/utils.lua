-- toggle function
GVal.format_on_save = true
function GFun.toggle_format_on_save()
  GVal.format_on_save = not GVal.format_on_save
  GReq.snacks.notify("Format on save: " .. (GVal.format_on_save and "ON" or "OFF"), {})
end

-- autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if GVal.format_on_save then vim.lsp.buf.format { async = false } end
  end,
})

--toggle neotree focus
function GFun.toggle_neotree()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd "p"
  else
    vim.cmd "Neotree focus"
  end
end

function GFun.toggle_wrap()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.opt.linebreak = not vim.opt.linebreak:get()
  GReq.snacks.notify("Wrapping " .. (vim.opt.wrap:get() and "ON" or "OFF"), {})
end

--custom :q function to check buffers then quit
vim.api.nvim_create_user_command("Q", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "modified") then
      GReq.snacks.notify("You have unsaved buffers! if you are sure, use :q! to force close", {})
      return
    end
  end
  vim.cmd "qa"
end, {})

-- Make :q call our Q command
vim.cmd [[cnoreabbrev q Q]]
