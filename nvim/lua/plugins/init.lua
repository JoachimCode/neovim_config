
return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
    end,
  },


  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { "<leader>t", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal" },
    },
    config = function()
      require("toggleterm").setup({
        direction = "float",
        float_opts = { border = "rounded" },
      })
    end,
  },
   
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()
    end,
  },
}
