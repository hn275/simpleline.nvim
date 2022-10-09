local get_rgb = function(hl)
	local hex = vim.api.nvim_get_hl_by_name(hl, true)
	local rgb = {}

	if hex.foreground then
		rgb.fg = "#" .. string.format("%06x", hex.foreground)
	else
		rgb.fg = "#ffffff"
	end

	if hex.background then
		rgb.bg = ("#" .. string.format("%06x", hex.background)) or "#ffffff"
	else
		rgb.bg = "#000000"
	end

	return rgb
end

local c = {}

c.colors = function()
	-- Get hl groups colors
	local accent = get_rgb("Keyword")
	local insert = get_rgb("String")
	local visual = get_rgb("Conditional")
	local replace = get_rgb("Normal")
	local cmd = get_rgb("Boolean")
	local terminal = get_rgb("Function")
	local background = {
		fg = "#ffffff",
		bg = "#343434",
	}

	-- Defining a main color group
	-- vim.api.nvim_set_hl(0, "Statusline", { fg = background.fg, bg = background.bg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineAccent", { fg = accent.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineInsertAccent", { fg = insert.bg, bg = insert.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineVisualAccent", { fg = visual.bg, bg = visual.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", { fg = replace.bg, bg = replace.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", { fg = cmd.bg, bg = cmd.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", { fg = terminal.bg, bg = terminal.fg, bold = true })

	-- Defining a Invert color group
	vim.api.nvim_set_hl(0, "IAccent", { fg = background.bg, bg = accent.fg, bold = true })
	vim.api.nvim_set_hl(0, "IInsertAccent", { fg = background.bg, bg = accent.fg, bold = true })
	vim.api.nvim_set_hl(0, "IVisualAccent", { fg = background.bg, bg = accent.fg, bold = true })
	vim.api.nvim_set_hl(0, "IReplaceAccent", { fg = background.bg, bg = accent.fg, bold = true })
	vim.api.nvim_set_hl(0, "ICmdLineAccent", { fg = background.bg, bg = accent.fg, bold = true })
	vim.api.nvim_set_hl(0, "ITerminalAccent", { fg = background.fg, bg = accent.fg, bold = true })
end

return c
