return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end, { desc = "Mark file with harpoon" })
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Show harpoon marks" })
      vim.keymap.set("n", "<A-1>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<A-2>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<A-3>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<A-4>", function()
        harpoon:list():select(4)
      end)
      vim.keymap.set("n", "<A-5>", function()
        harpoon:list():select(5)
      end)
    end,
  },
}
