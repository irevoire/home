-- use some parts of the old conf
vim.api.nvim_command("runtime! include/bepo.vim")
vim.api.nvim_command("runtime! include/style.vim")
vim.api.nvim_command("runtime! include/default.vim")


require('plugins')
require('mappings')
require('settings')

require('lsp')
