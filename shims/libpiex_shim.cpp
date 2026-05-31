/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

// libpiex shim for Advan X1 stock camera
// Provides stub symbols needed by the stock camera APK
// on MediaTek Helio G100 (MT6789)

#include <cstdint>
#include <android/log.h>

#define LOG_TAG "libpiex_shim"

extern "C" {

// Stub: piex init
int piex_init() {
    __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, "piex_init called (shim)");
    return 0;
}

// Stub: piex get thumbnail
int piex_get_thumbnail(const void* /*data*/, size_t /*length*/,
                       void* /*thumbnail_data*/, size_t* /*thumbnail_length*/) {
    __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, "piex_get_thumbnail called (shim)");
    return -1;
}

} // extern "C"
