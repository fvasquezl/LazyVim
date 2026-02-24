-- Detect .blade.php files as 'blade' filetype
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      intelephense = {
        filetypes = { "php", "blade" },
        settings = {
          intelephense = {
            filetypes = { "php", "blade" },
          },
        },
      },
      laravel_ls = {},
      emmet_language_server = {
        filetypes = { "blade", "html", "css", "javascript", "typescript", "vue" },
      },
      tailwindcss = {
        filetypes = {
          "blade",
          "html",
          "css",
          "javascript",
          "typescript",
          "vue",
        },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              blade = "html",
            },
          },
        },
      },
    },
  },
}
