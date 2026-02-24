return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php   = { "pint", "php_cs_fixer" },
      blade = { "blade_formatter" },
    },
    formatters = {
      pint = {
        command = function()
          if vim.fn.executable("./vendor/bin/pint") == 1 then
            return "./vendor/bin/pint"
          end
          return "pint"
        end,
        args = { "$FILENAME" },
        stdin = false,
      },
      php_cs_fixer = {
        command = "php-cs-fixer",
        args = { "fix", "$FILENAME" },
        stdin = false,
      },
      blade_formatter = {
        command = "blade-formatter",
        args = { "--write", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
