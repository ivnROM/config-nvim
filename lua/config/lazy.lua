-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local plugins = {
    -- treesitter se carga cuando se abre cualquier buffer
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" },

    -- theme cargado lazy, solo cuando necesites aplicarlo
    { "blazkowolf/gruber-darker.nvim", lazy = true },

    -- lavish cargado lazy igual que gruber-darker
    { "ferdinandrau/lavish.nvim", lazy = true },

    -- lsp-zero para la configuración de LSP, cargado cuando abres un archivo con un tipo soportado por LSP
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', event = "BufReadPre" },
    { 'neovim/nvim-lspconfig', lazy = true, event = "BufReadPre" },
    { 'hrsh7th/cmp-nvim-lsp', lazy = true },
    { 'hrsh7th/nvim-cmp', lazy = true },

    -- telescope cargado al llamar a :Telescope o abrir el finder con <leader>f
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, cmd = "Telescope" },

    -- lspkind cargado lazy cuando cmp (completions) es requerido
    { 'onsails/lspkind.nvim', lazy = true },

    -- LuaSnip cargado cuando llamás algún comando de snippets
    { "L3MON4D3/LuaSnip", lazy = true },

    -- mason para gestionar servidores lsp, cargado cuando hacés algo relacionado con lsp
    {"williamboman/mason.nvim", event = "BufReadPre" },
    {"williamboman/mason-lspconfig.nvim", lazy = true },

    -- fugitive cargado cuando llamás a un comando relacionado con git
    { "tpope/vim-fugitive", cmd = { "Git", "Gdiffsplit", "Gblame" }, lazy = true },

    -- which-key cargado solo cuando presionás una tecla de líder
    { "folke/which-key.nvim", lazy = true, event = "VeryLazy" },

    -- dap (debugging) cargado cuando se necesite
    { "mfussenegger/nvim-dap", dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-jdtls"
    }, lazy = true, cmd = "DapToggleBreakpoint" },

    -- lackluster cargado cuando se llama al comando respectivo
    { "slugbyte/lackluster.nvim", lazy = true },

    -- poimandres cargado lazy
    { "olivercederborg/poimandres.nvim", lazy = true },

    { "ThePrimeagen/harpoon", lazy = true },

    { "echasnovski/mini.ai", lazy = true},
    -- { "echasnovski/mini.animate", lazy = true},
    -- { "echasnovski/mini.animate", lazy = true},
    { "echasnovski/mini.hipatterns", lazy = true},

}

--
-- Setup lazy.nvim
require("lazy").setup({
    spec = plugins,
    -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false},
})

require("plugins.treesitter")
require("plugins.colors")
require("plugins.lsp")
-- require("plugins.dap")
require("plugins.telescope") 
require("plugins.vim-fugitive")
require("plugins.which-key")
require("plugins.harpoon")
require("plugins.hipatterns")
