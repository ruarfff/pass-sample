#!/bin/bash

function handle_error() {
    echo -e "\e[91mError occurred on line number $1\e[0m"
    exit 1
}

trap 'handle_error $LINENO' ERR

function adduser() {
    echo "Add user"
}

function removeuser() {
    echo "Remove user"
}

function usage() {
    echo "Usage : $progname [adduser|removeuser]"
    echo "README : https://github.com/ruarfff/pass-helper/blob/main/README.md"
    exit 1
}

if [ "$1" != "adduser" ] \
    && [ "$1" != "removeuser" ]; then
    usage
fi

case $1 in
    adduser)
        adduser "$PUBLIC_KEY_FILE"
        ;;
    removeuser)
        removeuser "$GPG_KEY_ID"
        ;;
    *)
        usage
        ;;
esac
