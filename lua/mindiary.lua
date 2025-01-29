local M = {}

M.config = {
	diary_save_dir = "~",
}

local function today()
	vim.fn.mkdir(M.config.diary_save_dir, "p")
	vim.api.nvim_set_current_dir(M.config.diary_save_dir)

	local diarybuf = vim.api.nvim_create_buf(true, false)
	vim.api.nvim_set_current_buf(diarybuf)

	local todayfile = os.date("%Y%m%d") .. ".txt"

	vim.cmd("e " .. todayfile)

	-- vim.api.nvim_buf_set_name(diarybuf, todaystr)
	-- vim.api.nvim_buf_set_lines(diarybuf, 0, -1, false, { "aaaa", "bbb" })
end

M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})

	vim.api.nvim_create_user_command("MinDiaryToday", today, {})
end

return M
