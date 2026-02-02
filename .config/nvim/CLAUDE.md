# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal Neovim configuration built with Lua, using Lazy.nvim plugin manager. Organized under `lua/erinjkim/` namespace.

## Architecture

- `init.lua`: Entry point that loads core configuration and lazy plugin manager
- `lua/erinjkim/core/options.lua`: Vim options (2-space tabs, relative line numbers, etc.)
- `lua/erinjkim/core/keymaps.lua`: Global keymaps (leader key is Space)
- `lua/erinjkim/lazy.lua`: Lazy.nvim plugin manager setup
- `lua/erinjkim/plugins/`: Plugin configurations (one file per plugin)
- `lua/erinjkim/plugins/lsp/`: LSP-related plugins (lspconfig.lua)

### LSP & Formatting

- **Mason** manages LSP servers: `ts_ls`, `lua_ls`, `intelephense`, `tailwindcss`
- **conform.nvim** handles formatting (format on save enabled):
  - JS/TS/CSS/HTML/JSON/YAML/Markdown: prettier
  - Lua: stylua
  - PHP: pint
  - Python: isort + black
- **nvim-lint**: eslint_d (JS/TS), pylint (Python)

## Key Mappings

### General

- `jk`: Exit insert mode
- `<CR>`: Change word under cursor
- `<leader>nh`: Clear search highlights
- `<leader>s`: Search and replace current word
- `<leader>+/-`: Increment/decrement number
- `<leader>cf`: Close all floating windows
- `<leader>tw`: Toggle line wrap
- `J`/`K` (visual): Move selected lines up/down

### File Navigation (Telescope)

- `<leader>ff`: Find files
- `<leader>fs`: Live grep
- `<leader>fc`: Grep string under cursor
- `<leader>ft`: Find todos
- `<leader>fR`: Recent files
- `<leader>fr`: Resume last search

### File Explorer (nvim-tree)

- `<leader>ee`: Toggle file explorer
- `<leader>ef`: Find current file in explorer
- `<leader>ec`: Collapse explorer
- `<leader>er`: Refresh explorer

### Harpoon (quick file access)

- `<leader>a`: Mark file
- `<C-p>`: Toggle quick menu
- `<leader>h/j/k/l`: Navigate to marked files 1-4

### LSP (buffer-local when attached)

- `gd`/`gD`: Go to definition/declaration
- `gr`: Go to references
- `gI`: Go to implementation
- `<leader>D`: Type definition
- `<leader>ds`: Document symbols
- `<leader>ws`: Workspace symbols
- `<leader>rn`: Rename symbol
- `<leader>ca`: Code action
- `<leader>th`: Toggle inlay hints
- `[d`/`]d`: Previous/next diagnostic
- `<leader>e`: Show diagnostic float
- `<leader>q`: Open diagnostic quickfix

### Trouble (diagnostics)

- `<leader>xw`: Workspace diagnostics
- `<leader>xd`: Document diagnostics
- `<leader>xq`: Quickfix list
- `<leader>xl`: Location list
- `<leader>xt`: Todos

### Window/Tab Management

- `<leader>sv/sh`: Split vertically/horizontally
- `<leader>se`: Equalize splits
- `<leader>sx`: Close split
- `<leader>to/tx/tn/tp/tf`: Tab new/close/next/prev/current-to-new

### Formatting & Linting

- `<leader>mp`: Manual format (normal or visual mode)
- `<leader>l`: Trigger linting

### Git (Fugitive)

- `<leader>gg`: Git status
- `<leader>gp`: Git push
- `<leader>gl`: Git pull
- `<leader>gB`: Git blame

### Session Management

- `<leader>sr`: Restore session
- `<leader>ss`: Save session

### Treesitter

- `<C-s>`: Start/expand incremental selection
- `<bs>`: Shrink selection

### Tmux Navigation

- `<C-h/j/k/l>`: Navigate between vim/tmux panes

## Testing Changes

1. Restart Neovim or `:source %` on modified files
2. `:Lazy` - check plugin status
3. `:Mason` - manage LSP servers
4. `:checkhealth` - diagnose issues

