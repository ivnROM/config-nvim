require("harpoon").setup({})

vim.api.nvim_set_keymap('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':lua require("harpoon.ui").nav_file(5)<cr>', { noremap = true })

