--disable default status line
vim.opt.showmode = false
vim.opt.cmdheight = 0

return {
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
},
}
