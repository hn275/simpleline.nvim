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
	-- Get hl groups colors --
	-- default
	local default_bg = get_rgb("PMenu")
	-- mode
	local accent = get_rgb("Keyword")
	local insert = get_rgb("string")
	local visual = get_rgb("StorageClass")
	local replace = get_rgb("Function")
	local cmd = get_rgb("Visual")
	local terminal = get_rgb("PMenuSel")

	local hl = vim.api.nvim_set_hl
	-- Main --
	hl(0, "StatuslineAccent", { fg = accent.fg, bold = true })
	hl(0, "StatuslineInsertAccent", { fg = insert.bg, bg = insert.fg, bold = true })
	hl(0, "StatuslineVisualAccent", { fg = visual.bg, bg = visual.fg, bold = true })
	hl(0, "StatuslineReplaceAccent", { fg = replace.bg, bg = replace.fg, bold = true })
	hl(0, "StatuslineCmdLineAccent", { fg = cmd.bg, bg = cmd.fg, bold = true })
	hl(0, "StatuslineTerminalAccent", { fg = terminal.bg, bg = terminal.fg, bold = true })

	-- Inverted --
	hl(0, "IAccent", { fg = accent.fg, bg = default_bg.bg })
	hl(0, "IInsertAccent", { fg = insert.fg, bg = default_bg.bg })
	hl(0, "IVisualAccent", { fg = visual.fg, bg = default_bg.bg })
	hl(0, "IReplaceAccent", { fg = replace.fg, bg = default_bg.bg })
	hl(0, "ICmdLineAccent", { fg = cmd.fg, bg = default_bg.bg })
	hl(0, "ITerminalAccent", { fg = terminal.fg, bg = default_bg.bg })

	-- Defining a muted color group
	hl(0, "StatuslineMuted", { bg = default_bg.bg, fg = default_bg.fg })

	-- Tabline
	hl(0, "Tabline", { fg = accent.fg })
	hl(0, "TablineSel", { fg = accent.bg, bg = accent.fg, bold = true })
end

return c
