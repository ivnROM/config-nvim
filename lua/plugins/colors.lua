function Colorify(color)
	-- color = color or "gruber-darker"
	color = color or "lavish-dark"
	vim.cmd.colorscheme(color)
end

Colorify()
