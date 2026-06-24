return {
	{
		"catppuccin/nvim",
		enabled = false,
		lazy = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").load()
		end,
		opts = {
			flavor = "mocha",
			integrations = {
				transparent_background = true,
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
	},
	{ "ellisonleao/gruvbox.nvim", enabled = true },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		variant = "moon", -- auto, main, moon, or dawn
		enabled = false,
	},
	-- {
	--   "folke/tokyonight.nvim",
	--   lazy = true,
	--   opts = { style = "moon" },
	-- },
	{ "xiyaowong/transparent.nvim" },
	{
		"atdma/caelestia-nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {}, -- Automatically calls require("caelestia").setup()
		config = function(_, opts)
			require("caelestia").setup(opts)
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
}
