return {
  -- Dadbod UI: Visual database interface
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>D",  "<cmd>DBUIToggle<cr>",        desc = "Toggle Database UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>",    desc = "Find Database Buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>",  desc = "Rename Database Buffer" },
      { "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts          = 1
      vim.g.db_ui_show_database_icon      = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position            = "left"
      vim.g.db_ui_winwidth                = 40
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_execute_on_save         = 0
      vim.g.db_ui_save_location           = vim.fn.stdpath("data") .. "/dadbod_ui"

      vim.g.db_ui_table_helpers = {
        mysql = {
          Count   = "select count(*) from {table}",
          Explain = "EXPLAIN {last_query}",
        },
        sqlite = {
          Count = "select count(*) from {table}",
        },
        postgresql = {
          Count   = "select count(*) from {table}",
          Explain = "EXPLAIN ANALYZE {last_query}",
        },
      }

      vim.g.db_ui_icons = {
        expanded = {
          db           = "▾ ",
          buffers      = "▾ ",
          saved_queries = "▾ ",
          schemas      = "▾ ",
          schema       = "▾ פּ",
          tables       = "▾ 藺",
          table        = "▾ ",
        },
        collapsed = {
          db           = "▸ ",
          buffers      = "▸ ",
          saved_queries = "▸ ",
          schemas      = "▸ ",
          schema       = "▸ פּ",
          tables       = "▸ 藺",
          table        = "▸ ",
        },
        saved_query      = "",
        new_query        = "璘",
        tables           = "離",
        buffers          = "﬘",
        add_connection   = "",
        connection_ok    = "✓",
        connection_error = "✕",
      }
    end,
    config = function()
      -- Auto-detect Laravel .env database connection
      local function setup_laravel_db()
        local env_file = vim.fn.getcwd() .. "/.env"
        if vim.fn.filereadable(env_file) == 0 then return end

        local connection = vim.fn.getenv("DB_CONNECTION") or "mysql"
        local host       = vim.fn.getenv("DB_HOST")       or "127.0.0.1"
        local port       = vim.fn.getenv("DB_PORT")       or "3306"
        local database   = vim.fn.getenv("DB_DATABASE")   or ""
        local username   = vim.fn.getenv("DB_USERNAME")   or "root"
        local password   = vim.fn.getenv("DB_PASSWORD")   or ""

        if database == "" then return end

        local url = ""
        if connection == "mysql" then
          url = string.format("mysql://%s:%s@%s:%s/%s", username, password, host, port, database)
        elseif connection == "pgsql" then
          url = string.format("postgresql://%s:%s@%s:%s/%s", username, password, host, port, database)
        elseif connection == "sqlite" then
          url = "sqlite:" .. database
        end

        if url ~= "" then
          vim.g.dbs = vim.g.dbs or {}
          vim.g.dbs["Laravel_" .. database] = url
        end
      end

      setup_laravel_db()

      vim.api.nvim_create_autocmd("DirChanged", {
        callback = setup_laravel_db,
      })
    end,
  },

  -- blink.cmp: add dadbod as a completion source
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dadbod" },
        providers = {
          dadbod = {
            name   = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
        },
      },
    },
  },

  -- SQLite support
  { "kkharji/sqlite.lua", lazy = true },

  -- Mason: sqlfluff
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "sqlfluff" })
    end,
  },

  -- Conform: SQL formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
      },
    },
  },
}
