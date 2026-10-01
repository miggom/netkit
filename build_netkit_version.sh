#!/bin/bash
set -ae
IMAGE="miggom/netkit"
FILE="Dockerfile.ubuntu26"
NO_CACHE=false

build () {
    local ver=$1
    if [[ $NO_CACHE == true ]];then
        echo "No cache apply"
        docker buildx build --no-cache -f $FILE -t $IMAGE:$ver .
    else
        docker buildx build  -f $FILE -t $IMAGE:$ver .
    fi
    sbom_file_creator $ver

}

sbom_file_creator () {
    local sbom_file_update="sbom_$(date -u +"%Y%m%d_%T")"
    local version=$1
    local first_sbom_name="first_swbom.txt"
    if [[ ! -z $(ls *sbom*) ]]; then 
        current_sbom_name=$( ls *sbom*)
    else
        touch $first_sbom_name
        current_sbom_name=$first_sbom_name
    fi
    echo "$(docker run --rm -t -e PAGER=cat $IMAGE:$version dpkg -l)" > $current_sbom_name
    mv $current_sbom_name $sbom_file_update
    git add $sbom_file_update
    git commit -m "new sbom $sbom_file_update"   


}
main () {
    local no_cache=$NO_CACHE
    if [[  $# -eq 0 ]]; then 
        echo "build_netkit_version <new_version>"
        exit 1
    fi
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --no-cache)
                no_cache=true
                shift # Move past the flag
                ;;
            -*)
                echo "Error: unknowwn $1"
                exit 1
                ;;
            *)
                VERSION="${1}"
                echo "Version $VERSION"
                build $VERSION
                shift
                ;;
        esac
    done
    

}
main $1 $2