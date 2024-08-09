require "nvchad.mappings"

-- add yours here
local opts = { noremap=true, silent=true }

-- local function quickfix()
--     vim.lsp.buf.code_action({
--         filter = function(a) return a.isPreferred end,
--         apply = true
--     })
-- end
-- vim.keymap.set('n', '<leader>qf', quickfix, opts)

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>k", vim.lsp.buf.code_action, opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
