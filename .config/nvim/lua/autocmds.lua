vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.fo:remove({ "c", "o", "r" })
  end,
})
