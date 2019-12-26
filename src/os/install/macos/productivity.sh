cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Productivity Tools\n"

brew_cask_version "Microsoft Remote Desktop 10" "microsoft-remote-desktop-beta"
brew_cask "Alfred" "alfred"
brew_cask "Rectangle" "rectangle"
brew_cask "clipy" "clipy"
brew_cask "cheatsheet" "cheatsheet"
