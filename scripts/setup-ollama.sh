#!/bin/bash

source "$(dirname "$0")/common.sh"

ensure_homebrew
brew_install "ollama"
