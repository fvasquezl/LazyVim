return {
  -- Diffview: Advanced diff viewer
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>",                    desc = "Open Diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>",                   desc = "Close Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>",             desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>",           desc = "Current File History" },
      { "<leader>gm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diff with Main" },
    },
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,
      watch_index = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = { diff_merges = "combined" },
            multi_file  = { diff_merges = "first-parent" },
          },
        },
        win_config = { position = "bottom", height = 16 },
      },
      keymaps = { disable_defaults = false },
    },
  },

  -- Neogit: Magit-like Git interface
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg",  "<cmd>Neogit<cr>",                      desc = "Neogit" },
      { "<leader>gc",  "<cmd>Neogit commit<cr>",               desc = "Git Commit" },
      { "<leader>gp",  "<cmd>Neogit pull<cr>",                 desc = "Git Pull" },
      { "<leader>gP",  "<cmd>Neogit push<cr>",                 desc = "Git Push" },
      { "<leader>gb",  "<cmd>Telescope git_branches<cr>",      desc = "Git Branches" },
      { "<leader>gs",  "<cmd>Neogit kind=split<cr>",           desc = "Neogit Split" },
    },
    opts = {
      graph_style = "unicode",
      git_services = {
        ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
        ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
      },
      telescope_sorter = function()
        local ok, fzf = pcall(function() return require("telescope").extensions.fzf end)
        if ok and fzf then return fzf.native_fzf_sorter() end
        return nil
      end,
      remember_settings = true,
      use_per_project_settings = true,
      auto_refresh = true,
      sort_branches = "-committerdate",
      kind = "tab",
      disable_line_numbers = true,
      notification_icon = "󰊢",
      status = { recent_commit_count = 10 },
      commit_editor = { kind = "auto", show_staged_diff = true },
      commit_view  = { kind = "vsplit", verify_commit = vim.fn.executable("gpg") == 1 },
      log_view     = { kind = "tab" },
      integrations = { telescope = true, diffview = true },
      sections = {
        untracked = { folded = false },
        unstaged  = { folded = false },
        staged    = { folded = false },
        stashes   = { folded = true },
        unpulled  = { folded = true },
        unmerged  = { folded = false },
        recent    = { folded = true },
      },
    },
  },

  -- Git Conflict: Better conflict resolution
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "BufReadPre",
    opts = {
      default_mappings = true,
      default_commands = true,
      disable_diagnostics = false,
      list_opener = "copen",
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    },
    keys = {
      { "<leader>gco", "<cmd>GitConflictChooseOurs<cr>",   desc = "Conflict: Choose Ours" },
      { "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Conflict: Choose Theirs" },
      { "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>",   desc = "Conflict: Choose Both" },
      { "<leader>gc0", "<cmd>GitConflictChooseNone<cr>",   desc = "Conflict: Choose None" },
      { "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", desc = "Conflict: Next" },
      { "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", desc = "Conflict: Previous" },
      { "<leader>gcl", "<cmd>GitConflictListQf<cr>",       desc = "Conflict: List" },
    },
  },

  -- Gitsigns: Override LazyVim defaults (inline blame enabled)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text     = true,
        virt_text_pos = "eol",
        delay         = 500,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },

  -- Git Blame: Extended blame with commit URLs
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
    opts = {
      enabled = true,
      message_template    = " <author> • <date> • <summary>",
      date_format         = "%Y-%m-%d %H:%M",
      virtual_text_column = 80,
    },
    keys = {
      { "<leader>gtb", "<cmd>GitBlameToggle<cr>",        desc = "Toggle Git Blame" },
      { "<leader>gto", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit URL" },
      { "<leader>gtc", "<cmd>GitBlameCopySHA<cr>",       desc = "Copy Commit SHA" },
    },
  },
}
