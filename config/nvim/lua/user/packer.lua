-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})
	-- Highlight, edit, and navigate code
	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use 'lewis6991/gitsigns.nvim'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}
	use 'chentoast/marks.nvim'
	use {'williamboman/mason.nvim',
	config = function()
		require("mason").setup {
		}
	end}
	use { -- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	requires = {
		-- Automatically install LSPs to stdpath for neovim
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		'j-hui/fidget.nvim',

		-- Additional lua configuration, makes nvim stuff amazing
		'folke/neodev.nvim',
	},
}
	--use {
	--	'VonHeikemen/lsp-zero.nvim',
	--	requires = {
	--		-- LSP Support
	--		{'neovim/nvim-lspconfig'},
	--		{'williamboman/mason.nvim'},
	--		{'williamboman/mason-lspconfig.nvim'},

	--		-- Autocompletion
	--		{'hrsh7th/nvim-cmp'},
	--		{'hrsh7th/cmp-buffer'},
	--		{'hrsh7th/cmp-path'},
	--		{'saadparwaiz1/cmp_luasnip'},
	--		{'hrsh7th/cmp-nvim-lsp'},
	--		{'hrsh7th/cmp-nvim-lua'},

	--		-- Snippets
	--		{'L3MON4D3/LuaSnip'},
	--		{'rafamadriz/friendly-snippets'},
	--	}
	--}
	use 'navarasu/onedark.nvim' -- Theme inspired by Atom
	use 'nvim-lualine/lualine.nvim' -- Fancier statusline
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
	use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use("folke/zen-mode.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end
	})
end)

