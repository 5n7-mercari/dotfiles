vim.g.mapleader = " "

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars:append({ eol = "↴", space = "⋅" })
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.whichwrap:append("h")
vim.opt.whichwrap:append("l")

local disable_builtin_plugin = function(plugin)
  vim.g["loaded_" .. plugin] = 1
end

local builtin_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(builtin_plugins) do
  disable_builtin_plugin(plugin)
end

local path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", path })
end

require("autocmds")
require("keymaps")
require("plugins")
