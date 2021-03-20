-- use some parts of the old conf
vim.api.nvim_command("runtime! include/bepo.vim")
vim.api.nvim_command("runtime! include/style.vim")
vim.api.nvim_command("runtime! include/default.vim")


require('mappings')
require('plugins')
require('settings')

require('lsp')

vim.api.nvim_command("set nonumber")
