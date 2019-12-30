#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
# ./bash.sh

./git.sh
./../nvm.sh
./quick_look.sh
./cli_tools.sh
# ./tmux.sh
./../vim.sh
./fonts.sh
./productivity.sh
./browsers.sh
./communication.sh
./dev_tools.sh
./../ncl_projects.sh
# ./compression_tools.sh
# ./gpg.sh
./image_tools.sh
./misc.sh
# ./../npm.sh
./video_tools.sh
