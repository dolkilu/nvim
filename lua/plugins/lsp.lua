return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local lspconfig = require("lspconfig")
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
          vim.diagnostic.goto_next()
        end,
      }
      keys[#keys + 1] = {
        "]d",
        function()
          vim.diagnostic.goto_prev()
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
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<S-Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "copilot" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
}
