-- keybinds git

-- estado de git
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', { noremap = true, silent = true })

-- commit de todo lo que se cambió
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit -a<CR>', { noremap = true, silent = true })

-- push 
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })

-- pull 
vim.api.nvim_set_keymap('n', '<leader>gl', ':Git pull<CR>', { noremap = true, silent = true })

-- ver las diferencias en los archivos
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
