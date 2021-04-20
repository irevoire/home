vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'galaxyline-settings' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/lsp_extensions.nvim'
	use 'nvim-lua/completion-nvim'
	use 'tpope/vim-surround'
	use 'voldikss/vim-floaterm'
	use 'preservim/nerdcommenter'
	use 'christoomey/vim-system-copy'
	use 'sheerun/vim-polyglot'
	use 'cespare/vim-toml'
	use 'terryma/vim-multiple-cursors'
	use 'junegunn/fzf.vim'
	use 'vim-scripts/restore_view.vim'
	use {
		'junegunn/fzf',
		run = function() vim.fn['fzf#install'](0) end,
	}
end)
