return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true,
          additional_vim_regex_highlighting = false},
      indent = { enable = true },
      auto_install = true,
    },
  },
}

