-- use some parts of the old conf
vim.api.nvim_command("runtime! include/bepo.vim")
vim.api.nvim_command("runtime! include/default.vim")


require('plugins')
require('mappings')
require('settings')

require('lsp')

-- import the style last so it doesn't get erased by something else
vim.api.nvim_command("runtime! include/style.vim")
