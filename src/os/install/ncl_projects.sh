#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

src_directory="$HOME/src"

clone_project(){

    # if [ ! -d "./$2" ]; then
            execute "git clone $1 $2"
    # else
    #     print_error "destination path '$2' already exists and is not an empty directory."
    #     return 1
    # fi
}

check_src_exist(){

    if [ ! -d "$src_directory" ]; then
        execute "mkd $src_directory" \
                "$src_directory did not exist, created"
    fi
 
}

clone_regent_projects(){

    check_src_exist
    
    clone_project git@github.nclmiami.ncl.com:pch/rssc.scala.git $src_directory/rssc-scala
    clone_project git@github.nclmiami.ncl.com:pch/rssc-browse.git $src_directory/rssc-browse
    clone_project git@github.nclmiami.ncl.com:pch/cms-rssc.git $src_directory/rssc-cms
    clone_project git@github.nclmiami.ncl.com:NCLH/lyssa-prime.git $src_directory/rssc-lyssa-prime
    clone_project git@github.nclmiami.ncl.com:NCLH/cms-addons.git $src_directory/rssc-cms-addons
    clone_project git@github.nclmiami.ncl.com:pch/rssc-lyssa-mocks.git $src_directory/rssc-lyssa-mocks
    clone_project git@github.nclmiami.ncl.com:rssc/search-service.git $src_directory/rssc-search-service
    clone_project git@github.nclmiami.ncl.com:pch/rssc-static.git $src_directory/rssc-static
    clone_project git@github.nclmiami.ncl.com:pch/rssc.drupal.git $src_directory/rssc-drupal
    #clone_project https://github.nclmiami.ncl.com/rssc/docker-fullstack.git rssc-docker-fullstack

}

clone_config_projects(){
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-dockers.git $src_directory/rssc-config-dockers
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-local-confs.git $src_directory/rssc-config-local-confs
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-haproxy.git $src_directory/rssc-config-haproxy
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-mysql-dump.git $src_directory/rssc-config-mysql-dump
    clone_project git@github.nclmiami.ncl.com:ddieppa/rssc-config-indexer-data.git $src_directory/rssc-config-indexer-data
}

create_local_confs_symlinks(){

    # local src_directory="$HOME/src"
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

haproxy_configuration(){
    haproxyConfigFolder="$src_directory/rssc-config-haproxy/"
    cfgSourceFile="$haproxyConfigFolder/haproxy.cfg"
    cfgTargetFile="/usr/local/etc/haproxy.cfg"
    sslSourceFile="$haproxyConfigFolder/ssl/private.pem"
    sslTargetFile="/usr/local/etc/ssl/certs/private.pem"
    execute "ln -fs $sslSourceFile $sslTargetFile" \
                        "$sslTargetFile → $sslSourceFile"

    execute "ln -fs $cfgSourceFile $cfgTargetFile" \
                        "$cfgTargetFile → $cfgSourceFile"
    
    execute "brew services restart haproxy" 
}

nmv_configuration(){
    execute "nvm install 8.11.3"
    execute "nvm alias default 8.11.3"
}

update_hosts_file(){
    execute "sudo cp /etc/hosts /etc/hosts.backup" "Backup hosts file"
    newHostsFile="$(cd ../.. && pwd)/hosts/hosts"
    execute "sudo cp $newHostsFile /etc/hosts" "New file hosts in place"
}

main(){
    print_in_purple "\n   NCL Projects\n\n"

    clone_regent_projects
    clone_config_projects
    create_local_confs_symlinks
    
    update_hosts_file

    haproxy_configuration
    nmv_configuration

    sudo mkdir -p /var/log/rssc-scala
    sudo touch /var/log/rssc-scala/application.log
    sudo chmod 777 /var/log/rssc-scala/application.log
}

main
