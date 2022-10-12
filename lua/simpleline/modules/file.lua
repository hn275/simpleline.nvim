local file = {}

file.current = function()
	local file_name = vim.fn.expand("%")
	if file_name == "" then
		return "such empty, much blank"
	end

	return "%t"
end

return file
