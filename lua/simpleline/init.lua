local mode = require("simpleline.modules.modes")
local lsp = require("simpleline.modules.lsp")
local gitbranch = require("simpleline.modules.git")
local file = require("simpleline.modules.file")

Statusline = {}

Statusline.active = function()
	return table.concat({
		mode.update(),
		mode.mode(),
		mode.sep_update(),
		mode.invert_update(),
		gitbranch(),
		lsp.init(),
		"%=",
		mode.invert_update(),
		file.current(),
		" [%l:%L]",
	})
end

Statusline.inactive = function()
	return "%#StatuslineMuted# %f"
end

Statusline.tree = function()
	return "Tree"
end

Statusline.setup = function()
	local simplelineGroup = vim.api.nvim_create_augroup("SimpleLineGr", { clear = true })

	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		group = simplelineGroup,
		callback = function()
			vim.cmd([[setlocal statusline=%!v:lua.Statusline.active()]])
		end,
	})

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		group = simplelineGroup,
		callback = function()
			vim.cmd([[setlocal statusline=%!v:lua.Statusline.inactive()]])
		end,
	})

	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		pattern = { "NvimTree_1" },
		group = simplelineGroup,
		callback = function()
			vim.cmd([[setlocal statusline=%#StatuslineAccent#\ ]])
		end,
	})

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		pattern = { "NvimTree_1" },
		group = simplelineGroup,
		callback = function()
			vim.cmd([[setlocal statusline=%#StatuslineMuted#\ ]])
		end,
	})
end

return Statusline
