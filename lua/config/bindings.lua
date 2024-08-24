vim.g.mapleader = " "
vim.o.relativenumber = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.fillchars = { eob = " " }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true		

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)
map("i", "jk", "<ESC>")

-- map("n", "<leader>k", quickfix, opts)
map("n", "<leader>k", vim.lsp.buf.code_action, opts)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- esto es para mover lineas con alt
map('n', '<a-j>', ':m .+1<cr>==', { noremap = true, silent = true })
map('n', '<a-k>', ':m .-2<cr>==', { noremap = true, silent = true })
map('x', '<a-j>', ':m \'>+1<cr>gv=gv', { noremap = true, silent = true })
map('x', '<a-k>', ':m \'<-2<cr>gv=gv', { noremap = true, silent = true })

-- esto es para saltar las marcas q se hacen con m 
map('n', '.', '\'', { noremap = true, silent = true })

-- nuevas lineas con o y alt o
vim.keymap.set('n', '<A-o>', 'm`o<Esc>``')
vim.keymap.set('n', '<S-A-o>', 'm`O<Esc>``')

-- bajar y subir codigo con texto centrado
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

