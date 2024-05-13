#!/bin/bash

set -eu

DIRECTORY="${1:-test}"

if [[ ! -d "${DIRECTORY}" ]]; then
    echo "Blad: Folder nie istnieje"
    exit 1
fi

if [[ $# -eq 0 ]]; then
    echo "Blad: Nie podano argumentu"
    exit 2
fi

find "$DIRECTORY" -type f -name "*.bak" -exec chmod u-w,o-w {} \;   
find "$DIRECTORY" -type d -name "*.bak" -exec chmod 0111 {} \;      
find "$DIRECTORY" -type d -name "*.tmp" -exec chmod 1777 {} \;      
find "$DIRECTORY" -type f -name "*.txt" -exec chmod 0460 {} \;      
find "$DIRECTORY" -type f -name "*.exe" -exec chmod 4755 {} \;      
