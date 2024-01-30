return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  extensions = { "harpoon" },
  keys = {
    { "n", "<leader>pf", require("telescope.builtin").find_files, { desc = "Search all" } },
    { "n", "<C-p>", require("telescope.builtin").git_files, { desc = "Search git files" } },
    {
      "n",
      "<leader>ps",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      { desc = "Grep search" },
    },
    { "n", "<leader>vh", require("telescope.builtin").help_tags, { desc = "Telescope help" } },
  },
}
