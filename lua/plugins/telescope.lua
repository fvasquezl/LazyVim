return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        find_command = {
          "fd",
          "--type", "f",
          "--color", "never",
          "--hidden",
          "--follow",
          "-E", ".git",
          "-E", ".idea",
          "-E", ".claude",
          "-E", ".editorconfig",
          "-E", ".gitignore",
          "-E", ".gitattributes",
          "-E", ".php-cs-fixer.cache",
          "-E", ".php-cs-fixer.dist.php",
          "-E", ".env.example",
        },
      },
    },
  },
}
