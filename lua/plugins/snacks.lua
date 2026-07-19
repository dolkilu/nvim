return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			zen = {
				toggles = {
					dim = false,
					git_signs = false,
					mini_diff_signs = false,
					-- diagnostics = false,
					-- inlay_hints = false,
				},
				center = true, -- center the window
				show = {
					statusline = true, -- can only be shown when using the global statusline
					tabline = true,
				},
			},
		},
	},
}
