# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a kitty terminal emulator configuration directory (`~/.config/kitty/`). Kitty is configured through plain-text files — no build step, no tests, no package manager.

## Applying Configuration Changes

Kitty reloads its configuration without restarting:

```sh
# Send SIGUSR1 to all running kitty instances
kill -SIGUSR1 $(pgrep kitty)

# Or use kitty's remote control (if enabled)
kitty @ set-colors --all --configured
```

## Key Files

- `kitty.conf` — Main configuration (colors, fonts, keybindings, behavior). Kitty ships with extensive defaults; only values that differ from defaults need to be present.
- `current-theme.conf` — Active color theme, typically included from `kitty.conf` via `include current-theme.conf`.
- `*.conf` — Additional conf files can be included with `include filename.conf`.

## Configuration Syntax

```
# This is a comment
option_name value

# Include another file
include other.conf

# Map a key
map ctrl+shift+t new_tab
```

- Option names are lowercase with underscores.
- Multiword string values do not need quotes.
- Boolean values: `yes` / `no`.
- Colors: hex (`#rrggbb`) or named X11 colors.
- To reset an option to default: `option_name `(empty value).

## Kitty Version

kitty 0.45.0 (installed system-wide via package manager).
