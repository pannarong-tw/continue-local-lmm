#!/bin/bash

source "$(dirname "$0")/common.sh"

ensure_homebrew
brew_install "colima"
brew_install "docker"
brew_install "docker-compose"

# Setup Docker Compose CLI plugin
printf "Setting up docker-compose CLI plugin...\n"
mkdir -p "$HOME/.docker/cli-plugins"
ln -sfn "$(brew --prefix)/opt/docker-compose/bin/docker-compose" "$HOME/.docker/cli-plugins/docker-compose"
printf "Docker Compose CLI plugin setup complete.\n"
