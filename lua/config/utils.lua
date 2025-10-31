--git blame popup
function GFun.show_git_blame()
  local line = vim.api.nvim_win_get_cursor(0)[1]
local file = vim.api.nvim_buf_get_name(0)

local cmd = "git blame -L " .. line .. "," .. line .. " --porcelain " .. vim.fn.shellescape(file)
local output = vim.fn.systemlist(cmd)

  if not output or #output == 0 then return end

  local author = "Unknown"
  local summary = ""

  for _, l in ipairs(output) do
    local a = l:match("^author%s+(.+)")
    if a then author = a end
    local s = l:match("^summary%s+(.+)")
    if s then summary = s end
  end

  local text = string.format("%s • %s", author, summary)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })
  vim.api.nvim_buf_add_highlight(buf, -1, "Function", 0, 0, -1)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "cursor",
    row = 1,
    col = 0,
    width = #text + 2,
    height = 1,
    style = "minimal",
    border = "rounded",
  })

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, silent = true })

  vim.keymap.set("n", "<Esc>", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, silent = true })
end

-- toggle function
GVal.format_on_save = false
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

-- Make :q call Q command
vim.cmd [[cnoreabbrev q Q]]
-- fix :Q being called when :q! is called
vim.cmd([[cnoreabbrev Q! qa!]])
