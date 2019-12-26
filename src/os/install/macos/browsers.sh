#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_cask "Chrome" "google-chrome" 
brew_cask_version "Chrome Canary" "google-chrome-canary"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

# brew_install "Firefox" "firefox" "homebrew/cask" "cask"
brew_cask "Firefox" "firefox"
brew_cask_version "Firefox Developer" "firefox-developer-edition"
brew_cask_version "Firefox Nightly" "firefox-nightly"


