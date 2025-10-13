ifeq ($(SYSDRV_PARAM), )
	SYSDRV_PARAM:=../../Makefile.param
	include $(SYSDRV_PARAM)
endif

ifneq ($(SYSDRV_KERNEL_OBJS_OUTPUT_DIR),)
WIFI_BUILD_KERNEL_OBJ_DIR=$(SYSDRV_KERNEL_OBJS_OUTPUT_DIR)
else
WIFI_BUILD_KERNEL_OBJ_DIR=$(KERNEL_DIR)
endif

ifeq ($(ENABLE_WIFI),y)

WIFI_USB = $(shell grep -o "CONFIG_USB=y" $(WIFI_BUILD_KERNEL_OBJ_DIR)/.config)
WIFI_SDIO = $(shell grep -o "CONFIG_MMC=y" $(WIFI_BUILD_KERNEL_OBJ_DIR)/.config)
WIFI_RFKILL = $(shell grep -o "CONFIG_RFKILL=y" $(WIFI_BUILD_KERNEL_OBJ_DIR)/.config)
export WIFI_RFKILL WIFI_BUILD_KERNEL_OBJ_DIR

PKG_TARGET += build-drivers
PKG_CLEAN_TARGET += build-drivers-clean

endif

ifeq ($(M_OUT_DIR),)
# TODO
$(error Please build on upper directory)
endif

all: $(PKG_TARGET)
	@echo "build wifi done"
	@echo "build wifi $(WIFI_RFKILL)"
ifeq ($(ENABLE_WIFI),y)
	@cp insmod_wifi.sh $(M_OUT_DIR);
endif

build-drivers:
	@make -C rtl8189fs/
	@make -C rtl8723bs/
	#@make -C hichannel/
	#@make -C atbm/
	#@make -C atbm6441/
	#@make -C aic8800dc/
	#@make -C aic8800_netdrv/


build-drivers-clean:
	@make -C rtl8189fs/ clean
	@make -C rtl8723bs/ clean
	#@make -C bcmdhd/ clean
	#@make -C hichannel/ clean
	#@make -C atbm/ clean
	#@make -C atbm6441/ clean
	#@make -C aic8800_netdrv/ clean

clean: $(PKG_CLEAN_TARGET)
