return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "cpp",
        "c",
        "bash",
        "json",
        "yaml",
        "cmake",
        "markdown",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

