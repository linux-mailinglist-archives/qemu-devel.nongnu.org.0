Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FDF69905E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSapq-0000a4-Vd; Thu, 16 Feb 2023 04:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap3-000096-U8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:02 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSaoy-0006LH-5f
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=R/q3iDuqVhCg5KamG1/gaK6121rVqYNALR95nOvFIIM=; b=oLgGixB9KUrFrtUZ+phnCDm1Oo
 J83xXMlgkhuKynPxSJUc/VNKIm01d6v8xE0hOSQohVtcyCNnurPuxPLqQRp0QxYxJgr/HAP0sCH6V
 xcEsYxX1zSNA1fD4bps37UzOSsZWNKlpBVdJOItmz8uS7Ly52ov0y/qm+eXTNYBwMvJGD2CVYNsG2
 /qm2f55lLu4sB92EnlG1GUv5oEHAZ7MjGOQY+WDoZEuCMqYpN0EYqz2lglZ9fzbFnXUzIHhKwf2uf
 lfimF/CrZrZTA5fSCGA8CrOf/9m6m4pdzE0fTUVtlO0QU/gDEuXFh5f2Qo2vlsmfeMKRs/v4/ST/l
 Yg8l29pQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao3-00AEF6-0s; Thu, 16 Feb 2023 09:44:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoj-0090CF-1P; Thu, 16 Feb 2023 09:44:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [RFC PATCH v11bis 16/26] hw/xen: Rename xen_common.h to xen_native.h
Date: Thu, 16 Feb 2023 09:44:26 +0000
Message-Id: <20230216094436.2144978-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216094436.2144978-1-dwmw2@infradead.org>
References: <20230216094436.2144978-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

This header is now only for native Xen code, not PV backends that may be
used in Xen emulation. Since the toolstack libraries may depend on the
specific version of Xen headers that they pull in (and will set the
__XEN_TOOLS__ macro to enable internal definitions that they depend on),
the rule is that xen_native.h (and thus the toolstack library headers)
must be included *before* any of the headers in include/hw/xen/interface.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/xen/xen-all.c                           |  1 +
 hw/9pfs/xen-9p-backend.c                      |  1 +
 hw/block/dataplane/xen-block.c                |  3 ++-
 hw/block/xen-block.c                          |  1 -
 hw/i386/pc_piix.c                             |  4 ++--
 hw/i386/xen/xen-hvm.c                         |  8 +++----
 hw/i386/xen/xen_platform.c                    |  7 +++---
 hw/xen/trace-events                           |  2 +-
 hw/xen/xen-mapcache.c                         |  2 +-
 hw/xen/xen-operations.c                       |  2 +-
 hw/xen/xen_pt.c                               |  2 +-
 hw/xen/xen_pt.h                               |  2 +-
 hw/xen/xen_pt_config_init.c                   |  2 +-
 hw/xen/xen_pt_msi.c                           |  4 ++--
 include/hw/xen/xen-hvm-common.h               |  2 +-
 include/hw/xen/xen.h                          | 22 ++++++++++++-------
 include/hw/xen/{xen_common.h => xen_native.h} | 10 ++++++---
 include/hw/xen/xen_pvdev.h                    |  3 ++-
 18 files changed, 46 insertions(+), 32 deletions(-)
 rename include/hw/xen/{xen_common.h => xen_native.h} (98%)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 514bc9eea4..fcdc8364bf 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "hw/xen/xen_native.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pt.h"
 #include "chardev/char.h"
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index d8bb0e847c..74f3a05f88 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -22,6 +22,7 @@
 #include "qemu/config-file.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
+#include "qemu/iov.h"
 #include "fsdev/qemu-fsdev.h"
 
 #define VERSIONS "1"
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 8322a1de82..734da42ea7 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -23,8 +23,9 @@
 #include "qemu/main-loop.h"
 #include "qemu/memalign.h"
 #include "qapi/error.h"
-#include "hw/xen/xen_common.h"
+#include "hw/xen/xen.h"
 #include "hw/block/xen_blkif.h"
+#include "hw/xen/interface/io/ring.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/iothread.h"
 #include "xen-block.h"
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 345b284d70..87299615e3 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -19,7 +19,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 #include "qom/object_interfaces.h"
-#include "hw/xen/xen_common.h"
 #include "hw/block/xen_blkif.h"
 #include "hw/qdev-properties.h"
 #include "hw/xen/xen-block.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..4a4825e81d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,8 +46,6 @@
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
-#include "hw/xen/xen-x86.h"
-#include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
@@ -59,6 +57,8 @@
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen_pt.h"
 #endif
+#include "hw/xen/xen-x86.h"
+#include "hw/xen/xen.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 4219308caf..98f1836708 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -30,10 +30,10 @@ static bool xen_in_migration;
 
 /* Compatibility with older version */
 
-/* This allows QEMU to build on a system that has Xen 4.5 or earlier
- * installed.  This here (not in hw/xen/xen_common.h) because xen/hvm/ioreq.h
- * needs to be included before this block and hw/xen/xen_common.h needs to
- * be included before xen/hvm/ioreq.h
+/* This allows QEMU to build on a system that has Xen 4.5 or earlier installed.
+ * This is here (not in hw/xen/xen_native.h) because xen/hvm/ioreq.h needs to
+ * be included before this block and hw/xen/xen_native.h needs to be included
+ * before xen/hvm/ioreq.h
  */
 #ifndef IOREQ_TYPE_VMWARE_PORT
 #define IOREQ_TYPE_VMWARE_PORT  3
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 319049d80c..dfa1379ec9 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -29,7 +29,6 @@
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
-#include "hw/xen/xen.h"
 #include "net/net.h"
 #include "trace.h"
 #include "sysemu/xen.h"
