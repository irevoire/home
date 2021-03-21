vim.o.termguicolors = true
vim.o.swapfile = false
vim.wo.cursorline = true

-- search features
vim.o.inccommand = 'nosplit'	-- Show replacement as you type
vim.o.incsearch = true		-- Find as you type search
vim.o.ignorecase = true		-- Case insensitive search
vim.o.smartcase = true		-- Case sensitive when uc present
vim.o.gdefault = true
vim.o.hidden = true

vim.g.floaterm_keymap_toggle = '<F12>'

vim.api.nvim_exec([[
syntax enable
filetype plugin indent on
"remove trailing whitespaces"
autocmd BufWritePre * %s/\s\+$//e
]], false);
