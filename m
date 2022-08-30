Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076E5A6CC8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:08:36 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6bC-00007x-Ss
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AE-0007WN-SV
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AC-000582-3N
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7Aabb3Rs/Vtl9UAkqaJX6Ii9VWTpYWxu6pHj/Cz2M8=;
 b=a2AMDDW091X31cITsNdUSvapwcJbicMnWaxGOVxtIWLTIM4r7V8Z4LrbLHYn0YH/D345NQ
 gW+bUfKepuseP/cBMAm4aOmcqWQD+JBE8QWSvnAkU9Vp3i+jBwQcKt2l4yoAsqB9Y/sjWX
 d63F5nUmyoq/O0CsIiVXIwMkHuRGVJs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-XKMGWw3eO7-CaFiCdsP75w-1; Tue, 30 Aug 2022 14:40:36 -0400
X-MC-Unique: XKMGWw3eO7-CaFiCdsP75w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A92D03800C24;
 Tue, 30 Aug 2022 18:40:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9EB1415117;
 Tue, 30 Aug 2022 18:40:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PULL 12/23] tests/qtest: libqos: Rename malloc.h to libqos-malloc.h
Date: Tue, 30 Aug 2022 20:40:01 +0200
Message-Id: <20220830184012.77978-13-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The qtest/libqos directory is included via the "-I" option to search
for header files when building qtest. Unfortunately the malloc.h has
a name conflict with the standard libc header, leading to a build
failure on the Windows host, due to the MinGW libc stdlib.h header
file includes malloc.h and it now gets wrongly pointed to the one
in the qtest/libqos directory.

Rename "qtest/libqos/malloc.h" to "qtest/libqos/libqos-malloc.h" to
avoid the namespace pollution.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-26-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/generic-pcihost.h             | 2 +-
 tests/qtest/libqos/{malloc.h => libqos-malloc.h} | 0
 tests/qtest/libqos/libqos.h                      | 2 +-
 tests/qtest/libqos/malloc-pc.h                   | 2 +-
 tests/qtest/libqos/malloc-spapr.h                | 2 +-
 tests/qtest/libqos/pci-pc.h                      | 2 +-
 tests/qtest/libqos/pci-spapr.h                   | 2 +-
 tests/qtest/libqos/qgraph.h                      | 2 +-
 tests/qtest/libqos/qos_external.h                | 2 +-
 tests/qtest/libqos/rtas.h                        | 2 +-
 tests/qtest/libqos/virtio.h                      | 2 +-
 tests/qtest/e1000e-test.c                        | 2 +-
 tests/qtest/fuzz/qos_fuzz.c                      | 2 +-
 tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c       | 2 +-
 tests/qtest/libqos/arm-n800-machine.c            | 2 +-
 tests/qtest/libqos/arm-raspi2-machine.c          | 2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c       | 2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c        | 2 +-
 tests/qtest/libqos/arm-virt-machine.c            | 2 +-
 tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  | 2 +-
 tests/qtest/libqos/e1000e.c                      | 2 +-
 tests/qtest/libqos/{malloc.c => libqos-malloc.c} | 2 +-
 tests/qtest/libqos/qos_external.c                | 2 +-
 tests/qtest/libqos/virtio-mmio.c                 | 2 +-
 tests/qtest/libqos/virtio-pci.c                  | 2 +-
 tests/qtest/qos-test.c                           | 2 +-
 tests/qtest/libqos/meson.build                   | 2 +-
 28 files changed, 27 insertions(+), 27 deletions(-)
 rename tests/qtest/libqos/{malloc.h => libqos-malloc.h} (100%)
 rename tests/qtest/libqos/{malloc.c => libqos-malloc.c} (99%)

