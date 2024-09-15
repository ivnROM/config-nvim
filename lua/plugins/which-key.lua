-- configuracion basica para which-key
require("which-key").setup {
    -- aca podés meter config general si querés, como el delay
    plugins = {
        spelling = { enabled = true }, -- ejemplo para corrección de texto
    },
    win = {
        border = "single", -- bordes alrededor de la ventana de which-key
    },
}

-- definicion de los mapeos
local wk = require("which-key")

-- grupo de keybindings para <leader> (que es \ por defecto)
wk.register({
    f = {
        name = "file", -- nombre para agrupar bajo <leader>f
        f = { "<cmd>Telescope find_files<cr>", "buscar archivos" },
        r = { "<cmd>Telescope oldfiles<cr>", "archivos recientes" },
        n = { "<cmd>enew<cr>", "nuevo archivo" },
    },
    b = {
        name = "buffer", -- nombre para agrupar bajo <leader>b
        n = { "<cmd>bnext<cr>", "next buffer" },
        p = { "<cmd>bprevious<cr>", "prev buffer" },
        d = { "<cmd>bd<cr>", "close buffer" },
    },
    g = {
        name = "git", -- nombre para agrupar bajo <leader>g
        s = { "<cmd>Git status<cr>", "git status" },
        p = { "<cmd>Git push<cr>", "git push" },
        l = { "<cmd>Git log<cr>", "git log" },
    },
}, { prefix = "<leader>" }) -- aca le decís que todo está bajo <leader>

