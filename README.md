## Overview

A small, focused Neovim config for C/C++ development that reduces IDE distractions while keeping useful tooling 
(fuzzy finding, git, lsp, linting, treesitter, and basic ui plugins). Startup: ~110 ms total (measured with `nvim --startuptime`), 
~60 ms spent loading plugins.

<img width="1902" height="1110" alt="README_overview" src="https://github.com/user-attachments/assets/4f950f43-3dce-4e1c-893a-a612c9b33efa" />

## Requirements

- [Neovim 0.12+](https://neovim.io/).
- [vim-plug](https://github.com/junegunn/vim-plug).
- LSPs & linters (install seperately e.g. clangd).
- Nerd font installed.

## Install

```bash
# create config dir and clone
mkdir -p ~/.config/nvim
git clone https://github.com/hendo-hpp/nvim-config.git ~/.config/nvim

# open neovim and install plugins
nvim +PlugInstall +qa
```

## Features

- Treesitter syntax highlighting, Linting, LSP support, and Autocomplete.
- File tree, Tab bars, Status bar, and Custom icons.
- Fuzzy finder
- Git integration
- Inline markdown rendering

See `lua/plugins/` for exact plugin settings and to add your own.

## Keymappings and Commands

Leader key is mapped to space (`' '`) (e.g. `<leader>t` to open the file tree). See `lua/config/keymaps.lua` for available keymaps and to edit them or create more.

- `:PlugInstall` to install plugins
- `:PlugUpdate` to update plugins
- `:TSInstall` for syntax highlighting, languages specified in `/lua/plugins/treesitter.lua`
