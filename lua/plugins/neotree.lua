return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        window = {
          fuzzy_finder_mappings = {
            ["<CR>"] = function(state)
              local node = state.tree:get_node()
              if node and node.type == "file" then
                require("neo-tree.sources.filesystem.commands").open(state)
              end
            end,
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
          },
        },
      },
      window = {
        position = "left",
        width = 25,
      },
    },
  },
}
