-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.g.nvim_tree_respect_buf_cwd = 1
-- Map the "g t" key to toggle the nvim-tree
vim.api.nvim_set_keymap("n", "g t", ":NvimTreeToggle<CR>", {noremap = true, silent = true, desc = "Toggle the nvim-tree"})

-- Map the "g f" key to focus on the nvim-tree
vim.api.nvim_set_keymap("n", "g f", ":NvimTreeFocus<CR>", {noremap = true, silent = true, desc = "Focus on the nvim-tree"})

-- Map the "g j" key to move the cursor in the tree for the current buffer
vim.api.nvim_set_keymap("n", "g j", ":NvimTreeFindFile<CR>", {noremap = true, silent = true, desc = "Move the cursor in the tree for the current buffer"})

-- Map the "g k" key to collapse the nvim-tree recursively
vim.api.nvim_set_keymap("n", "g k", ":NvimTreeCollapse<CR>", {noremap = true, silent = true, desc = "Collapse the nvim-tree recursively"})

