local lsp = {}

lsp.init = function()
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
		-- TODO: map colors
		-- errors = " %#LspDiagnosticsSignError# " .. count["errors"] .. " "
		errors = "  " .. count["errors"] .. " "
	end
	if count["warnings"] ~= 0 then
		-- warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"] .. " "
		warnings = "  " .. count["warnings"] .. " "
	end
	if count["hints"] ~= 0 then
		-- hints = " %#LspDiagnosticsSignHint# " .. count["hints"] .. " "
		hints = "  " .. count["hints"] .. " "
	end
	if count["info"] ~= 0 then
		-- info = " %#LspDiagnosticsSignInformation# " .. count["info"] .. " "
		info = "  " .. count["info"] .. " "
	end

	return errors .. warnings .. hints .. info
end

return lsp
