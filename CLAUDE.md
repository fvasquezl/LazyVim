# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

LazyVim configuration for PHP/Laravel development. Active config at `~/.config/nvim`. The `nvim.bak/` sibling directory is the previous config — migration is complete, do not add more from it.

## Architecture

- `init.lua` — sole entry point; calls `require("config.lazy")`
- `lua/config/lazy.lua` — bootstraps lazy.nvim; LazyVim core → extras → user plugins must stay in this order
- `lua/config/options.lua` / `keymaps.lua` / `autocmds.lua` — loaded automatically by LazyVim
- `lua/plugins/` — one `.lua` file per concern; every file is auto-imported by lazy.nvim
- `lazyvim.json` — enabled LazyVim extras (edit via `:LazyExtras`, not manually)
- `lazy-lock.json` — commit this to pin plugin versions

`lua/plugins/example.lua` is guarded by `if true then return {} end` — inert documentation, not live config.

## LazyVim extras enabled

Declared in `lua/config/lazy.lua`:
- `lazyvim.plugins.extras.coding.luasnip`

## Plugin files

| File | Purpose |
|------|---------|
| `lua.lua` | lazydev.nvim (Neovim API types); lua_ls with `vim` global and `checkThirdParty = false` |
| `lsp.lua` | Blade filetype detection; intelephense (php+blade), laravel_ls, tailwindcss, emmet_language_server |
| `php.lua` | Mason: intelephense/phpstan/php-cs-fixer; intelephense settings (PHP 8.3, stubs, maxSize); nvim-lint/phpstan level 5 |
| `treesitter.lua` | Ensures php, phpdoc, html, css, javascript, blade parsers |
| `formatting.lua` | conform.nvim: pint + php_cs_fixer (PHP), blade_formatter (blade), sqlfluff (SQL) |
| `laravel.lua` | adalessa/laravel.nvim (`<leader>l*`); ccaglak/phptools.nvim (`<leader>lc/ln/lg`); Telescope Laravel keymaps (`<leader>fl*`) |
| `filament.lua` | Telescope keymaps for Filament dirs (`<leader>fF*`) |
| `snippets.lua` | LuaSnip custom snippets: Blade directives, Alpine.js, PHP/Laravel patterns, Filament resources/forms/tables |
| `database.lua` | vim-dadbod-ui (`<leader>D/df/dr/dq`); Laravel .env auto-detect; blink.cmp dadbod source; sqlfluff via Mason |
| `git.lua` | diffview.nvim (`<leader>gd/gD/gh/gH/gm`); neogit (`<leader>gg/gc/gp/gP`); git-conflict (`<leader>gc*`); gitsigns (inline blame on); git-blame.nvim (`<leader>gt*`) |
| `debug.lua` | nvim-dap + dapui + nvim-dap-virtual-text + persistent-breakpoints; PHP/Xdebug adapter; configs for Sail/Docker, legacy port 9000, artisan, phpunit, pest (`<leader>d*`) |
| `testing.lua` | neotest + neotest-pest (Sail-aware) + neotest-phpunit (`<leader>t*`); nvim-coverage (`<leader>tc/tC`); vim-test (`<leader>tf/ta/tL/tv`) |

## Key conventions

- **Import order in `lazy.lua`**: `lazyvim.plugins` → `lazyvim.plugins.extras.*` → `{ import = "plugins" }`. Violating this triggers a LazyVim warning.
- **LazyVim extras** must be declared in `lua/config/lazy.lua`, not inside `lua/plugins/` files.
- **opts merging**: multiple specs for the same plugin are deep-merged by lazy.nvim — safe to split settings across files (e.g. intelephense is configured in both `lsp.lua` and `php.lua`).
- **Pint**: uses `./vendor/bin/pint` when present, falls back to global `pint`.
- **Xdebug path mappings**: use `vim.fn.getcwd()` — never `${workspaceFolder}` (VS Code variable, not resolved by nvim-dap).

## Formatting

Lua files: `stylua lua/` (2-space indent, 120-column — see `stylua.toml`).

## Mason tools managed automatically

`php-debug-adapter`, `intelephense`, `phpstan`, `php-cs-fixer`, `blade-formatter`, `sqlfluff`
