local HOME = os.getenv("HOME")
return {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			markdown = { "markdownlint-cli2" },
		},
		linters = {
			["markdownlint-cli2"] = {
				args = {
					"--config",
					HOME .. "/.markdownlint.yaml",
					"--",
				},
			},
		},
	},
}
