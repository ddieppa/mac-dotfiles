#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Development Tools\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

brew_cask "iterm2" "iterm2"
brew_install "ShellCheck" "shellcheck"
brew_cask "Docker" "docker"
brew_cask "VS Code" "visual-studio-code"
brew_cask_version "VS Code Insiders" "visual-studio-code-insiders"
brew_cask "Postman" "postman"
brew_cask "Java8" "homebrew/cask-versions/adoptopenjdk8"
brew_install "sbt" "sbt"
brew_install "scala" "scala"
brew_cask "IntelliJIDEA" "intellij-idea"
brew_cask "Visual Studio for Mac" "visual-studio"
brew_cask "Haproxy" "haproxy"
brew services start haproxy

if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn"
fi


printf "\n"
