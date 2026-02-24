# Neovim — PHP/Laravel Config

LazyVim-based Neovim configuration for PHP/Laravel/Filament development.

## Plugins

### LSP & Language
| Plugin | Descripción |
|--------|-------------|
| `neovim/nvim-lspconfig` | LSP client |
| `intelephense` | PHP LSP (PHP 8.3, stubs completos) |
| `laravel_ls` | Laravel LSP (rutas, modelos, Blade) |
| `tailwindcss-language-server` | Tailwind CSS |
| `emmet-language-server` | Emmet para HTML/Blade |
| `lua-language-server` | Lua con tipos de Neovim API via lazydev.nvim |

### PHP
| Plugin | Descripción |
|--------|-------------|
| `mfussenegger/nvim-lint` | PHPStan level 5 |
| `stevearc/conform.nvim` | Pint + php-cs-fixer (PHP), blade-formatter (Blade), sqlfluff (SQL) |
| `ccaglak/phptools.nvim` | Crear clases, namespaces, getters/setters |

### Laravel & Filament
| Plugin | Descripción |
|--------|-------------|
| `adalessa/laravel.nvim` | Artisan, rutas, vistas, related files |
| `nvim-telescope/telescope.nvim` | Búsqueda de archivos Filament/Laravel |

### Snippets
| Plugin | Descripción |
|--------|-------------|
| `L3MON4D3/LuaSnip` | Motor de snippets |
| `rafamadriz/friendly-snippets` | Snippets generales |
| Snippets custom | Blade, Alpine.js, PHP/Laravel, Filament (resources, forms, tables, widgets, pages, relation managers) |

### Base de datos
| Plugin | Descripción |
|--------|-------------|
| `tpope/vim-dadbod` | Interfaz universal de bases de datos |
| `kristijanhusak/vim-dadbod-ui` | UI visual con auto-detect de Laravel `.env` |
| `kristijanhusak/vim-dadbod-completion` | Autocompletado SQL (via blink.cmp) |
| `kkharji/sqlite.lua` | Soporte SQLite |

### Testing
| Plugin | Descripción |
|--------|-------------|
| `nvim-neotest/neotest` | Framework de testing integrado |
| `V13Axel/neotest-pest` | Adapter Pest con soporte Sail |
| `olimorris/neotest-phpunit` | Adapter PHPUnit |
| `andythigpen/nvim-coverage` | Cobertura de código desde `coverage/clover.xml` |
| `vim-test/vim-test` | Runner alternativo via terminal |

### Debug
| Plugin | Descripción |
|--------|-------------|
| `mfussenegger/nvim-dap` | Debug Adapter Protocol |
| `rcarriga/nvim-dap-ui` | UI de debug (scopes, breakpoints, stacks, watches) |
| `theHamsta/nvim-dap-virtual-text` | Valores de variables inline |
| `Weissle/persistent-breakpoints.nvim` | Breakpoints persistentes entre reinicios |

### Git
| Plugin | Descripción |
|--------|-------------|
| `sindrets/diffview.nvim` | Diff avanzado e historial de archivos |
| `NeogitOrg/neogit` | Interface tipo Magit |
| `akinsho/git-conflict.nvim` | Resolución de conflictos |
| `lewis6991/gitsigns.nvim` | Signs + inline blame activado |
| `f-person/git-blame.nvim` | Blame extendido con URLs de commits |

---

## Opciones destacadas

| Opción | Valor | Efecto |
|--------|-------|--------|
| `leader` | `Space` | Tecla líder |
| `fileencoding` | `utf-8` | Codificación de archivos |
| `number` | `true` | Números de línea |
| `cmdheight` | `0` | Barra de comandos oculta cuando no se usa |
| `laststatus` | `3` | Statusline global única |
| `scrolloff` | `10` | 10 líneas de contexto al hacer scroll |
| `expandtab` | `true` | Tabs → espacios |
| `shiftwidth` / `tabstop` | `2` | Indentación de 2 espacios |
| `wrap` | `false` | Sin salto de línea automático |
| `ignorecase` | `true` | Búsqueda case-insensitive (salvo `/C` o mayúsculas) |
| `inccommand` | `split` | Preview de `:s` en split antes de confirmar |
| `splitbelow` / `splitright` | `true` | Splits abren abajo y a la derecha |
| `mouse` | `""` | Mouse desactivado |
| `shell` | sistema | No se sobreescribe (evita incompatibilidades POSIX) |

**Globals de LazyVim:**
- `lazyvim_php_lsp = "intelephense"` — LSP de PHP
- `lazyvim_picker = "telescope"` — Picker
- `lazyvim_cmp = "blink.cmp"` — Motor de autocompletado
- `lazyvim_prettier_needs_config = true` — Prettier solo si hay config en el proyecto

---

## Autocmds

| Evento | Archivos | Efecto |
|--------|----------|--------|
| `InsertLeave` | `*` | Desactiva modo paste al salir de insert |
| `FileType` | `json`, `jsonc`, `markdown` | `conceallevel = 0` — muestra todos los caracteres sin ocultar sintaxis |

---

## Keymaps

> `<leader>` = Space

### General (`keymaps.lua`)

| Keymap | Modo | Acción |
|--------|------|--------|
| `x`, `<leader>c/C/d/D` | `n/v` | Borrar/cambiar sin afectar el registro |
| `<leader>p/P` | `n/v` | Pegar desde registro `0` (último yank) |
| `+` / `-` | `n` | Incrementar / decrementar número |
| `dw` | `n` | Borrar palabra hacia atrás sin afectar registro |
| `<C-a>` | `n` | Seleccionar todo el archivo |
| `<leader>o/O` | `n` | Nueva línea abajo/arriba sin copiar indentación |
| `<C-m>` | `n` | Jumplist hacia adelante |
| `te` | `n` | Nuevo tab |
| `<tab>` / `<s-tab>` | `n` | Tab siguiente / anterior |
| `ss` / `sv` | `n` | Split horizontal / vertical |
| `sh/sk/sj/sl` | `n` | Moverse entre ventanas |
| `<C-w>` + flechas | `n` | Redimensionar ventana |
| `<C-j>` | `n` | Ir al siguiente diagnóstico |
| `<leader>i` | `n` | Toggle inlay hints |
| `:ToggleAutoformat` | cmd | Toggle autoformato |

