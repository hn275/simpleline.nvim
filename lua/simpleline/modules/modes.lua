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
		return " N "
	end
	-- return modes[current_mode]
	return " " .. string.upper(current_mode) .. " "
end

M.update = function()
	c.colors()

	local current_mode = vim.api.nvim_get_mode().mode
	if current_mode == "i" or current_mode == "ic" then
		return "%#StatuslineInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		return "%#StatuslineVisualAccent#"
	elseif current_mode == "R" then
		return "%#StatuslineReplaceAccent#"
	elseif current_mode == "c" then
		return "%#StatuslineCmdLineAccent#"
	elseif current_mode == "t" then
		return "%#StatuslineTerminalAccent#"
	end
	return "%#StatuslineAccent#"
end

M.sep_update = function()
	c.colors()

	local current_mode = vim.api.nvim_get_mode().mode
	local mode_color = ""
	if current_mode == "n" then
		mode_color = "%#StatuslineSepAccent#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatuslineSepInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#StatuslineSepVisualAccent#"
	elseif current_mode == "R" then
		mode_color = "%#StatuslineSepReplaceAccent#"
	elseif current_mode == "c" then
		mode_color = "%#StatuslineSepCmdLineAccent#"
	elseif current_mode == "t" then
		mode_color = "%#StatuslineSepTerminalAccent#"
	end
	return mode_color
end

M.invert_update = function()
	c.colors()

	local current_mode = vim.api.nvim_get_mode().mode
	if current_mode == "i" or current_mode == "ic" then
		return "%#IInsertAccent#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		return "%#IVisualAccent#"
	elseif current_mode == "R" then
		return "%#IReplaceAccent#"
	elseif current_mode == "c" then
		return "%#ICmdLineAccent#"
	elseif current_mode == "t" then
		return "%#ITerminalAccent#"
	end
	return "%#IAccent#"
end

return M
