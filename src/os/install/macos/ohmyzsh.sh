#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

install_ohmyzsh_custom_themes()
{
    if [[ ! -d "./oh-my-zsh/custom/themes/powerlevel10k" ]]; then
        git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    fi

    print_result $? "OhMyZsh Themes"
}


install_ohmyzsh() {

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    print_result $? "OhMyZsh"
}

install_ohmyzsh_plugins(){

    printf "\n cloning zsh-autosuggestions"
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    printf "\n cloning fast-syntax-highlighting"
    git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
    printf "\n cloning alias-tips"
    git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips

    print_result $? "OhMyZsh Plugins"
}

main(){
    print_in_purple "\n   OhMyZsh\n\n"
    install_ohmyzsh
    install_ohmyzsh_plugins
    install_ohmyzsh_custom_themes
}

main