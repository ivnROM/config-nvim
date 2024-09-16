vim.g.terminal_color_0 = "#000000"  -- fondo negro
vim.g.terminal_color_7 = "#ffffff"  -- texto blanco (opcional)

function open_floating_terminal()
    local width = math.floor(vim.o.columns * 0.8)  -- 80% del ancho de la pantalla
    local height = math.floor(vim.o.lines * 0.5)   -- 50% del alto de la pantalla

    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "single",
    })

    vim.cmd("terminal")
    vim.cmd("startinsert")

    vim.wo.relativenumber = false
    vim.wo.number = false
    vim.bo.buflisted = false
end

vim.cmd([[
  augroup TerminalConfig
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]])

return { open_floating_terminal = open_floating_terminal }

