return {
  -- Mason: ensure PHP tools are installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "intelephense",
        "phpstan",
        "php-cs-fixer",
      })
    end,
  },

  -- Intelephense: extended settings (merged with lsp.lua)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
              format = {
                enable = false, -- usar Laravel Pint
              },
              environment = {
                phpVersion = "8.3",
              },
              completion = {
                fullyQualifyGlobalConstantsAndFunctions = true,
                insertUseDeclaration = true,
                triggerParameterHints = true,
              },
              diagnostics = {
                enable = true,
              },
              stubs = {
                "apache", "bcmath", "Core", "curl", "date", "dom",
                "fileinfo", "filter", "gd", "hash", "json", "libxml",
                "mbstring", "mysqli", "mysqlnd", "openssl", "pcre",
                "PDO", "pdo_mysql", "Phar", "redis", "Reflection",
                "session", "SimpleXML", "soap", "sockets", "sodium",
                "SPL", "standard", "tokenizer", "xml", "xmlreader",
                "xmlwriter", "zip", "zlib",
              },
            },
          },
        },
      },
    },
  },

  -- nvim-lint: PHPStan
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
      linters = {
        phpstan = {
          cmd = "phpstan",
          args = {
            "analyse",
            "--error-format=json",
            "--no-progress",
            "--level=5",
            "--memory-limit=2G",
          },
        },
      },
    },
  },
}
