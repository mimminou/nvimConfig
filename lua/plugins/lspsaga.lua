return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional, for better syntax in popups
    "nvim-tree/nvim-web-devicons", -- optional, icons
  },
  config = function()
    require("lspsaga").setup {
      -- minimal setup, tweak as needed
      finder = {
        max_height = 0.5, -- 50% of screen
      },
      definition = {
        max_height = 0.5,
      },
      ui = {
        border = "rounded",
      },
    }
  end,
}
