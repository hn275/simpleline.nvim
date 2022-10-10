local lsp = {}

lsp.init = function()
	-- Empty buf
	local file = vim.fn.expand("%")
	if file == "" then
		return ""
	end

	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " " .. count["errors"] .. " "
	end

	if count["warnings"] ~= 0 then
		warnings = " " .. count["warnings"] .. " "
	end

	if count["hints"] ~= 0 then
		hints = " " .. count["hints"] .. " "
	end

	if count["info"] ~= 0 then
		info = " " .. count["info"] .. " "
	end

	local output = errors .. warnings .. hints .. info

	-- No error
	if output == "" then
		return " all gucci "
	end
	return output
end

return lsp
