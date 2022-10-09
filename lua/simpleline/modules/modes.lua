local c = require("simpleline.modules.colors")
local M = {}

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	[""] = "V-BLOCK",
	["s"] = "SELECT",
	["S"] = "S-LINE",
	[""] = "S-BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["c"] = "CMD",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERM",
}

M.mode = function()
	local current_mode = vim.api.nvim_get_mode().mode
	if modes[current_mode] == nil then
		return " BRUH "
	end
	return " " .. modes[current_mode] .. " "
end

M.update = function()
	c.colors()

	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = ""
	if current_mode == "n" then
		mode_color = "%#StatuslineAccent#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatuslineInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#StatuslineVisualAccent#"
	elseif current_mode == "R" then
		mode_color = "%#StatuslineReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#StatuslineCmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#StatuslineTerminalAccent#"
	end
	return mode_color
end

M.invert_update = function()
	c.colors()

	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = ""
	if current_mode == "n" then
		mode_color = "%#IAccent#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#IInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#IVisualAccent#"
	elseif current_mode == "R" then
		mode_color = "%#IReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#ICmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#ITerminalAccent#"
	end
	return mode_color
end

return M