@@ -39,10 +38,12 @@
 #include "qom/object.h"
 
 #ifdef CONFIG_XEN
-#include "hw/xen/xen_common.h"
-#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen_native.h"
 #endif
 
+/* The rule is that xen_native.h must come first */
+#include "hw/xen/xen.h"
+
 //#define DEBUG_PLATFORM
 
 #ifdef DEBUG_PLATFORM
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 02ca1183da..67a6c41926 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
-# ../../include/hw/xen/xen_common.h
+# ../../include/hw/xen/xen_native.h
 xen_default_ioreq_server(void) ""
 xen_ioreq_server_create(uint32_t id) "id: %u"
 xen_ioreq_server_destroy(uint32_t id) "id: %u"
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 1d0879d234..f7d974677d 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -14,7 +14,7 @@
 
 #include <sys/resource.h>
 
-#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen_native.h"
 #include "qemu/bitmap.h"
 
 #include "sysemu/runstate.h"
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index b2b76c63af..352153c974 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -13,8 +13,8 @@
 #include "qemu/uuid.h"
 #include "qapi/error.h"
 
+#include "hw/xen/xen_native.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen_common.h"
 
 /*
  * If we have new enough libxenctrl then we do not want/need these compat
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 8db0532632..b705aff724 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -59,9 +59,9 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "xen_pt.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-legacy-backend.h"
-#include "xen_pt.h"
 #include "qemu/range.h"
 
 static bool has_igd_gfx_passthru;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index cf10fc7bbf..27fc7bb585 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -1,7 +1,7 @@
 #ifndef XEN_PT_H
 #define XEN_PT_H
 
-#include "hw/xen/xen_common.h"
+#include "hw/xen/xen_native.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cde898b744..0cd9fbd22c 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -15,8 +15,8 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
-#include "hw/xen/xen-legacy-backend.h"
 #include "xen_pt.h"
+#include "hw/xen/xen-legacy-backend.h"
 
 #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
     (((value) & (val_mask)) | ((data) & ~(val_mask)))
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index b71563f98a..09cca4eecb 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -11,9 +11,9 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/xen/xen-legacy-backend.h"
-#include "xen_pt.h"
 #include "hw/i386/apic-msidef.h"
+#include "xen_pt.h"
+#include "hw/xen/xen-legacy-backend.h"
 
 
 #define XEN_PT_AUTO_ASSIGN -1
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index c0b354e591..aeb12e1408 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -7,8 +7,8 @@
 #include "cpu.h"
 #include "hw/pci/pci.h"
 #include "hw/hw.h"
+#include "hw/xen/xen_native.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen_common.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index fcc6c5b522..fe73990db7 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -8,15 +8,21 @@
 #define QEMU_HW_XEN_H
 
 /*
- * As a temporary measure while the headers are being untangled, define
- * __XEN_TOOLS__ here before any Xen headers are included. Otherwise, if
- * the Xen toolstack library headers are later included, they will find
- * some of the "internal" definitions missing and the build will fail. In
- * later commits, we'll end up with a rule that the native libraries have
- * to be included first, which will ensure that the libraries get the
- * version of Xen libraries that they expect.
+ * C files using Xen toolstack libraries will have included those headers
+ * already via xen_native.h, and having __XEM_TOOLS__ defined will have
+ * automatically set __XEN_INTERFACE_VERSION__ to the latest supported
+ * by the *system* Xen headers which were transitively included.
+ *
+ * C files which are part of the internal emulation, and which did not
+ * include xen_native.h, may need this defined so that the Xen headers
+ * imported to include/hw/xen/interface/ will expose the appropriate API
+ * version.
+ *
+ * This is why there's a rule that xen_native.h must be included first.
  */
-#define __XEN_TOOLS__ 1
+#ifndef __XEN_INTERFACE_VERSION__
+#define __XEN_INTERFACE_VERSION__ 0x00040e00
+#endif
 
 #include "exec/cpu-common.h"
 
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_native.h
similarity index 98%
rename from include/hw/xen/xen_common.h
rename to include/hw/xen/xen_native.h
index cb32b36a12..8b01b071e5 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_native.h
@@ -1,5 +1,9 @@
-#ifndef QEMU_HW_XEN_COMMON_H
-#define QEMU_HW_XEN_COMMON_H
+#ifndef QEMU_HW_XEN_NATIVE_H
+#define QEMU_HW_XEN_NATIVE_H
+
+#ifdef __XEN_INTERFACE_VERSION__
+#error In Xen native files, include xen_native.h before other Xen headers
+#endif
 
 /*
  * If we have new enough libxenctrl then we do not want/need these compat
@@ -625,4 +629,4 @@ static inline int xen_set_ioreq_server_state(domid_t dom,
 
 #endif
 
-#endif /* QEMU_HW_XEN_COMMON_H */
+#endif /* QEMU_HW_XEN_NATIVE_H */
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index d8eea353b8..ddad4b9f36 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -1,8 +1,9 @@
 #ifndef QEMU_HW_XEN_PVDEV_H
 #define QEMU_HW_XEN_PVDEV_H
 
+#include "hw/qdev-core.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen_common.h"
+
 /* ------------------------------------------------------------- */
 
 #define XEN_BUFSIZE 1024
-- 
2.39.0


