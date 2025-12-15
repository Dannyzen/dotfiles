# Danny's Dotfiles

Modern, high-performance configuration for Zsh and Vim.

## 🚀 Quick Start

To bootstrap a new machine (Linux or macOS), run:

```bash
# Clone and install
git clone --recursive https://github.com/dannyzen/dotfiles.git ~/.homesick/repos/dotfiles
cd ~/.homesick/repos/dotfiles
./install.sh
```

**What this does:**
1.  **Installs Dependencies**: `zsh`, `vim`, `tmux`, `git`, `fzf`, `ripgrep`.
2.  **Backs Up**: Existing configs are moved to `~/dotfiles_backup_TIMESTAMP`.
3.  **Symlinks**: Links configuration files from `dotfiles/home/` to `~/`.
4.  **Configures**:
    - Sets Zsh as default shell.
    - Installs Vim plugins (via `vim-plug`).
    - Initializes Zsh plugins (via `antidote`).

## ✨ Features

### Zsh (Shell)
- **Manager**: [Antidote](https://getantidote.github.io/) (Fast, static file generation).
- **Theme**: `af-magic` (via Oh My Zsh).
- **Key Plugins**:
    - `zsh-autosuggestions`: Type less.
    - `zsh-syntax-highlighting`: See errors as you type.
    - `fzf`: Fuzzy find history and files (Ctrl+R, Ctrl+T).
    - `z`: Quick directory jumping.

### Vim (Editor)
- **Manager**: [vim-plug](https://github.com/junegunn/vim-plug).
- **Core Plugins**:
    - **Fern**: Fast, asynchronous file drawer (`,z` to toggle).
    - **Lightline**: Minimalist, performant status line.
    - **Vim-go**: Full Go development support.
    - **Pear-tree**: Robust auto-pairing.
    - **Vim-commentary**: `gcc` to comment lines.

## 📂 Structure

- `home/`: Configuration files symlinked to `~/` (e.g., `.zshrc`, `.vimrc`).
- `antidote/`: Git submodule for the Zsh plugin manager.
- `install.sh`: Idempotent bootstrap script.

## 🛠 Manual Management

### Adding Zsh Plugins
Edit `home/.zsh_plugins.txt` and run:
`antidote load` (or restart shell)

### Adding Vim Plugins
Edit `home/.vimrc` and run:
`:PlugInstall` inside Vim.

---
*Maintained by Danny Rosen*
