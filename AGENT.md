# AGENT.md

This document provides instructions for AI agents operating on this repository.

## Project Overview
This repository manages user configuration (dotfiles) for Zsh and Vim. It relies on symlinking files from `home/` to the user's home directory.

## Core Commands

### 1. Installation
To set up the environment from scratch:
```bash
./install.sh
```
*Expected Result*: Dependencies installed, repos cloned, symlinks created, shell configured.

### 2. Testing / Verification
To verify the configuration is valid:
```bash
# Verify Zsh startup
zsh -i -c 'exit'

# Verify Vim startup
vim -E -s +qall
```

### 3. Adding Configuration

#### Zsh Plugins
1.  Read `home/.zsh_plugins.txt`.
2.  Append new plugin in Antidote format (`url` or `bundle`).
3.  Command: `antidote load $HOME/.homesick/repos/dotfiles/home/.zsh_plugins.txt` (or restart zsh).
4.  *Note*: Prefer `https://www.github.com/...` URLs to avoid SSH auth issues in minimal environments.

#### Vim Plugins
1.  Read `home/.vimrc`.
2.  Add `Plug 'url'` inside the `plug#begin`/`plug#end` block.
3.  Command: `vim +PlugInstall +qall`.

## Directory Structure
- `home/`: Source of truth for dotfiles. Symlinked to `$HOME`.
    - `.zshrc`: Main shell config.
    - `.vimrc`: Main editor config.
- `install.sh`: Bootstrap logic.

## Common Issues
- **Git SSH**: If `git clone` fails with permission denied, ensure URLs in `.zsh_plugins.txt` and `.vimrc` use `https://www.github.com/` instead of short `user/repo` syntax (if global git config enforces SSH).
- **Headless Vim**: `vim +PlugInstall` may have non-zero exit codes in some headless shells; verify by checking `~/.vim/plugged` content.
