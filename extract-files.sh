#!/usr/bin/env bash
#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=advancamera-X1
VENDOR=advan

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

CLEAN_VENDOR=true
KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        # Fix soname untuk lib BST AI yang mungkin punya soname salah
        system_ext/app/PriCamera/lib/arm64/libBSTFaceDetction.so | \
        system_ext/app/PriCamera/lib/arm64/libBSTSingleAIDoc.so | \
        system_ext/app/PriCamera/lib/arm64/libBstStick2D.so)
            "${PATCHELF}" --set-soname "$(basename "${2}")" "${2}"
            ;;
        # Fix soname untuk libmvpu (nama file pakai .mtk.so)
        system_ext/lib64/libmvpu_engine.mtk.so | \
        system_ext/lib64/libmvpu_runtime.mtk.so | \
        system_ext/lib64/libmvpu_pattern.mtk.so | \
        system_ext/lib64/libmvpu_config.mtk.so)
            "${PATCHELF}" --set-soname "$(basename "${2}")" "${2}"
            ;;
    esac
}

setup_env "${SRC}" "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"

