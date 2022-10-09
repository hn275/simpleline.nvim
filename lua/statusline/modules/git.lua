return function()
	local branch = vim.api.nvim_exec("echo gitbranch#name()", true)
	local gitbranch = ""
	if branch == "" then
		gitbranch = "  no brancho "
	else
		gitbranch = "  " .. branch .. " "
	end

	return gitbranch
end
