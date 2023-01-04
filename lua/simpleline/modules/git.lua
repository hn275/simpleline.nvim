local get_git_branch = function()
	local branch = vim.api.nvim_exec("echo FugitiveStatusline()", true)
	local branch_name = branch:gmatch("%((.+)%)")()

	if branch_name ~= nil then
		branch_name = "  " .. branch_name
		return branch_name
	end

	return ""
end

print(get_git_branch())

return get_git_branch
