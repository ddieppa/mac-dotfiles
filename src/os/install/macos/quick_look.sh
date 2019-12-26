#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Quick Look\n\n"

brew_cask "JSON" "quicklook-json"
brew_cask "Markdown" "qlmarkdown"
brew_cask "qlstephen" "qlstephen"
brew_cask "qlcolorcode" "qlcolorcode"
brew_cask "qlimagesize" "qlimagesize"
brew_cask "webpquicklook" "webpquicklook"
