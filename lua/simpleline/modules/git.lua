return function()
	local branch = vim.api.nvim_exec("echo FugitiveStatusline()", true)
	local branch_name = branch:gmatch("%((%a+)%)")()

	if branch_name ~= nil then
		branch_name = "  " .. branch_name
	end

	return branch_name or ""
end
