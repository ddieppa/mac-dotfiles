cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   iTerm2\n\n"


# execute 'open "./configs/Solarized Light.itermcolors"' \
#     "Installing the Solarized Light theme for iTerm (opening file)"

# execute "Installing the Patched Solarized Dark theme for iTerm (opening file)"
# open "./configs/Solarized Dark Patch.itermcolors"

execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
    "Don’t display the annoying prompt when quitting iTerm"

execute "defaults write com.googlecode.iterm2 HideTab -bool true" \
    "hide tab title bars"

execute "defaults write com.googlecode.iterm2 Hotkey -bool true" \
    "set system-wide hotkey to show/hide iterm with ^\`"

execute "defaults write com.googlecode.iterm2 ShowPaneTitles -bool false" \
    "hide pane titles in split panes"

execute "defaults write com.googlecode.iterm2 AnimateDimming -bool true" \
        "defaults write com.googlecode.iterm2 HotkeyChar -int 96" \
        "defaults write com.googlecode.iterm2 HotkeyCode -int 50" \
        "defaults write com.googlecode.iterm2 FocusFollowsMouse -int 1" \
        "defaults write com.googlecode.iterm2 HotkeyModifiers -int 262401" \
        "animate split-terminal dimming"

execute '/usr/libexec/PlistBuddy -c "set \"New Bookmarks\":0:\"Custom Directory\" Recycle" ~/Library/Preferences/com.googlecode.iterm2.plist' \
    "Make iTerm2 load new tabs in the same directory"

execute 'defaults write com.googlecode.iterm2 "Normal Font" -string "Hack-Regular 12"' \
        'defaults write com.googlecode.iterm2 "Non Ascii Font" -string "RobotoMonoForPowerline-Regular 12"' \
        "setting fonts"

execute 'defaults read -app iTerm > /dev/null 2>&1' \
        "reading iterm settings"

