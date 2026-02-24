return {
  {
    "ccaglak/phptools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lc", ":PhpTools create<cr>",    desc = "PHP Create Class" },
      { "<leader>ln", ":PhpTools namespace<cr>", desc = "PHP Add Namespace" },
      { "<leader>lg", ":PhpTools getset<cr>",    desc = "PHP Getters/Setters" },
    },
    opts = {
      ui = true,
      custom_toggles = {
        ["config"]   = "config/",
        ["routes"]   = "routes/",
        ["database"] = "database/",
      },
    },
  },

  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm" },
    event = { "VeryLazy" },
    keys = {
      { "<leader>la",  ":Laravel artisan<cr>",                  desc = "Artisan" },
      { "<leader>lr",  ":Laravel routes<cr>",                   desc = "Routes" },
      { "<leader>lm",  ":Laravel related<cr>",                  desc = "Related file" },
      { "<leader>lv",  ":Laravel views<cr>",                    desc = "Views" },
      { "<leader>fla", "<cmd>Telescope laravel artisan<cr>",    desc = "Telescope: Artisan" },
      { "<leader>flr", "<cmd>Telescope laravel routes<cr>",     desc = "Telescope: Routes" },
      { "<leader>flc", "<cmd>Telescope laravel configs<cr>",    desc = "Telescope: Configs" },
    },
    opts = {
      lsp_server = "intelephense",
      route_info = {
        position    = "right",
        middlewares = true,
      },
    },
  },
}
