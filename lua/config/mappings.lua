local map = vim.keymap.set

-- local wk = require "which-key"

-- define which-key groups
wk.register {
  ["<leader>u"] = { name = "UI" },
  ["<leader>l"] = { name = "LSP" },
  ["<leader>f"] = { name = "Telescope" },
  ["<leader>g"] = { name = "git" },
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

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

map(
  { "n", "x" },
  "<leader>fm",
  function() require("conform").format { lsp_fallback = true } end,
  { desc = "general format file" }
)

-- global lsp mappings
map("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
map("n", "<leader>lR", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder (refs/defs)" })
map("n", "<leader>ls", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Docs" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "<leader>rr", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })

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
map("n", "<leader>o", toggle_neotree, { desc = "neotree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- formatting
map("n", "<leader>uf", toggle_format_on_save, { desc = "toggle formatting on save" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map(
  "n",
  "<leader>wk",
  function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end,
  { desc = "whichkey query lookup" }
)
