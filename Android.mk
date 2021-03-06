# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# Include all the java files.
LOCAL_SRC_FILES := $(call all-java-files-under, dexmaker/src/main/java)

LOCAL_STATIC_JAVA_LIBRARIES := dexmaker-dx-target dexmaker-dex-target

LOCAL_SDK_VERSION := 10

# The name of the jar file to create.
LOCAL_MODULE := dexmaker

# Build a static jar file.
include $(BUILD_STATIC_JAVA_LIBRARY)

# Build Dexmaker's MockMaker, a plugin to Mockito
include $(CLEAR_VARS)
LOCAL_MODULE := dexmaker-mockmaker
LOCAL_SDK_VERSION := 10
LOCAL_SRC_FILES := $(call all-java-files-under, dexmaker-mockito/src/main/java)
LOCAL_JAVA_RESOURCE_DIRS := dexmaker-mockito/src/main/resources
LOCAL_JAVA_LIBRARIES := dexmaker mockito-api
include $(BUILD_STATIC_JAVA_LIBRARY)

# Target prebuilt dependencies.
# ============================================================
include $(CLEAR_VARS)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    dexmaker-dx-target:lib/dalvik-dx-1$(COMMON_JAVA_PACKAGE_SUFFIX) \
    dexmaker-dex-target:lib/libcore-dex-2$(COMMON_JAVA_PACKAGE_SUFFIX) \

include $(BUILD_MULTI_PREBUILT)
