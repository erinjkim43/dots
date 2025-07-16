# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Neovim configuration built with Lua, using the Lazy.nvim plugin manager. The configuration is organized in a modular structure under the `lua/erinjkim/` namespace.

## Architecture

### Core Structure
- `init.lua`: Entry point that loads core configuration and lazy plugin manager
- `lua/erinjkim/core/`: Core Neovim configuration
  - `init.lua`: Loads options and keymaps
  - `options.lua`: Vim options (tabs, search, appearance, etc.)
  - `keymaps.lua`: Global keymaps and leader key configuration
- `lua/erinjkim/lazy.lua`: Lazy.nvim plugin manager setup and configuration
- `lua/erinjkim/plugins/`: Plugin configurations (each plugin in its own file)

### Plugin Management
Uses Lazy.nvim for plugin management with automatic plugin loading from:
- `lua/erinjkim/plugins/` directory
- `lua/erinjkim/plugins/lsp/` directory for LSP-related plugins

### Key Configuration Details

#### Leader Key
- Space (`" "`) is set as the leader key

#### LSP Configuration
- Uses Mason for LSP server management
- Configured language servers: TypeScript (`ts_ls`), Lua (`lua_ls`), PHP (`intelephense`, `pint`), TailwindCSS
- LSP keybindings are automatically set up when LSP attaches to a buffer

#### Formatting & Linting
- **Formatting**: Uses `conform.nvim` with formatters:
  - JavaScript/TypeScript: prettier
  - Lua: stylua
  - PHP: pint
  - Python: isort, black
  - Format on save is enabled
- **Linting**: Uses `nvim-lint` with linters:
  - JavaScript/TypeScript: eslint_d
  - Python: pylint

#### File Navigation
- **Telescope**: Primary fuzzy finder
  - `<leader>ff`: Find files
  - `<leader>fs`: Live grep
  - `<leader>fc`: Grep string under cursor
  - `<leader>ft`: Find todos
- **Nvim-tree**: File explorer
- **Harpoon**: Quick file navigation

## Key Mappings

### Core Mappings
- `jk`: Exit insert mode
- `<CR>`: Change word under cursor (normal mode)
- `<leader>nh`: Clear search highlights
- `<leader>s`: Search and replace current word
- `J`/`K`: Move selected lines up/down (visual mode)

### Window Management
- `<leader>sv`: Split window vertically
- `<leader>sh`: Split window horizontally
- `<leader>se`: Make splits equal size
- `<leader>sx`: Close current split

### Tab Management
- `<leader>to`: Open new tab
- `<leader>tx`: Close current tab
- `<leader>tn`: Next tab
- `<leader>tp`: Previous tab

### LSP Mappings (when LSP is attached)
- `gd`: Go to definition
- `gr`: Go to references
- `gI`: Go to implementation
- `<leader>D`: Type definition
- `<leader>rn`: Rename symbol
- `<leader>ca`: Code action

## Configuration Preferences

### Editor Settings
- Relative line numbers enabled
- 2-space indentation (tabs expanded to spaces)
- No line wrapping
- Case-smart search
- Cursor line highlighting
- No swap files
- 15-line scroll offset

### Plugins in Use
- **Telescope**: Fuzzy finder and picker
- **Nvim-tree**: File explorer
- **Treesitter**: Syntax highlighting and parsing
- **LSP**: Language server protocol support
- **Nvim-cmp**: Autocompletion
- **Gitsigns**: Git integration
- **Lualine**: Status line
- **Bufferline**: Buffer/tab line
- **Harpoon**: File navigation
- **Trouble**: Diagnostics viewer
- **Which-key**: Keybinding hints

## Development Workflow

When making changes to this configuration:

1. **Plugin changes**: Edit files in `lua/erinjkim/plugins/`
2. **Core settings**: Modify `lua/erinjkim/core/options.lua` or `lua/erinjkim/core/keymaps.lua`
3. **LSP changes**: Edit `lua/erinjkim/plugins/lsp/lspconfig.lua`
4. **Formatting/Linting**: Update `lua/erinjkim/plugins/formatting.lua` or `lua/erinjkim/plugins/linting.lua`

The configuration automatically reloads when files are saved thanks to Lazy.nvim's change detection.

## Testing Configuration

To test changes:
1. Restart Neovim or use `:source %` on modified files
2. Use `:Lazy` to check plugin status
3. Use `:Mason` to manage LSP servers and tools
4. Use `:checkhealth` to diagnose any issues

## Custom Features

- **Blade template support**: Custom syntax highlighting for Laravel Blade templates
- **Auto-session**: Session management for project persistence
- **Early retirement**: Plugin for unused code detection
- **Supermaven**: AI-powered code completion
- **Copilot**: GitHub Copilot integration