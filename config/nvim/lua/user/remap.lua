vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex) -- [F]older [E]xplore'

-- Move Lines
vim.keymap.set("n", "<S-Down>", ":m+1<CR>")
vim.keymap.set("n", "<S-Up>", ":m-2<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

function fold_unfold_func(direction)
  if direction == "left" then
    -- Unfold the function to the left and keep it centered
    vim.api.nvim_command("normal zO")
    vim.api.nvim_command("normal zz")
  elseif direction == "right" then
    -- Unfold the function to the right and keep it centered
    vim.api.nvim_command("normal zC")
    vim.api.nvim_command("normal zz")
  end
end

function switch_foldmethod(foldmethod)
  -- Set the 'foldmethod' option to the specified value
  vim.api.nvim_set_option("foldmethod", foldmethod)
end

-- Map the "g i" key to switch to the 'indent' foldmethod
vim.keymap.set("n", "g i", ":lua switch_foldmethod('indent')<CR>", {noremap = true, silent = true})

-- Map the "g e" key to switch to the 'expr' foldmethod
vim.keymap.set("n", "g e", ":lua switch_foldmethod('expr')<CR>", {noremap = true, silent = true})

-- Map the "g i" key to switch to the 'indent' foldmethod
vim.keymap.set("n", "g i", ":lua switch_foldmethod('indent')<CR>", {noremap = true, silent = true, desc = "Switch to 'indent' foldmethod"})

-- Map the "g e" key to switch to the 'expr' foldmethod
vim.keymap.set("n", "g e", ":lua switch_foldmethod('expr')<CR>", {noremap = true, silent = true, desc = "Switch to 'expr' foldmethod"})
-- Map the "g r" key to perform an interactive replace using the current visual selection
vim.keymap.set("v", "g r", [["hy:%s/<C-r>h//gc<left><left><left>]],  {noremap = true, silent = true, desc= "Replace interactive current selection"})



