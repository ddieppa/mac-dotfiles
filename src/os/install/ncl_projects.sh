#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"


clone_project(){

    

    # if [ ! -d "./$2" ]; then
            execute "git clone $1 $2"
    # else
    #     print_error "destination path '$2' already exists and is not an empty directory."
    #     return 1
    # fi

}

move_to_src(){
    local src_directory="$HOME/src"

    if [ ! -d "$src_directory" ]; then
        execute "mkd $src_directory" \
                "$src_directory did not exist, created"
    fi

    cd $src_directory 
    print_success "moved to $src_directory"
}

clone_regent_projects(){
    
    clone_project git@github.nclmiami.ncl.com:pch/rssc.scala.git rssc-scala
    clone_project git@github.nclmiami.ncl.com:pch/rssc-browse.git rssc-browse
    clone_project git@github.nclmiami.ncl.com:pch/cms-rssc.git rssc-cms
    clone_project git@github.nclmiami.ncl.com:NCLH/lyssa-prime.git rssc-lyssa-prime
    clone_project git@github.nclmiami.ncl.com:NCLH/cms-addons.git rssc-cms-addons
    clone_project git@github.nclmiami.ncl.com:pch/rssc-lyssa-mocks.git rssc-lyssa-mocks
    clone_project git@github.nclmiami.ncl.com:rssc/search-service.git rssc-search-service
    clone_project git@github.nclmiami.ncl.com:pch/rssc-static.git rssc-static
    clone_project git@github.nclmiami.ncl.com:pch/rssc.drupal.git rssc-drupal
    #clone_project https://github.nclmiami.ncl.com/rssc/docker-fullstack.git rssc-docker-fullstack

}

clone_config_projects(){
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-dockers.git rssc-config-dockers
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-local-confs.git rssc-config-local-confs
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-haproxy.git rssc-config-haproxy
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-mysql-dump.git rssc-config-mysql-dump
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-indexer-data.git rssc-config-indexer-data
}

create_local_confs_symlinks(){

    local src_directory="$HOME/src"
    local config_directory="$src_directory/rssc-config-local-confs"

    declare -a PROJECTS=(
        "rssc-browse"
        "rssc-cms"
        "rssc-lyssa-prime"
        "rssc-scala"
        "rssc-search-service"
    )

    for project in ${PROJECTS[@]}; do
        if [ ! -h "$src_directory/$project/local.conf" ]; then
            sourceFile="$config_directory/${project}.local.conf"
            targetFile="$src_directory/$project/conf/local.conf"
            execute \
                "ln -fs $sourceFile $targetFile" \
                "$project local.conf → $sourceFile"
        fi
    done
    
}

main(){
    print_in_purple "\n   NCL Projects\n\n"

    move_to_src
    clone_regent_projects
    clone_config_projects
    create_local_confs_symlinks

}

main