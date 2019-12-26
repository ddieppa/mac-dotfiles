#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"

brew_install_font "Cascadia PL" "font-cascadia-pl"
brew_install_font "Meslo PL" "font-meslo-for-powerline"
brew_install_font "Meslo NF" "font-meslo-nerd-font"
brew_install_font "Victor Mono" "font-victor-mono"
brew_install_font "Fira Code" "font-fira-code"
brew_install_font "Fira Code NF" "font-firacode-nerd-font"
