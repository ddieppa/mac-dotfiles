#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

create_src_dir() {

    declare -a DIRECTORIES=(
        "$HOME/src"
    )

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

clone_project(){
    
    cd $HOME/src

    # if [ ! -d "./$2" ]; then
            execute "git clone $1 $2"
    # else
    #     print_error "destination path '$2' already exists and is not an empty directory."
    #     return 1
    # fi

}

clone_regent_projects(){
    
    clone_project https://github.nclmiami.ncl.com/pch/rssc.scala.git rssc-scala
    clone_project https://github.nclmiami.ncl.com/pch/rssc-browse.git rssc-browse
    clone_project https://github.nclmiami.ncl.com/pch/cms-rssc.git rssc-cms
    clone_project https://github.nclmiami.ncl.com/NCLH/lyssa-prime.git rssc-lyssa-prime
    clone_project https://github.nclmiami.ncl.com/NCLH/cms-addons.git rssc-cms-addons
    clone_project https://github.nclmiami.ncl.com/pch/rssc-lyssa-mocks.git rssc-lyssa-mocks
    clone_project https://github.nclmiami.ncl.com/rssc/search-service.git rssc-search-service
    clone_project https://github.nclmiami.ncl.com/pch/rssc-static.git rssc-static
    clone_project https://github.nclmiami.ncl.com/pch/rssc.drupal.git rssc-drupal
    clone_project https://github.nclmiami.ncl.com/rssc/docker-fullstack.git rssc-docker-fullstack

}

main(){
    print_in_purple "\n   NCL Projects\n\n"

    create_src_dir

    clone_regent_projects
}

main