return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
					sort = {
						{ "type", "asc" },
						{ "name", "asc" },
					},
				},
			})
			-- Open parent directory in current window
			vim.keymap.set("n", "<Space>fo", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			-- Open parent directory in floating window
			vim.keymap.set("n", "<Space>fO", require("oil").toggle_float, { desc = "Open parent dir float" })
		end,
	},
}
