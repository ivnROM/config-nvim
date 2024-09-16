local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local luasnip = require('luasnip')
-- local lspkind = require('lspkind')

-- CONFIGURACION CMP - AUTOCOMPLETE

cmp.setup({
  snippet = {
    expand = function(args)
      -- usa `vsnip` para snippets
      -- vim.fn["vsnip#anonymous"](args.body)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
  },
  window = {
          completion = { border = { '', '', '', '', '', '', '', '' }, winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        winblend = vim.o.pumblend,
        scrolloff = 0,
        col_offset = 0,
        side_padding = 1,
        scrollbar = true,
        max_width = 2,
        max_height = 2,
      },
      documentation = {
        max_height = 20,
        max_width = 40,
        border = { '', '', '', ' ', '', '', '', ' ' },
        winhighlight = 'FloatBorder:NormalFloat',
        winblend = vim.o.pumblend,
      },
      -- completion = cmp.config.window.bordered({
      --     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      --     max_width = 3,  -- Ajustá este valor para reducir el ancho
      --     max_height = 3, -- Ajustá este valor para reducir el alto
      -- }),
      -- documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
},
formatting = {
    fields = { "abbr", "menu", "kind" },
    format = function(entry, item)
        -- Define menu shorthand for different completion sources.
        local menu_icon = {
            nvim_lsp = "NLSP",
            nvim_lua = "NLUA",
            luasnip  = "LSNP",
            buffer   = "BUFF",
            path     = "PATH",
        }
        -- Set the menu "icon" to the shorthand for each completion source.
        item.menu = menu_icon[entry.source.name]

        -- Set the fixed width of the completion menu to 60 characters.
        -- fixed_width = 20

        -- Set 'fixed_width' to false if not provided.
        fixed_width = fixed_width or false

        -- Get the completion entry text shown in the completion window.
        local content = item.abbr

        -- Set the fixed completion window width.
        if fixed_width then
            vim.o.pumwidth = fixed_width
        end

        -- Get the width of the current window.
        local win_width = vim.api.nvim_win_get_width(0)

        -- Set the max content width based on either: 'fixed_width'
        -- or a percentage of the window width, in this case 20%.
        -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
        local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

        -- Truncate the completion entry text if it's longer than the
        -- max content width. We subtract 3 from the max content width
        -- to account for the "..." that will be appended to it.
        if #content > max_content_width then
            item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
        else
            item.abbr = content .. (" "):rep(max_content_width - #content)
        end
        return item
    end,
},
})

-- CONFIGURACION LSPS

-- arreglar esto
-- lsp_zero.ensure_installed({
-- 	'rust_analyzer',
-- })

-- Ajustar el tamaño de la ventana flotante para hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",  -- Estilo del borde
  max_width = 60,       -- Ancho máximo de la ventana flotante
  max_height = 20,      -- Alto máximo de la ventana flotante
})


-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr}

    vim.keymap.set('n', 'S-k', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').jdtls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').clangd.setup({})
