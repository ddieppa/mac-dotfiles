#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"


brew_cask "Transmission" "transmission" 
brew_cask "trash" "trash" 
brew_cask "Unarchiver" "the-unarchiver" 
brew_cask "VLC" "vlc" 

brew_cask "appcleaner" "appcleaner"
brew_cask "namechanger" "namechanger"