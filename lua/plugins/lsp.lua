return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			-- 'saghen/blink.cmp'
		},
		init = function()
			local lspconfig = require("lspconfig")
			-- local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- lspconfig['lua-ls'].setup({capabilities = capabilities})
			lspconfig.svelte.setup({})
			lspconfig.gopls.setup({
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
			})
			lspconfig.phpactor.setup({
				on_attach = on_attach,
			})
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- change a keymap
			keys[#keys + 1] = {
				"gd",
				function()
					vim.lsp.buf.definition()
				end,
			}
			keys[#keys + 1] = {
				"K",
				function()
					vim.lsp.buf.hover()
				end,
			}
			keys[#keys + 1] = {
				"<leader>vws",
				function()
					vim.lsp.buf.workspace_symbol()
				end,
			}
			keys[#keys + 1] = {
				"<leader>vd",
				function()
					vim.diagnostic.open_float()
				end,
			}
			keys[#keys + 1] = {
				"[d",
				function()
					vim.diagnostic.jump({ count = 1, float = true })
				end,
			}
			keys[#keys + 1] = {
				"]d",
				function()
					vim.diagnostic.jump({ count = -1, float = true })
				end,
			}
			keys[#keys + 1] = {
				"<leader>vca",
				function()
					vim.lsp.buf.code_action()
				end,
			}
			keys[#keys + 1] = {
				"<leader>vrr",
				function()
					vim.lsp.buf.references()
				end,
			}
			keys[#keys + 1] = {
				"<leader>vrn",
				function()
					vim.lsp.buf.rename()
				end,
			}
			keys[#keys + 1] = {
				"<C-h>",
				function()
					vim.lsp.buf.signature_help()
				end,
			}
		end,
		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		}),
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
		"williamboman/mason.nvim",
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
				--"omnisharp-mono",
				"pyright",
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
