-- Fuzzy find
vim.api.nvim_set_keymap('n', '<C-f>', ":Files<cr>", { noremap = true, silent = true })

-- lsp mappings
vim.api.nvim_set_keymap('n', '<leader>gd', "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gtd', "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
--[[
vim.api.nvim_set_keymap('n', 'g0', "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
--]]


-- Quickfix mappings
vim.api.nvim_set_keymap('n', '<leader>n', ":cnext<CR>", { noremap = true, silent = true })
