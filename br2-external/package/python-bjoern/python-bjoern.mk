################################################################################
#
# python-bjoern
#
################################################################################

PYTHON_BJOERN_VERSION = 3.2.2
PYTHON_BJOERN_SOURCE = bjoern-$(PYTHON_BJOERN_VERSION).tar.gz
PYTHON_BJOERN_SITE = https://files.pythonhosted.org/packages/source/b/bjoern
PYTHON_BJOERN_SETUP_TYPE = setuptools
PYTHON_BJOERN_LICENSE = BSD-2-Clause
PYTHON_BJOERN_LICENSE_FILES = LICENSE
PYTHON_BJOERN_DEPENDENCIES = libev

define PYTHON_BJOERN_FIX_SETUP_PY
    $(SED) 's|/usr/include/libev|$(STAGING_DIR)/usr/include|g' $(@D)/setup.py
    $(SED) 's|/opt/local/include|$(STAGING_DIR)/usr/include|g' $(@D)/setup.py
    $(SED) 's|/opt/homebrew/include|$(STAGING_DIR)/usr/include|g' $(@D)/setup.py
    $(SED) 's|/usr/local/include|$(STAGING_DIR)/usr/include|g' $(@D)/setup.py
	
    $(SED) 's|library_dirs *= *\[[^]]*\]|library_dirs = ["$(STAGING_DIR)/usr/lib"]|' $(@D)/setup.py
endef

PYTHON_BJOERN_POST_PATCH_HOOKS += PYTHON_BJOERN_FIX_SETUP_PY

$(eval $(python-package))