diff --git a/tests/qtest/libqos/generic-pcihost.h b/tests/qtest/libqos/generic-pcihost.h
index c693c769df..6493a8712a 100644
--- a/tests/qtest/libqos/generic-pcihost.h
+++ b/tests/qtest/libqos/generic-pcihost.h
@@ -14,7 +14,7 @@
 #define LIBQOS_GENERIC_PCIHOST_H
 
 #include "pci.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 
 typedef struct QGenericPCIBus {
diff --git a/tests/qtest/libqos/malloc.h b/tests/qtest/libqos/libqos-malloc.h
similarity index 100%
rename from tests/qtest/libqos/malloc.h
rename to tests/qtest/libqos/libqos-malloc.h
diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h
index ba7df448ca..9b4dd509f0 100644
--- a/tests/qtest/libqos/libqos.h
+++ b/tests/qtest/libqos/libqos.h
@@ -3,7 +3,7 @@
 
 #include "../libqtest.h"
 #include "pci.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 typedef struct QOSState QOSState;
 
diff --git a/tests/qtest/libqos/malloc-pc.h b/tests/qtest/libqos/malloc-pc.h
index d8d79853c8..e531473601 100644
--- a/tests/qtest/libqos/malloc-pc.h
+++ b/tests/qtest/libqos/malloc-pc.h
@@ -13,7 +13,7 @@
 #ifndef LIBQOS_MALLOC_PC_H
 #define LIBQOS_MALLOC_PC_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags);
 
diff --git a/tests/qtest/libqos/malloc-spapr.h b/tests/qtest/libqos/malloc-spapr.h
index f99572fd71..f544c0d611 100644
--- a/tests/qtest/libqos/malloc-spapr.h
+++ b/tests/qtest/libqos/malloc-spapr.h
@@ -8,7 +8,7 @@
 #ifndef LIBQOS_MALLOC_SPAPR_H
 #define LIBQOS_MALLOC_SPAPR_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 void spapr_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags);
 
diff --git a/tests/qtest/libqos/pci-pc.h b/tests/qtest/libqos/pci-pc.h
index 49ec9507f2..849bd493de 100644
--- a/tests/qtest/libqos/pci-pc.h
+++ b/tests/qtest/libqos/pci-pc.h
@@ -14,7 +14,7 @@
 #define LIBQOS_PCI_PC_H
 
 #include "pci.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 
 typedef struct QPCIBusPC {
diff --git a/tests/qtest/libqos/pci-spapr.h b/tests/qtest/libqos/pci-spapr.h
index 20a43718b7..3dbf1e58ae 100644
--- a/tests/qtest/libqos/pci-spapr.h
+++ b/tests/qtest/libqos/pci-spapr.h
@@ -8,7 +8,7 @@
 #ifndef LIBQOS_PCI_SPAPR_H
 #define LIBQOS_PCI_SPAPR_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "pci.h"
 #include "qgraph.h"
 
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 871740c0dc..6e94824d09 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -21,7 +21,7 @@
 
 #include <gmodule.h>
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 /* maximum path length */
 #define QOS_PATH_MAX_ELEMENT_SIZE 50
diff --git a/tests/qtest/libqos/qos_external.h b/tests/qtest/libqos/qos_external.h
index 8446e3df0b..ea37364887 100644
--- a/tests/qtest/libqos/qos_external.h
+++ b/tests/qtest/libqos/qos_external.h
@@ -21,7 +21,7 @@
 
 #include "qgraph.h"
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-types-qom.h"
 
diff --git a/tests/qtest/libqos/rtas.h b/tests/qtest/libqos/rtas.h
index f38f99dfab..be8353d505 100644
--- a/tests/qtest/libqos/rtas.h
+++ b/tests/qtest/libqos/rtas.h
@@ -5,7 +5,7 @@
 
 #ifndef LIBQOS_RTAS_H
 #define LIBQOS_RTAS_H
-#include "malloc.h"
+#include "libqos-malloc.h"
 
 int qrtas_get_time_of_day(QTestState *qts, QGuestAllocator *alloc,
                           struct tm *tm, uint32_t *ns);
diff --git a/tests/qtest/libqos/virtio.h b/tests/qtest/libqos/virtio.h
index b8bd06e1b8..7adc7cbd10 100644
--- a/tests/qtest/libqos/virtio.h
+++ b/tests/qtest/libqos/virtio.h
@@ -10,7 +10,7 @@
 #ifndef LIBQOS_VIRTIO_H
 #define LIBQOS_VIRTIO_H
 
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "standard-headers/linux/virtio_ring.h"
 
 #define QVIRTIO_F_BAD_FEATURE           0x40000000ull
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index c98779c7c0..4cdd8238f2 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -31,7 +31,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
-#include "libqos/malloc.h"
+#include "libqos/libqos-malloc.h"
 #include "libqos/e1000e.h"
 
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index c856d3d500..3a3d9c16dd 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -23,7 +23,7 @@
 #include "qemu/main-loop.h"
 
 #include "tests/qtest/libqtest.h"
-#include "tests/qtest/libqos/malloc.h"
+#include "tests/qtest/libqos/libqos-malloc.h"
 #include "tests/qtest/libqos/qgraph.h"
 #include "tests/qtest/libqos/qgraph_internal.h"
 #include "tests/qtest/libqos/qos_external.h"
diff --git a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
index c8a3ea11eb..ab24add8eb 100644
--- a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
+++ b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-imx25-pdk-machine.c b/tests/qtest/libqos/arm-imx25-pdk-machine.c
index 54d0c95330..8fe128fae8 100644
--- a/tests/qtest/libqos/arm-imx25-pdk-machine.c
+++ b/tests/qtest/libqos/arm-imx25-pdk-machine.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "../libqtest.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "i2c.h"
 
diff --git a/tests/qtest/libqos/arm-n800-machine.c b/tests/qtest/libqos/arm-n800-machine.c
index ecd46b1daf..4e5afe0164 100644
--- a/tests/qtest/libqos/arm-n800-machine.c
+++ b/tests/qtest/libqos/arm-n800-machine.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "../libqtest.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "i2c.h"
 
diff --git a/tests/qtest/libqos/arm-raspi2-machine.c b/tests/qtest/libqos/arm-raspi2-machine.c
index 0a2943440b..367c6c17a5 100644
--- a/tests/qtest/libqos/arm-raspi2-machine.c
+++ b/tests/qtest/libqos/arm-raspi2-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-sabrelite-machine.c b/tests/qtest/libqos/arm-sabrelite-machine.c
index ec19a01660..94f6a20fc7 100644
--- a/tests/qtest/libqos/arm-sabrelite-machine.c
+++ b/tests/qtest/libqos/arm-sabrelite-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-smdkc210-machine.c b/tests/qtest/libqos/arm-smdkc210-machine.c
index 4bff249ee8..9bbce924ea 100644
--- a/tests/qtest/libqos/arm-smdkc210-machine.c
+++ b/tests/qtest/libqos/arm-smdkc210-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
index 139eaba142..4e87405b58 100644
--- a/tests/qtest/libqos/arm-virt-machine.c
+++ b/tests/qtest/libqos/arm-virt-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "virtio-mmio.h"
 #include "generic-pcihost.h"
diff --git a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
index 3be80020a6..daac762a06 100644
--- a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
+++ b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "../libqtest.h"
 #include "qemu/module.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "sdhci.h"
 
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index f87e0e84b2..fc14b07884 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -23,7 +23,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "e1000e.h"
 
diff --git a/tests/qtest/libqos/malloc.c b/tests/qtest/libqos/libqos-malloc.c
similarity index 99%
rename from tests/qtest/libqos/malloc.c
rename to tests/qtest/libqos/libqos-malloc.c
index f0c8f950c8..d7566972c4 100644
--- a/tests/qtest/libqos/malloc.c
+++ b/tests/qtest/libqos/libqos-malloc.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qemu/host-utils.h"
 
 typedef struct MemBlock {
diff --git a/tests/qtest/libqos/qos_external.c b/tests/qtest/libqos/qos_external.c
index b7a0b873a3..c6bb8bff09 100644
--- a/tests/qtest/libqos/qos_external.c
+++ b/tests/qtest/libqos/qos_external.c
@@ -24,7 +24,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/module.h"
 #include "qapi/qmp/qlist.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "qgraph_internal.h"
 #include "qos_external.h"
diff --git a/tests/qtest/libqos/virtio-mmio.c b/tests/qtest/libqos/virtio-mmio.c
index a6cca8613b..bd0b1d890b 100644
--- a/tests/qtest/libqos/virtio-mmio.c
+++ b/tests/qtest/libqos/virtio-mmio.c
@@ -12,7 +12,7 @@
 #include "qemu/module.h"
 #include "virtio.h"
 #include "virtio-mmio.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "qgraph.h"
 #include "standard-headers/linux/virtio_ring.h"
 
diff --git a/tests/qtest/libqos/virtio-pci.c b/tests/qtest/libqos/virtio-pci.c
index 67c2498c84..485b8f6b7e 100644
--- a/tests/qtest/libqos/virtio-pci.c
+++ b/tests/qtest/libqos/virtio-pci.c
@@ -13,7 +13,7 @@
 #include "virtio-pci.h"
 #include "pci.h"
 #include "pci-pc.h"
-#include "malloc.h"
+#include "libqos-malloc.h"
 #include "malloc-pc.h"
 #include "qgraph.h"
 #include "standard-headers/linux/virtio_ring.h"
diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index f97d0a08fd..831db5cf2a 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -25,7 +25,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qapi-visit-qom.h"
-#include "libqos/malloc.h"
+#include "libqos/libqos-malloc.h"
 #include "libqos/qgraph.h"
 #include "libqos/qgraph_internal.h"
 #include "libqos/qos_external.h"
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index fd5d6e5ae1..cff83c86d9 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -6,7 +6,7 @@ libqos_srcs = files(
         'qos_external.c',
         'pci.c',
         'fw_cfg.c',
-        'malloc.c',
+        'libqos-malloc.c',
         'libqos.c',
         'sdhci-cmd.c',
 
-- 
2.31.1


