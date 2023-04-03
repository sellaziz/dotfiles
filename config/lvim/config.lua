--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>gS"] = "<cmd> Git<cr>" -- use Telescope ref

-- lvim.keys.visual_mode["cs\""] = ":'<,'>s/\\%V/\"&\"/g<cr>"
-- lvim.keys.visual_mode["cs\""] = [[:'<,'>s/\%V/"&"/g<cr>]]


lvim.builtin.which_key.mappings["m"] = {
  name = "+MyCustomKeys",
  T = {"<cmd>TodoTelescope<cr>", "Todo Telescope"},
}

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- vim.keymap.del("n", "gr")
-- override a default keymapping
local _ = pcall(require, "telescope.builtin")
-- lvim.keys.normal_mode["gr"] = "<cmd> Telescope lsp_references<cr>" -- use Telescope ref
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["ms"] = {
 name = "+Spectre",
  S = {"<cmd>lua require('spectre').open()<CR>"},
  p = {"viw:lua require('spectre').open_file_search()<cr>"},
  T = {"<cmd> :TodoQuickFix<cr>"},
}
lvim.keys.visual_mode["<leader>s"] = "<esc>:lua require('spectre').open_visual()<CR>"
lvim.keys.normal_mode["<leader>sp"] = "viw:lua require('spectre').open_file_search()<cr>  "



-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "json",
  "lua",
  "python",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  lvim.keys.normal_mode["gr"] = "<cmd> Telescope lsp_references<cr>" -- use Telescope ref
end


-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  -- {
  --   "s1n7ax/nvim-window-picker",
  --   tag = "1.*",
  --   config = function()
  --     require("window-picker").setup({
  --       autoselect_one = true,
  --       include_current = false,
  --       filter_rules = {
  --         -- filter using buffer options
  --         bo = {
  --           -- if the file type is one of following, the window will be ignored
  --           filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

  --           -- if the buffer type is one of following, the window will be ignored
  --           buftype = { "terminal" },
  --         },
  --       },
  --       other_win_hl_color = "#e35e4f",
  --     })
  --   end,
  -- },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    -- Use cs"<character-to-replace> to surround with new char
    -- Use S<character-to-add> to surround selection in visual
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },
}

-- example mappings you can place in some other place
-- An awesome method to jump to windows
-- local picker = require('window-picker')

-- vim.keymap.set("n", ",w", function()
--   local picked_window_id = picker.pick_window({
--     include_current_win = true
--   }) or vim.api.nvim_get_current_win()
--   vim.api.nvim_set_current_win(picked_window_id)
-- end, { desc = "Pick a window" })

-- -- Swap two windows using the awesome window picker
-- local function swap_windows()
--   local window = picker.pick_window({
--     include_current_win = false
--   })
--   local target_buffer = vim.fn.winbufnr(window)
--   -- Set the target window to contain current buffer
--   vim.api.nvim_win_set_buf(window, 0)
--   -- Set current window to contain target buffer
--   vim.api.nvim_win_set_buf(0, target_buffer)
-- end

-- vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--
--

function live_grep_git_dir()
  -- local git_dir = vim.api.nvim_exec("!git rev-parse --show-toplevel",false)
  -- local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
  git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
  print(git_dir)
  local opts = {
    cwd = git_dir,
  }
  require('telescope.builtin').live_grep(opts)
end

lvim.keys.normal_mode["<leader>gG"] = ":lua live_grep_git_dir()<CR>"

function live_grep_git_dir_qf()
  -- Get the top-level directory of the current git repository
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
  -- Remove the trailing newline character from the output of `git rev-parse`
  git_dir = string.gsub(git_dir, "\n", "")

  local opts = {
    -- Set the current working directory to the top-level directory of the git repository
    cwd = git_dir,
    -- Use the quickfix window to display the search results
    sink = 'qf',
  }
  require('telescope.builtin').grep_string(opts)
end

lvim.keys.normal_mode["<leader>gT"] = ":lua live_grep_git_dir_qf()<CR>"

require("user.clangd_lsp")
require("user.rust_analyzer_lsp")
