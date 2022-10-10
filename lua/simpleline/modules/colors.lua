-- @params {string} hl: Highlight group name to parse for color codes
-- @return {table} rgb: `rgb.bg` and `rgb.fg`
local get_rgb = function(hl)
	-- fallback color
	local rgb = {
		fg = "#f3f3f3",
		bg = "#343434",
	}
	if not hl then
		return rgb
	end

	local hex = vim.api.nvim_get_hl_by_name(hl, true)
	if hex.foreground then
		rgb.fg = "#" .. string.format("%06x", hex.foreground)
	end

	if hex.background then
		rgb.bg = "#" .. string.format("%06x", hex.background)
	end

	return rgb
end

local c = {}

c.colors = function()
	-- Get hl groups colors
	local accent = get_rgb("Keyword")
	local insert = get_rgb("Function")
	local visual = get_rgb("StorageClass")
	local replace = get_rgb("String")
	local cmd = get_rgb("Boolean")
	local terminal = get_rgb("Function")
	local default = get_rgb()

	-- Defining a main color group
	vim.api.nvim_set_hl(0, "StatuslineAccent", { fg = accent.fg, bg = accent.bg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineInsertAccent", { fg = insert.bg, bg = insert.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineVisualAccent", { fg = visual.bg, bg = visual.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", { fg = replace.bg, bg = replace.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", { fg = cmd.bg, bg = cmd.fg, bold = true })
	vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", { fg = terminal.bg, bg = terminal.fg, bold = true })

	-- Defining a inverted color group
	vim.api.nvim_set_hl(0, "IAccent", { fg = accent.fg, bg = default.bg, bold = true })
	vim.api.nvim_set_hl(0, "IInsertAccent", { fg = insert.fg, bg = default.bg, bold = true })
	vim.api.nvim_set_hl(0, "IVisualAccent", { fg = visual.fg, bg = default.bg, bold = true })
	vim.api.nvim_set_hl(0, "IReplaceAccent", { fg = replace.fg, bg = default.bg, bold = true })
	vim.api.nvim_set_hl(0, "ICmdLineAccent", { fg = cmd.fg, bg = default.bg, bold = true })
	vim.api.nvim_set_hl(0, "ITerminalAccent", { fg = terminal.fg, bg = default.bg, bold = true })

	-- Defining a muted color group
	vim.api.nvim_set_hl(0, "StatuslineMuted", { fg = default.bg, fg = default.fg })
end

return c
