#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
print_in_purple "\n   CLI Tools\n\n"

brew_install "tmux" "tmux"
brew_install "tmux (pasteboard)" "reattach-to-user-namespace"
brew_install "ack" "ack"
brew_install "ag" "ag"
brew_install "autojump" "autojump"
brew_install "bat" "bat"
brew_install "coreutils" "coreutils"
brew_install "findutils" "findutils"
brew_install "moreutils" "moreutils"
brew_install "fzf" "fzf"
execute "$(brew --prefix)/opt/fzf/install"
brew_install "readline" "readline"
brew_install "gawk" "gawk"
brew_install "gnupg" "gnupg"
brew_install "gnu-sed" "gnu-sed"
brew_install "grep" "grep"
brew_install "jq" "jq"
brew_install "tree" "tree"
brew_install "the_silver_searcher" "the_silver_searcher"
brew_install "ripgrep" "ripgrep"
brew_install "tldr" "tldr"
