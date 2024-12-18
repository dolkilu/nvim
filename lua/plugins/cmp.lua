return {
  { "rafamadriz/friendly-snippets" },
  {
    "nvim-cmp",
    version = false,
    enabled = true,
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      if LazyVim.has("nvim-snippets") then
        table.insert(opts.sources, { name = "snippets" })
      end
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            return LazyVim.cmp.expand(args.body)
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
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "path" },
          -- { name = "copilot" },
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
        table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores")),

        -- table.insert(opts.sources, 1, {
        --   name = "copilot",
        --   group_index = 1,
        --   priority = 100,
        -- }),
      }
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
    },
    enabled = false,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = {
        preset = "default",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_and_accept", "fallback" },
        ["<S-CR>"] = { "accept", "fallback" },
        --  --   -- show with a list of providers
        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },
        --
        --   -- note that your function will often be run in a "fast event" where most vim.api functions will throw an error
        --   -- you may want to wrap your function in `vim.schedule` or use `vim.schedule_wrap`
        --   ['<C-space>'] = { function(cmp) vim.schedule(function() your_behavior end) },
        --
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        -- default = { "lsp", "path", "snippets", "buffer", "copilot" },
        -- cmdline = {},
      },
      -- providers = {
      --   name = "copilot",
      --   module = "blink-cmp-copilot",
      --   kind = "Copilot",
      --   score_offset = 100,
      --   async = true,
      --   },
      -- signature = { enabled = true }
    },
    opts_extend = { "sources.default" },
  },
}
