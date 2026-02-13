return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        cpp = { "clang_format" },
        c = { "clang_format" },
      },
    },
  },
}

