EIWD_VERSION = 2.22  # oder die Version, die du verwenden willst

EIWD_SITE = https://github.com/illiliti/eiwd/releases/download/$(EIWD_VERSION)-1
EIWD_SOURCE = iwd-$(EIWD_VERSION).tar.xz
EIWD_SITE_METHOD = tarball
EIWD_LICENSE = LGPL-2.1-or-later
EIWD_DEPENDENCIES = ell # oder andere Bibliotheken, die benötigt werden

# Konfigurationsoptionen, analog zu iwd, aber D-Bus-Optionen auslassen oder anpassen
EIWD_CONF_OPTS = \
    --disable-manual-pages \
    --enable-external-ell \
    --disable-dbus-policy --disable-systemd-service

# Falls du Optionen aus iwd übernehmen willst, kannst du Bedingungen prüfen:
ifeq ($(BR2_PACKAGE_READLINE),y)
EIWD_CONF_OPTS += --enable-readline
EIWD_DEPENDENCIES += readline
endif

# Falls dein Projekt spezielle Patches hat:
EIWD_PATCHES = $(wildcard $(BR2_EXTERNAL_PATH)/package/eiwd/patches/*.patch)

# Standard-Makro aufrufen (generic oder autotools, je nach Buildsystem)
# Wenn eiwd ein Autotools-Projekt ist:
$(eval $(autotools-package))
