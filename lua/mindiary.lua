local M = {}

M.config = {
	message = "hello world",
}

M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})

	vim.api.nvim_create_user_command("HelloMessage", function()
		print(M.config.message)
	end, {})

	vim.api.nvim_create_user_command("DiaryBufferCreate", function()
		local diarybuf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_name(diarybuf, "Diary")
		vim.api.nvim_buf_set_lines(diarybuf, 0, -1, false, { "aaaa", "bbb" })
	end, {})
end

return M
