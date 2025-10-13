ifeq ($(SYSDRV_PARAM), )
	SYSDRV_PARAM:=../../Makefile.param
	include $(SYSDRV_PARAM)
endif

$(SYSDRV_KERNEL_OBJS_OUTPUT_DIR)
$(KERNEL_DIR)

all: 
	cd backports-6.1.145-1 && $(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_DIR) M=$(shell pwd) modules O=$(WIFI_BUILD_KERNEL_OBJ_DIR) V=1


clean: $(PKG_CLEAN_TARGET)