### Laravel
| Keymap | Acción |
|--------|--------|
| `<leader>la` | Laravel Artisan |
| `<leader>lr` | Laravel Routes |
| `<leader>lm` | Related file |
| `<leader>lv` | Views |
| `<leader>lc` | PHP Create Class |
| `<leader>ln` | PHP Add Namespace |
| `<leader>lg` | PHP Getters/Setters |
| `<leader>fla` | Telescope: Artisan |
| `<leader>flr` | Telescope: Routes |
| `<leader>flc` | Telescope: Configs |

### Filament
| Keymap | Acción |
|--------|--------|
| `<leader>fFr` | Buscar en `app/Filament/Resources` |
| `<leader>fFp` | Buscar en `app/Filament/Pages` |
| `<leader>fFw` | Buscar en `app/Filament/Widgets` |
| `<leader>fFc` | Buscar en `app/Filament/Clusters` |

### Base de datos
| Keymap | Acción |
|--------|--------|
| `<leader>D` | Toggle Database UI |
| `<leader>df` | Find Database Buffer |
| `<leader>dr` | Rename Database Buffer |
| `<leader>dq` | Last Query Info |

### Testing
| Keymap | Acción |
|--------|--------|
| `<leader>tt` | Run File |
| `<leader>tT` | Run All Test Files |
| `<leader>tr` | Run Nearest |
| `<leader>tl` | Run Last |
| `<leader>ts` | Toggle Summary |
| `<leader>to` | Show Output |
| `<leader>tO` | Toggle Output Panel |
| `<leader>tS` | Stop |
| `<leader>tw` | Toggle Watch |
| `<leader>td` | Debug Nearest |
| `<leader>tc` | Toggle Coverage |
| `<leader>tC` | Coverage Summary |
| `<leader>t.` | Test Nearest (vim-test) |
| `<leader>tf` | Test File (vim-test) |
| `<leader>ta` | Test Suite (vim-test) |
| `<leader>tL` | Test Last (vim-test) |
| `<leader>tv` | Test Visit (vim-test) |

### Debug
| Keymap | Acción |
|--------|--------|
| `<leader>db` | Toggle Breakpoint |
| `<leader>dB` | Breakpoint con condición |
| `<leader>dbs` | Toggle Breakpoint (Persistente) |
| `<leader>dbc` | Limpiar todos los Breakpoints |
| `<leader>dbl` | Breakpoint condicional |
| `<leader>dc` | Continue |
| `<leader>dC` | Run to Cursor |
| `<leader>dg` | Go to Line (sin ejecutar) |
| `<leader>di` | Step Into |
| `<leader>dj` | Down |
| `<leader>dk` | Up |
| `<leader>dl` | Run Last |
| `<leader>do` | Step Out |
| `<leader>dO` | Step Over |
| `<leader>dp` | Pause |
| `<leader>dr` | Toggle REPL |
| `<leader>ds` | Session |
| `<leader>dt` | Terminate |
| `<leader>du` | Toggle DAP UI |
| `<leader>dw` | Widgets |

### Git
| Keymap | Acción |
|--------|--------|
| `<leader>gg` | Neogit |
| `<leader>gc` | Git Commit |
| `<leader>gp` | Git Pull |
| `<leader>gP` | Git Push |
| `<leader>gb` | Git Branches |
| `<leader>gs` | Neogit Split |
| `<leader>gd` | Open Diffview |
| `<leader>gD` | Close Diffview |
| `<leader>gh` | File History |
| `<leader>gH` | Current File History |
| `<leader>gm` | Diff with Main |
| `<leader>gtb` | Toggle Git Blame |
| `<leader>gto` | Open Commit URL |
| `<leader>gtc` | Copy Commit SHA |
| `<leader>gco` | Conflict: Choose Ours |
| `<leader>gct` | Conflict: Choose Theirs |
| `<leader>gcb` | Conflict: Choose Both |
| `<leader>gc0` | Conflict: Choose None |
| `<leader>gcn` | Conflict: Next |
| `<leader>gcp` | Conflict: Previous |
| `<leader>gcl` | Conflict: List |

---

## Snippets disponibles

### Blade
`wire:model` `wire:click` `wire:submit` `@if` `@foreach` `@forelse` `@for` `@while` `@auth` `@guest` `@can` `@section` `@extends` `@yield` `@include` `@component` `@push` `@stack` `@livewire` `@csrf` `@method`

### Alpine.js (en Blade)
`alpine.data` `alpine.show` `alpine.if` `alpine.for` `alpine.on` `alpine.model`

### PHP / Laravel
`route.get` `route.post` `route.put` `route.delete` `route.resource` `route.apiResource` `controller` `model` `migration.create` `migration.table` `validate` `belongsTo` `hasMany` `hasOne` `belongsToMany` `livewire` `factory` `test` `pest.test`

### Filament
`filament.resource` `filament.form.text` `filament.form.textarea` `filament.form.select` `filament.form.toggle` `filament.form.datepicker` `filament.form.repeater` `filament.form.section` `filament.table.text` `filament.table.badge` `filament.table.boolean` `filament.table.image` `filament.action` `filament.widget` `filament.page` `filament.relation`
