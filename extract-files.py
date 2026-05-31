#!/usr/bin/env python3
#
# Copyright (C) 2024-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

import sys
from os import path

# Pancing jalur absolut ke tools/extract-utils agar Python bisa nemu modulnya
sys.path.insert(0, path.abspath(path.join(path.dirname(__file__), '../../../../tools/extract-utils')))

from extract_utils.extract import extract_fns, utils
from extract_utils.extract_fns import (
    lib_to_package_fixup,
    packages_fixup,
)

module_dir = path.dirname(__file__)
utils.module_dir = module_dir

extract_fns.proprietary_files_txt = path.join(module_dir, 'proprietary-files.txt')
extract_fns.vendor_dir = path.join(module_dir, '..', '..', 'vendor', 'advan', 'advancamera-X1')

def lib_fixup(lib, partition, *args, **kwargs):
    return lib_to_package_fixup(lib, partition, *args, **kwargs)

def pkg_fixup(package, partition, *args, **kwargs):
    return packages_fixup(package, partition, *args, **kwargs)

if __name__ == '__main__':
    utils.main(
        'advancamera-X1',
        'advan',
        None,
        module_dir,
        lib_fixup=lib_fixup,
        pkg_fixup=pkg_fixup,
    )
