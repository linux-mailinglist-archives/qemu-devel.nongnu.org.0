Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C8124D3CE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:21:01 +0200 (CEST)
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k956S-0006rM-SJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94En-0003uc-FP
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53329
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ee-0001wY-42
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jp4Vc++NqZXWmm+ZKBEYgQiuVXAomSlPhlsGBoVMpnc=;
 b=REetDdcr6f6rm5vJqOFV1gKPL7lzWXxfCzKDy6wKRHbrSVeEcVCpLWlGPXx6jEE4+ZZms5
 V2JmVn1iAwtUpwOCGryly+Sfl58aZDQn1HTANTZhuEAwdKU7C5RxejHwXNmy32ZjkHdGpB
 PpSNBcnMl901LghD+BmZ8TB1SEtD6k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-O3EIbB7ROpCegusiiL-u2g-1; Fri, 21 Aug 2020 06:25:20 -0400
X-MC-Unique: O3EIbB7ROpCegusiiL-u2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 512FB801AEE
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAED7AECB
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 134/152] meson: plugins
Date: Fri, 21 Aug 2020 06:23:11 -0400
Message-Id: <20200821102329.29777-135-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 01:00:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now link arguments end up in Makefile.target, they will move to the
right place soon.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile              |  8 +-------
 Makefile.target       | 12 ++++++++++--
 meson.build           |  5 +++++
 plugins/Makefile.objs | 21 ---------------------
 plugins/meson.build   |  5 +++++
 5 files changed, 21 insertions(+), 30 deletions(-)
 delete mode 100644 plugins/Makefile.objs
 create mode 100644 plugins/meson.build

diff --git a/Makefile b/Makefile
index ca51abfd8c..ae0aa62082 100644
--- a/Makefile
+++ b/Makefile
@@ -433,13 +433,10 @@ endif
 
 ICON_SIZES=16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512
 
-install-includedir:
-	$(INSTALL_DIR) "$(DESTDIR)$(includedir)"
-
 # Needed by "meson install"
 export DESTDIR
 install: all $(if $(BUILD_DOCS),install-doc) \
-	install-datadir install-localstatedir install-includedir \
+	install-datadir install-localstatedir \
 	recurse-install
 ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_PROG) "scripts/qemu-trace-stap" $(DESTDIR)$(bindir)
@@ -465,9 +462,6 @@ endif
 		"$(DESTDIR)$(qemu_desktopdir)/qemu.desktop"
 ifdef CONFIG_GTK
 	$(MAKE) -C po $@
-endif
-ifeq ($(CONFIG_PLUGIN),y)
-	$(INSTALL_DATA) $(SRC_PATH)/include/qemu/qemu-plugin.h "$(DESTDIR)$(includedir)/qemu-plugin.h"
 endif
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
 	set -e; for x in $(KEYMAPS); do \
diff --git a/Makefile.target b/Makefile.target
index c180b4cb38..2b7280b272 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -110,8 +110,6 @@ obj-y += trace/
 #########################################################
 LIBS := $(libs_cpu) $(LIBS)
 
-obj-$(CONFIG_PLUGIN) += plugins/
-
 #########################################################
 # Linux user emulator target
 
@@ -153,6 +151,16 @@ LIBS := $(LIBS) $(VDE_LIBS) $(SLIRP_LIBS)
 LIBS := $(LIBS) $(LIBUSB_LIBS) $(SMARTCARD_LIBS) $(USB_REDIR_LIBS)
 LIBS := $(LIBS) $(VIRGL_LIBS) $(CURSES_LIBS)
 
+ifeq ($(CONFIG_PLUGIN),y)
+ifdef CONFIG_HAS_LD_DYNAMIC_LIST
+LIBS += -Wl,--dynamic-list=$(BUILD_DIR)/qemu-plugins-ld.symbols
+else
+ifdef CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST
+LIBS += -Wl,-exported_symbols_list,$(BUILD_DIR)/qemu-plugins-ld64.symbols
+endif
+endif
+endif
+
 generated-files-y += hmp-commands.h hmp-commands-info.h
 
 endif # CONFIG_SOFTMMU
diff --git a/meson.build b/meson.build
index 5b1608df09..fa47410c29 100644
--- a/meson.build
+++ b/meson.build
@@ -731,6 +731,7 @@ subdir('net')
 subdir('replay')
 subdir('hw')
 subdir('accel')
+subdir('plugins')
 subdir('bsd-user')
 subdir('linux-user')
 
@@ -899,6 +900,10 @@ endforeach
 
 # Other build targets
 
+if 'CONFIG_PLUGIN' in config_host
+  install_headers('include/qemu/qemu-plugin.h')
+endif
+
 if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
 endif
diff --git a/plugins/Makefile.objs b/plugins/Makefile.objs
deleted file mode 100644
index 6f14d91ccb..0000000000
--- a/plugins/Makefile.objs
+++ /dev/null
@@ -1,21 +0,0 @@
-#
-# Plugin Support
-#
-
-obj-y += loader.o
-obj-y += core.o
-obj-y += api.o
-
-# Abuse -libs suffix to only link with --dynamic-list/-exported_symbols_list
-# when the final binary includes the plugin object.
-#
-# Note that simply setting LDFLAGS is not enough: we build binaries that
-# never link plugin.o, and the linker might fail (at least ld64 does)
-# if the symbols in the list are not in the output binary.
-ifdef CONFIG_HAS_LD_DYNAMIC_LIST
-api.o-libs := -Wl,--dynamic-list=$(BUILD_DIR)/qemu-plugins-ld.symbols
-else
-ifdef CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST
-api.o-libs := -Wl,-exported_symbols_list,$(BUILD_DIR)/qemu-plugins-ld64.symbols
-endif
-endif
diff --git a/plugins/meson.build b/plugins/meson.build
new file mode 100644
index 0000000000..9608e5293f
--- /dev/null
+++ b/plugins/meson.build
@@ -0,0 +1,5 @@
+specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
+  'loader.c',
+  'core.c',
+  'api.c',
+)])
-- 
2.26.2



