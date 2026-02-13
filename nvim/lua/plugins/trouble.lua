return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      focus = true,
      auto_close = true,
      modes = {
        diagnostics = {
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.4,
          },
        },
      },
    },

    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
      { "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP references" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
    },
  },
}

