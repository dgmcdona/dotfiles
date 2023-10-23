-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- terminals
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
      require('toggleterm').setup({
        open_mapping = '<C-,>',
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      })
    end
  },

  -- git
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },

  -- neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
}
