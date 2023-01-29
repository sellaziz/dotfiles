require("user.set")
require("user.remap")
require("user.packer")
-- print('init loaded')

local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
