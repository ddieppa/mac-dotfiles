
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  Communication Tools\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_cask "Microsoft Teams" "microsoft-teams"
brew_cask "Zoom" "zoomus"
brew_cask "slack" "slack"