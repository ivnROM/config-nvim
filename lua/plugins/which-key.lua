-- configuracion basica para which-key
-- require("which-key").setup {
--     -- aca podés meter config general si querés, como el delay
--     -- plugins = {
--     --     spelling = { enabled = true }, -- ejemplo para corrección de texto
--     -- },
--     -- win = {
--     --     border = "single", -- bordes alrededor de la ventana de which-key
--     -- },
-- }
--
local wk = require("which-key")
wk.add({
  { "<leader>f", group = "file" }, -- group
  { "<leader>ff", desc = "find file", mode = "n" },
  { "<leader>fn", desc = "new file" },

  { "<leader>w", group = "windows" }, -- proxy to window mappings
  { "<leader>t", group = "terminal" }, -- proxy to window mappings
  { "<leader>t", desc = "terminal open" }, -- proxy to window mappings

  { "<leader>g", group = "git" }, -- group
  { "<leader>h", group = "harpoon" }, -- group
  { "<leader>hh", desc = "ui" },
  { "<leader>hm", desc = "mark" },
  { "<leader>1", desc = "m1" },
  { "<leader>2", desc = "m2" },
  { "<leader>gc", desc = "git commit" },
  { "<leader>gp", desc = "git push" },
  { "<leader>gl", desc = "git pull" },
  { "<leader>gs", desc = "git status" },
  { "<leader>gd", desc = "git diff" },

  { "<leader>k", desc = "code action" }, -- keymap code action
  { "<leader>q", desc = "close buffer" }, -- keymap code action
  { "<C-M-w>", desc = "save" }, -- keymap code action
  { "<C-M-q>", desc = "save and quit" }, -- keymap code action
})

