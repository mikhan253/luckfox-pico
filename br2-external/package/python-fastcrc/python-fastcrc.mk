################################################################################
#
# python-fastcrc
#
################################################################################

PYTHON_FASTCRC_VERSION = 0.3.2
PYTHON_FASTCRC_SOURCE = fastcrc-$(PYTHON_FASTCRC_VERSION).tar.gz
PYTHON_FASTCRC_SITE = https://files.pythonhosted.org/packages/source/f/fastcrc
PYTHON_FASTCRC_SETUP_TYPE = setuptools
PYTHON_FASTCRC_LICENSE = MIT
PYTHON_FASTCRC_LICENSE_FILES = LICENSE

$(eval $(python-package))
