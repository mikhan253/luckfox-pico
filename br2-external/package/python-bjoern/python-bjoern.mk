################################################################################
#
# python-fastcrc
#
################################################################################

PYTHON_BJOERN_VERSION = 3.2.2
PYTHON_BJOERN_SOURCE = bjoern-$(PYTHON_BJOERN_VERSION).tar.gz
PYTHON_BJOERN_SITE = https://files.pythonhosted.org/packages/source/b/bjoern
PYTHON_BJOERN_SETUP_TYPE = setuptools
PYTHON_BJOERN_LICENSE = MIT
PYTHON_BJOERN_LICENSE_FILES = LICENSE

$(eval $(python-package))
