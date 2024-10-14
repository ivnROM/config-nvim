function Colorify(color)
	-- color = color or "gruber-darker"
	-- color = color or "lavish-dark"
	-- color = color or "lackluster"
	color = color or "poimandres"
	vim.cmd.colorscheme(color)
end

Colorify()
