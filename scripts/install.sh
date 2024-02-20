#!/bin/bash

warn() {
  echo "WARN: $@" 1>&2
}

install_deps () {
    sudo apt-get update && sudo apt-get install neofetch fortune-mod fish

    cargo install starship --locked
}

copy_configs () {
    BASE=./config

    for ENTRY in $(find ${BASE} -maxdepth 1 -mindepth 1 -type d,f -printf '%f\n')
    do
        TARGET="${PWD}/config/${ENTRY}"
        DESTIN="${HOME}/.config/${ENTRY}"

        if test "${TARGET}"
        then
            warn "${ENTRY} already exists in home config folder, overwriting it!";
            rm -rf "${DESTIN}"
        fi

        ln -s "${TARGET}" "${DESTIN}"
    done
}

copy_configs
