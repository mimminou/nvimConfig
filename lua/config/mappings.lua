local map = vim.keymap.set

-- define which-key groups
GReq.wk.register {
  ["<leader>u"] = { name = "UI" },
  ["<leader>l"] = { name = "LSP" },
  ["<leader>f"] = { name = "Telescope" },
  ["<leader>g"] = { name = "git" },
  ["<leader>t"] = { name = "Toggleterm" },
  ["<leader>w"] = { name = "which-key" },
}

------------------------
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>un", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>ur", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- global lsp mappings
map("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
map("n", "<leader>lR", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder (refs/defs)" })
map("n", "<leader>ls", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Docs" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })

-- git
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>gb", "<cmd>GitBlameToggle<CR>", { desc = "git blame toggle" })
map("n", "<leader>gl", GFun.show_git_blame, { desc = "git blame author popup" })

-- bufferline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<CR>", { desc = "buffer goto next" })
map("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<CR>", { desc = "buffer goto previous" })
map("n", "<leader>c", "<cmd>bd<CR>", { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- neotree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "neotree toggle window" })
map("n", "<leader>o", GFun.toggle_neotree, { desc = "neotree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fp", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- formatting and ui
map("n", "<leader>uw", GFun.toggle_wrap, { desc = "toggle word wrap" })
map("n", "<leader>uf", GFun.toggle_format_on_save, { desc = "toggle format on save" })
map("n", "<leader>uj", GReq.snacks.notifier.hide, { desc = "hide notifications" })
-- terminal
map("n", "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "ToggleTerm horizontal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "ToggleTerm vertical" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map(
  "n",
  "<leader>wk",
  function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end,
  { desc = "whichkey query lookup" }
)
