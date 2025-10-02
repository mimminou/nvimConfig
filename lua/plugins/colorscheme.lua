return {
  { --catppuccin
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
      }
    end,
  },
  { "folke/tokyonight.nvim" },
  { "AstroNvim/astrotheme" , opts={
	  palette = "astrodark",
  }},
}

