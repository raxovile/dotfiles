# Neovim Configuration Project

## Overview
This project contains a comprehensive Neovim configuration tailored for efficient and personalized development workflows. It leverages plugins managed by `lazy.nvim` and custom Lua scripts for settings, keymaps, and autocommands.

---

## Table of Contents
1. [Project Structure](#project-structure)
2. [Plugins](#plugins)
3. [Key Features](#key-features)
4. [Basic Keymaps](#basic-keymaps)
5. [Configurations](#configurations)
   - [Globals](#globals)
   - [Options](#options)
   - [Autocommands](#autocommands)
   - [Lazy Installation](#lazy-installation)

---

## Project Structure
```
├── init.lua               # Main entry point
├── globals.lua            # Global variables and leader key settings
├── options.lua            # Neovim options and basic keymaps
├── basicAutocommands.lua  # Autocommands
├── lazyInstallation.lua   # Lazy.nvim setup and plugin manager
├── stylua.toml            # Configuration for Lua code formatting
├── .clang-format          # Configuration for C/C++ code formatting
├── plugins/               # Directory containing plugin-specific configurations
```

---

## Plugins
Plugins are managed using `lazy.nvim` and organized into categories for maintainability. Below is an overview of the plugin categories:

- **Utility**: General-purpose plugins for productivity enhancements.
- **LSP**: Language Server Protocol configurations for code intelligence.
- **Editor**: Tools to improve editing experience.
- **Theme**: Appearance and UI customization.
- **Completion**: Autocompletion and snippet management.
- **DAP**: Debug Adapter Protocol integrations.
- **Telescope**: Fuzzy finder and search capabilities.
- **Which-Key**: Keybinding guide.
- **Indent-Blankline**: Visual indentation guides.
- **Prettier**: Code formatting.
- **Todo-Comments**: Highlight TODO comments.
- **Mini**: Mini.nvim suite for small utility tools.
- **Obsidian**: Integration with Obsidian markdown notes.

---

## Key Features
- **Leader Key**: Set to `<Space>` for faster navigation and keybinding.
- **Clipboard Integration**: Seamlessly sync clipboard between OS and Neovim.
- **Split Navigation**: Easy navigation with `<Ctrl-h/j/k/l>`.
- **Highlight on Yank**: Visual feedback when copying text.
- **PowerShell as Default Shell**: Configured for Windows and Unix-based systems.
- **Fold Configuration**: Tree-sitter based folding setup.

---

## Basic Keymaps
- `<Esc>`: Clear search highlights.
- `<Ctrl-h/j/k/l>`: Navigate between splits.
- `<Leader>q`: Open diagnostic quickfix list.
- Arrow keys disabled in normal mode for better habits (`h/j/k/l` prompts).
- `<Esc><Esc>`: Exit terminal mode.

---

## Configurations

### Globals
Located in `globals.lua`, this file sets:
- **Leader Key**: `<Space>`.
- **Nerd Font Support**: Toggle based on terminal capabilities.
- **Copilot Configuration**: Enable for all file types.

### Options
Found in `options.lua`, it configures:
- **Line Numbers**: Absolute and relative.
- **Mouse Mode**: Enabled.
- **Clipboard**: Synchronized with OS.
- **Indentation**: Auto, smart, and C-specific indentation.
- **Search**: Case-insensitive with smart case.
- **Sign Column**: Always on.
- **Scrolling**: 10 lines above and below the cursor.
- **Relative Numbers**: Enabled for navigation.
- **Timeout Length**: Shortened for `which-key` popups.

### Autocommands
Managed in `basicAutocommands.lua`, including:
- **Yank Highlight**: Visual feedback on copy.
- **Prettier Formatting**: Auto-format JSON, JS, TS, and Markdown on save.
- **C# Formatting**: LSP-based formatting on save.

### Lazy Installation
The `lazyInstallation.lua` script ensures:
- Installation of `lazy.nvim` if not already available.
- Custom icons based on Nerd Font availability.

---

## Formatting Tools
- **Stylua**: Lua code formatting (`stylua.toml` configuration).

---

## Next Steps
In the next phase, we will:
1. Test individual plugins to ensure functionality.
2. Debug and fix configuration issues.
3. Document missing plugin details in this README.
