#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/aliases/bash_aliases"
        "shell/autocomplete/$(get_os)/bash_autocomplete"
        "shell/bash_exports"
        "shell/bash_functions"
        "shell/bash_logout"
        "shell/bash_options"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bashrc"
        "shell/curlrc"
        "shell/inputrc"

        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"

        "ohmyzsh/zshrc"
        "ohmyzsh/p10k.zsh"

        "tmux/tmux.conf"

        "vim/vim"
        "vim/vimrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi

    done

}

create_dotfiles_backup(){
    printf "creating symlinks for project dotfiles...\n\n"
    pushd $HOME > /dev/null 2>&1
    now=$(date +"%Y.%m.%d.%H.%M.%S")

    for file in .*; do
        if [[ $file == "." || $file == ".." ]]; then
            continue
        fi
        printf "~/$file"
        # if the file exists:
        if [[ -e ~/$file ]]; then
            execute "mkdir -p ~/.dotfiles_backup/$now"
            execute \
                "mv ~/$file ~/.dotfiles_backup/$now/$file" \
                "~/$file → ~/.dotfiles_backup/$now/$file"

        fi
        # symlink might still exist
        execute \
                "unlink ~/$file > /dev/null 2>&1" \
                "symlink might still exist to ~/$file → unlink ~/$file"
        
        # create the link
        # ln -s ~/.dotfiles/homedir/$file ~/$file
        # echo -en '\tlinked';ok
    done

    popd > /dev/null 2>&1
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_dotfiles_backup
    create_symlinks "$@"
}

main "$@"
