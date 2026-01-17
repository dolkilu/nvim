return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			-- "saghen/blink.cmp",
		},
		init = function()
			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})
		end,
		opts = {
			servers = {
				svelte = {},
				gopls = {
					settings = {
						gopls = {
							completeUnimported = true,
							usePlaceholders = true,
							analyses = {
								unusedparams = true,
							},
							staticcheck = true,
						},
					},
					-- capabilities = require("blink.cmp").get_lsp_capabilities(), -- uncomment if you use blink.cmp
				},
				phpactor = {},

				["*"] = {
					keys = {
						{
							"gd",
							function()
								vim.lsp.buf.definition()
							end,
							has = "definition",
							desc = "Go to Definition",
						},
						{
							"K",
							function()
								vim.lsp.buf.hover()
							end,
							has = "hover",
							desc = "Hover",
						},
						{
							"<leader>vws",
							function()
								vim.lsp.buf.workspace_symbol()
							end,
							has = "workspaceSymbol",
							desc = "Workspace Symbols",
						},
						{
							"<leader>vca",
							function()
								vim.lsp.buf.code_action()
							end,
							has = "codeAction",
							desc = "Code Action",
						},
						{
							"<leader>vrr",
							function()
								vim.lsp.buf.references()
							end,
							has = "references",
							desc = "References",
						},
						{
							"<leader>vrn",
							function()
								vim.lsp.buf.rename()
							end,
							has = "rename",
							desc = "Rename",
						},
						{
							"<C-h>",
							function()
								vim.lsp.buf.signature_help()
							end,
							has = "signatureHelp",
							desc = "Signature Help",
						},

						{
							"<leader>vd",
							function()
								vim.diagnostic.open_float()
							end,
							desc = "Line Diagnostics",
						},
						{
							"[d",
							function()
								vim.diagnostic.jump({ count = 1, float = true })
							end,
							desc = "Next Diagnostic (float)",
						},
						{
							"]d",
							function()
								vim.diagnostic.jump({ count = -1, float = true })
							end,
							desc = "Prev Diagnostic (float)",
						},
					},
				},
			},
		},
		setup = {
			clangd = function(_, opts)
				local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
				require("clangd_extensions").setup(
					vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
				)
				return false
			end,
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"csharp-language-server",
				"codelldb",
				"gopls",
				"html-lsp",
				"json-lsp",
				"jq",
				"lua-language-server",
				"pyright",
				"qmlls",
				"rust-analyzer",
				"shfmt",
				"stylua",
				"svelte-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",
			},
		},
	},
	{
		"p00f/clangd_extensions.nvim",
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
	},
}
