require "nvchad.autocmds"
-- autosave after idle
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    if vim.bo.buftype == "" and vim.bo.modified then
      vim.defer_fn(function()
        if vim.bo.modified then
          vim.cmd("silent write")
        end
      end, 800) -- ms delay
    end
  end,
})


vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.notify("Saved", vim.log.levels.TRACE, { title = "AutoSave", timeout = 300 })
  end,
})

