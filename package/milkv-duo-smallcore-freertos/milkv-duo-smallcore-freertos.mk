################################################################################
#
# milkv-duo-smallcore-freertos
#
################################################################################

MILKV_DUO_SMALLCORE_FREERTOS_VERSION = 10b86e308ca2305a464ae2bb3eb868a72295f7ab
MILKV_DUO_SMALLCORE_FREERTOS_SITE = $(call github,milkv-duo,milkv-duo-smallcore-freertos,$(MILKV_DUO_SMALLCORE_FREERTOS_VERSION))
MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING = YES
MILKV_DUO_SMALLCORE_FREERTOS_DEPENDENCIES = host-cmake host-ninja
MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV = CROSS_COMPILE=$(TARGET_CROSS) MK_ENV=$(TARGET_MAKE_ENV) TARGET_CMAKE=$(BR2_CMAKE) BUILD_PATH=$(@D)

define MILKV_DUO_SMALLCORE_FREERTOS_BUILD_CMDS
	$(MAKE) -C $(@D) all $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV)
endef

define MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/cvitek/install/bin/cvirtos.bin $(BINARIES_DIR)/cvirtos.bin
	touch $(BINARIES_DIR)/empty.bin
endef

$(eval $(generic-package))
