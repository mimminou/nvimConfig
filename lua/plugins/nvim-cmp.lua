return {
  {
    name = "nvim-cmp",
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "neovim/nvim-lspconfig", -- for LSP + capabilities setup
    },
	enabled = false,
    opts = {},
  },
}
