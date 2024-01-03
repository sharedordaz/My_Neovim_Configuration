vim.g.mapleader = ','

--TOGGLE NEOTREE with <leader> + n
vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })


--:SudaWrite with <leader> + w
vim.api.nvim_set_keymap('n', '<leader>w', ':SudaWrite<CR>', {noremap=true, silent = false})

--Fast terminal shortcuts
vim.api.nvim_set_keymap('n', ";;", ':', {noremap=true, silent = false})
vim.api.nvim_set_keymap('n', ";l", ':lua<Space>', {noremap=true, silent = false})
vim.api.nvim_set_keymap('n', ";1", ':!', {noremap=true, silent = false})

vim.api.nvim_set_keymap('n', ";h", ':help<Space>', {noremap=true, silent = false})


--print("Hello_World")
