include $(TOPDIR)/rules.mk

PKG_NAME:=writefreely
PKG_VERSION:=0.15.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/writefreely/writefreely/archive/v$(PKG_VERSION).tar.gz
PKG_HASH:=4a1d77b5c9ad77e92665a4a9cbdeb88d5f701be483c4f25487ce5ec7b6e9bfb0

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=OpenWrt Community

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/writefreely/writefreely
GO_PKG_BUILD_PKG:=github.com/writefreely/writefreely/cmd/writefreely

include $(INCLUDE_DIR)/package.mk
include ../../lang/golang/golang-package.mk

define Package/writefreely
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Blog
  TITLE:=WriteFreely blog platform
  URL:=https://writefreely.org
  DEPENDS:=$(GO_ARCH_DEPENDS) +sqlite3
endef

define Package/writefreely/description
  WriteFreely is a clean, minimalist publishing platform made for writers.
endef

define Package/writefreely/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/writefreely $(1)/usr/bin/
	
	$(INSTALL_DIR) $(1)/etc/writefreely
	$(INSTALL_DIR) $(1)/usr/share/writefreely
endef

$(eval $(call BuildPackage,writefreely))
