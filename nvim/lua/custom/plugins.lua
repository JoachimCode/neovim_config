
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        direction = "float",
        float_opts = {
          border = "rounded",
        },
      })
    end,
  },
}
