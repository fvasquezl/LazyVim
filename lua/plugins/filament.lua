return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  keys = {
    {
      "<leader>fFr",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() .. "/app/Filament/Resources" })
      end,
      desc = "Find Filament Resources",
    },
    {
      "<leader>fFp",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() .. "/app/Filament/Pages" })
      end,
      desc = "Find Filament Pages",
    },
    {
      "<leader>fFw",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() .. "/app/Filament/Widgets" })
      end,
      desc = "Find Filament Widgets",
    },
    {
      "<leader>fFc",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() .. "/app/Filament/Clusters" })
      end,
      desc = "Find Filament Clusters",
    },
  },
}
