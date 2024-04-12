#!/bin/bash

SOURCE_DIR="${1:-lab_uno}"
RM_LIST="${2:-2remove}"
TARGET_DIR="${3:-bakap}"

if [[ ! -d "${TARGET_DIR}" ]]; then
    mkdir "${TARGET_DIR}"
fi

if [[ -f "${RM_LIST}" ]]; then
    while IFS=$'\n' read -r FILE_NAME
    do
        FILE_PATH="${SOURCE_DIR}/${FILE_NAME}"
        if [[ -f "${FILE_PATH}" ]]; then
            rm -rf "${FILE_PATH}"
            echo "usunieto plik: ${FILE_NAME}"
        else
            echo "plik ${FILE_NAME} nie istnieje"
        fi
    done < "${RM_LIST}"
else
    echo "brak listy z plikami do usuniecia"
fi

for FILE_NAME in "${SOURCE_DIR}"/*; do
    if [[ -f "${FILE_NAME}" ]]; then
        mv "${FILE_NAME}" "${TARGET_DIR}"
    fi

    if [[ -d "${FILE_NAME}" ]]; then
        cp -r "${FILE_NAME}" "${TARGET_DIR}"
    fi
done

COUNTER=$( find "${SOURCE_DIR}" -maxdepth 1 -type f | wc -l )

if [[ "${COUNTER}" -gt 0 ]]; then
    echo "jeszcze cos zostało"
fi

if [[ "${COUNTER}" -ge 2 ]]; then
    echo "zostały co najmniej 2 pliki"
fi

if [[ "${COUNTER}" -gt 4 ]]; then
    echo "zostało wiecej niż 4 pliki"
fi

if [[ "${COUNTER}" -ge 2 && "${COUNTER}" -le 4 ]]; then
    echo "coś między 2 a 4, chyba, nwm"
fi

if [[ "${COUNTER}" -eq 0 ]]; then
    echo "to jest koniec"
fi

DATA="$( date +%Y-%m-%d )"    

zip -r bakap_"${DATA}".zip "${TARGET_DIR}"