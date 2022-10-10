local hl = vim.api.nvim_set_hl
local tab = {}

tab.update = function(mode)
	if mode == "n" then -- normal
		hl("TablineSel", {})
	elseif mode == "i" then -- insert
		hl("TablineSel", {})
	elseif mode == "v" then -- visual
		hl("TablineSel", {})
	elseif mode == "R" then -- replace
		hl("TablineSel", {})
	elseif mode == "c" then -- command
		hl("TablineSel", {})
	elseif mode == "t" then -- terminal
		hl("TablineSel", {})
	end
end

return tab
