#!/bin/bash

set -e # Exit on any error

# Helper function to check and install a package
base_install() {
    local cmd="$1"
    local install_cmd="$2"

    if command -v "$cmd" >/dev/null 2>&1; then
        printf "%s is already installed.\n" "$cmd"
    else
        printf "Installing %s...\n" "$cmd"
        eval "$install_cmd"
    fi
}

# Homebrew installation wrapper
brew_install() {
    base_install "$1" "brew install $1"
}

# Install Homebrew if not installed
ensure_homebrew() {
    if ! command -v brew >/dev/null 2>&1; then
        printf "Homebrew is not installed. Installing Homebrew...\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        printf "Setting brew environment variables...\n"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        printf "Homebrew is already installed.\n"
    fi
}
