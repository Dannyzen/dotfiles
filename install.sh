#!/usr/bin/env bash
set -e

# ==============================================================================
# Dotfiles Installer
# ==============================================================================
# This script bootstraps the environment on a new machine.
# It installs dependencies, clones the dotfiles repo, symlinks configs,
# and sets up Vim/Zsh.
# ==============================================================================

DOTFILES_REPO="https://github.com/dannyzen/dotfiles.git"
TARGET_DIR="$HOME/.homesick/repos/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# ==============================================================================
# 1. Install Dependencies
# ==============================================================================
install_deps() {
    log "Installing system dependencies..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt-get &> /dev/null; then
            log "Detected Debian/Ubuntu..."
            sudo apt-get update
            sudo apt-get install -y git zsh vim tmux curl wget ripgrep fzf
        elif command -v pacman &> /dev/null; then
            log "Detected Arch Linux..."
            sudo pacman -Syu --noconfirm git zsh vim tmux curl wget ripgrep fzf
        else
            error "Unsupported Linux package manager. Please install git, zsh, vim, tmux, curl, wget, ripgrep manually."
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        log "Detected macOS..."
        if ! command -v brew &> /dev/null; then
             log "Installing Homebrew..."
             /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install git zsh vim tmux curl wget ripgrep fzf
    else
        error "Unsupported OS: $OSTYPE"
        exit 1
    fi
    success "Dependencies installed."
}

# ==============================================================================
# 2. Clone Dotfiles
# ==============================================================================
setup_repo() {
    if [ -d "$TARGET_DIR" ]; then
        log "Dotfiles repo already exists at $TARGET_DIR"
        log "Pulling latest changes..."
        git -C "$TARGET_DIR" pull origin master || git -C "$TARGET_DIR" pull origin main
    else
        log "Cloning dotfiles to $TARGET_DIR..."
        mkdir -p "$(dirname "$TARGET_DIR")"
        git clone --recursive "$DOTFILES_REPO" "$TARGET_DIR"
    fi
    
    # Initialize submodules (Antidote)
    log "Initializing submodules..."
    git -C "$TARGET_DIR" submodule update --init --recursive
    success "Repo setup complete."
}

# ==============================================================================
# 3. Create Symlinks
# ==============================================================================
link_file() {
    local src=$1
    local dest=$2

    if [ -L "$dest" ]; then
        local current_target
        current_target=$(readlink "$dest")
        if [ "$current_target" == "$src" ]; then
            log "Skipping $dest (already linked correctly)"
            return
        fi
    fi

    if [ -e "$dest" ]; then
        log "Backing up existing $dest to $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    log "Linking $src -> $dest"
    ln -s "$src" "$dest"
}

setup_symlinks() {
    log "Setting up symlinks..."
    local source_home="$TARGET_DIR/home"

    # Link all files starting with . in home/
    for file in "$source_home"/.*; do
        filename=$(basename "$file")
        if [[ "$filename" == "." || "$filename" == ".." || "$filename" == ".git" ]]; then
            continue
        fi
        link_file "$file" "$HOME/$filename"
    done
    
    # Explicitly link anything else if needed (e.g., bin scripts)
    # mkdir -p $HOME/bin
    # ...
    
    success "Symlinks created."
}

# ==============================================================================
# 4. Setup Vim
# ==============================================================================
setup_vim() {
    log "Setting up Vim..."
    
    # Install vim-plug
    local plug_file="$HOME/.vim/autoload/plug.vim"
    if [ ! -f "$plug_file" ]; then
        log "Installing vim-plug..."
        curl -fLo "$plug_file" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    # Install plugins
    log "Installing Vim plugins (headless)..."
    vim -E -s +PlugInstall +qall || {
        log "Vim plugins installed (exit code may be non-zero due to headless env, checking directory...)"
    }
    
    # Check if critical plugins exist
    if [ -d "$HOME/.vim/plugged/fern.vim" ]; then
        success "Vim setup complete."
    else
        error "Vim plugin installation might have failed. Run 'vim +PlugInstall' manually."
    fi
}

# ==============================================================================
# 5. Setup Zsh
# ==============================================================================
setup_zsh() {
    log "Setting up Zsh..."
    
    # Helper to change shell
    if [ "$SHELL" != "$(which zsh)" ]; then
        log "Changing default shell to Zsh..."
        chsh -s "$(which zsh)" || error "Failed to change shell. You may need to do this manually."
    else
        log "Zsh is already the default shell."
    fi

    # Trigger Antidote first run
    # sourcing the .zshrc in a non-interactive shell might not be perfect, 
    # but we can try to pre-load plugins.
    if [ -f "$TARGET_DIR/antidote/antidote.zsh" ]; then
         log "Pre-loading Antidote plugins..."
         zsh -c "compdef() { :; }; source $TARGET_DIR/antidote/antidote.zsh && antidote load $TARGET_DIR/home/.zsh_plugins.txt"
    fi
    
    success "Zsh setup complete."
}

# ==============================================================================
# Main
# ==============================================================================
main() {
    install_deps
    setup_repo
    setup_symlinks
    setup_vim
    setup_zsh
    
    echo -e "\n${GREEN}=========================================="
    echo -e "   Installation Complete!                 "
    echo -e "==========================================${NC}"
    echo -e "1. Restart your terminal or log out/in."
    echo -e "2. Open vim and check your plugins."
    echo -e "3. Enjoy your new setup!"
}

main
