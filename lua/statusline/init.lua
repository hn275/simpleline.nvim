local mode = require("statusline.modules.modes")
local lsp = require("statusline.modules.lsp")
local gitbranch = require("statusline.modules.git")()

Statusline = {}

Statusline.active = function()
	return table.concat({
		mode.update(),
		mode.mode(),
		mode.invert_update(),
		gitbranch,
		lsp.init(),
		"%=",
		"%m%r%y %t",
		"%=",
		" %l/%L ",
	})
end

Statusline.inactive = function()
	return "%#Statusline# %f"
end
Statusline.short = function()
	return "%#StatusLineNC#   NvimTree"
end

Statusline.setup = function()
	-- set statusline
	vim.api.nvim_exec(
		[[
		  augroup Statusline
		  au!
		  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
		  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
		  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
		  augroup END
		]],
		false
	)
end

return Statusline
