return {
	"nvimdev/lspsaga.nvim",
	-- event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional, for better syntax in popups
		"nvim-tree/nvim-web-devicons",   -- optional, icons
	},
	config = function()
		require("lspsaga").setup {
			-- minimal setup, tweak as needed
			lightbulb = {
				enable = false,
			},
			finder = {
				max_height = 0.5, -- 50% of screen
				keys = {
					toggle_or_open = 'r',
				},
			},
			definition = {
				max_height = 0.5,
				keys = {
					quit = "q",
				},
			},
			rename = {
				keys = {
					quit = "q",
				},
			},
			ui = {
				border = "rounded",
			},
		}
	end,
}
