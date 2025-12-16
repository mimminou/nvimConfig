--disable default status line
vim.opt.showmode = false
vim.opt.cmdheight = 0 -- this hides macros, to fix, enable these 2 lines :
vim.cmd [[ autocmd RecordingEnter * set cmdheight=1 ]]
vim.cmd [[ autocmd RecordingLeave * set cmdheight=0 ]]

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_a = {},
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
