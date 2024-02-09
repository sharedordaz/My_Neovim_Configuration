vim.g.mapleader = ','

--TOGGLE NEOTREE with <leader> + n
vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })

--:SudaWrite with <leader> + w
vim.api.nvim_set_keymap('n', '<leader>w', ':SudaWrite<CR>', {noremap=true, silent = false})

--Open :Lazy
vim.api.nvim_set_keymap('n', "lz", ':Lazy<CR>', {noremap=true, silent = true})
--Open :Mason
vim.api.nvim_set_keymap('n', "ms", ':Mason<CR>', {noremap=true, silent = true})
--Open :Lspinfo
vim.api.nvim_set_keymap('n', "lsp", ':LspInfo<CR>', {noremap=true, silent = false})



--Fast terminal shortcuts
vim.api.nvim_set_keymap('n', ";;", ':', {noremap=true, silent = false})
vim.api.nvim_set_keymap('n', ";l", ':lua<Space>', {noremap=true, silent = false})
vim.api.nvim_set_keymap('n', ";1", ':!', {noremap=true, silent = false})

vim.api.nvim_set_keymap('n', ";h", ':help<Space>', {noremap=true, silent = false})

vim.keymap.set('n', 'wk', ":WhichKey<Space>", {noremap=true, silent = false})


--Utility
vim.api.nvim_set_keymap('n', "<leader>/", ':noh<CR>', {noremap=true, silent = true})

--BUFFER ADMINISTRATION
vim.api.nvim_set_keymap('n', "<S-h>", ':bp<CR>', {noremap=true, silent = true})
vim.api.nvim_set_keymap('n', "<S-l>", ':bn<CR>', {noremap=true, silent = true})


vim.api.nvim_set_keymap('n', "<leader>b", ':ls<CR>', {noremap=true, silent = true})

vim.api.nvim_set_keymap('i', "<leader>bd", '<Esc>:bd!<CR>', {noremap=true, silent = true})
vim.api.nvim_set_keymap('n', "<leader>bd", ':bd<CR>', {noremap=true, silent = true})

--TElESCOPE

vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", {})
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", {})


--Close TAGS
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<', '<><Left>', { noremap = true, silent = true })


--Colortils
vim.keymap.set('n', 'css', ":Colortils css list<CR>", {})
vim.keymap.set('n', 'cl', ":Colortils picker #000000<CR>", {})
