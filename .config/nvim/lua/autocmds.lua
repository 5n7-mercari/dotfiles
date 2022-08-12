vim.api.nvim_create_autocmd("Filetype", {
  pattern = "*",
  callback = function()
    vim.opt.fo:remove({ "c", "o", "r" })
  end,
})
