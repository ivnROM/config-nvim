local terminal = require("config.terminal")
local presets = require("config.filepresets")

vim.g.mapleader = " "
vim.o.relativenumber = true
vim.wo.number = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.fillchars = { eob = " " }
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- identaciones para los distintos tipos de archivos
-- para archivos js, ts, y html
-- mayoria de formatos
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "html" },
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2"
})

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
map('n', '<A-o>', 'm`o<Esc>``')
map('n', '<S-A-o>', 'm`O<Esc>``')

-- bajar y subir codigo con texto centrado
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- cerrar buffers 
map('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })

-- guardar archivo
map('n', '<C-M-w>', ':w<CR>')
-- guardar y salir del archivo
map('n', '<C-M-q>', ':wq!<CR>')

-- abrir terminal
vim.keymap.set('n', '<leader>to', terminal.open_floating_terminal, { noremap = true, silent = true })

-- determinar bindings de filepresets
vim.keymap.set('n', '<leader>fph', function()
  vim.api.nvim_put(presets.html_template, 'l', true, true)
end, { desc = "html" })

vim.keymap.set('n', '<leader>fpc', function()
  vim.api.nvim_put(presets.css_template, 'l', true, true)
end, { desc = "css" })

vim.keymap.set('n', '<leader>fpj', function()
  vim.api.nvim_put(presets.js_template, 'l', true, true)
end, { desc = "js" })

map('n', '<leader>tt', ':term<CR>')
