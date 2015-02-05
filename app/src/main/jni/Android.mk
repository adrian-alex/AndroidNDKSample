
# keep a reference to the JNI source dir
TOP_LOCAL_PATH := $(call my-dir)

# initialise the makefile
include $(CLEAR_VARS)

# setup the source files
LOCAL_SRC_FILES := main.c
# LOCAL_SRC_FILES += file.cpp

# configure the module
LOCAL_PATH := $(TOP_LOCAL_PATH)
LOCAL_MODULE    := testmodule

# libs dependencies
LOCAL_LDLIBS    := -landroid -llog
LOCAL_STATIC_LIBRARIES := android_native_app_glue

# Version dependant configuration
ifeq ($(APP_OPTIM),release)
    # Release version optimisation : hide symbols
	LOCAL_CPPFLAGS += -fvisibility=hidden
	LOCAL_CFLAGS += -fvisibility=hidden
else
    # Enable Logs
    LOCAL_CPPFLAGS += -DLOGCAT
    LOCAL_CFLAGS += -DLOGCAT
endif


include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)