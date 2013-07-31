LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),smi)
    #include $(CLEAR_VARS)
    include $(all-subdir-makefiles)
endif
