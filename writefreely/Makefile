include $(TOPDIR)/rules.mk

PKG_NAME:=writefreely
PKG_VERSION:=0.15.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/writefreely/writefreely/archive/refs/tags/v$(PKG_VERSION).tar.gz
# 你需要运行 sha256sum 命令来获取实际的哈希值
PKG_HASH:=skip

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Your Name <your@email.com>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/writefreely/writefreely
GO_PKG_BUILD_PKG:=$(GO_PKG)/cmd/writefreely

include $(INCLUDE_DIR)/package.mk
include ../../lang/golang/golang-package.mk

define Package/writefreely
  SECTION:=net
  CATEGORY:=Network
  TITLE:=WriteFreely publishing platform
  URL:=https://writefreely.org
  DEPENDS:=$(GO_ARCH_DEPENDS) \
    +sqlite3
endef

define Package/writefreely/description
  WriteFreely is a clean, minimalist publishing platform made for writers.
  Create a minimalist, federated blog — whether you want to share your thoughts 
  with the world or just yourself.
endef

define Package/writefreely/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/writefreely $(1)/usr/bin/
	
	$(INSTALL_DIR) $(1)/etc/writefreely
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/config.ini.example $(1)/etc/writefreely/config.ini
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/writefreely.init $(1)/etc/init.d/writefreely
	
	$(INSTALL_DIR) $(1)/usr/share/writefreely
	$(CP) $(PKG_BUILD_DIR)/templates $(1)/usr/share/writefreely/
	$(CP) $(PKG_BUILD_DIR)/static $(1)/usr/share/writefreely/
endef

$(eval $(call BuildPackage,writefreely))
