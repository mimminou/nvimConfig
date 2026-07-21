--neovim config
vim.opt.shiftwidth = 2 -- indentation width
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- OSC 52 clipboard: syncs via terminal escape sequence instead of spawning wl-copy/xclip,
-- which was tripping a pop-shell workspace retile on every yank/delete.
-- copy-only: paste requires the terminal to answer an OSC 52 query, which GNOME Terminal
-- doesn't do, and blocks/hangs typing while nvim waits for a reply that never comes.
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = { "wl-paste", "--no-newline" },
		["*"] = { "wl-paste", "--no-newline", "--primary" },
	},
}
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.wrap = false              --disable wrap by default
vim.opt.undofile = true           -- enable infinite undo
vim.opt.number = true             -- absolute line numbers
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- diagnostics / visual settings
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- or "▎", "▶", etc
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
	root_markers = { ".git", "go.mod" }, -- tweak as needed
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

--load plugins
require("config.lazy")
