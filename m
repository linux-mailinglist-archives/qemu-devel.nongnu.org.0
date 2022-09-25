Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917BF5E9347
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:09:00 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRNT-0005so-5A
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtr-0006VE-97; Sun, 25 Sep 2022 08:38:23 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtp-0007Qa-Bf; Sun, 25 Sep 2022 08:38:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D416275A166;
 Sun, 25 Sep 2022 14:38:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 981AF75A163; Sun, 25 Sep 2022 14:38:19 +0200 (CEST)
Message-Id: <201871924d9f289a6e34a82f4866b9da86949488.1664108862.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664108862.git.balaton@eik.bme.hu>
References: <cover.1664108862.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 12/13] hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sun, 25 Sep 2022 14:38:19 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All that is left in mac.h now belongs to the nvram emulation so rename
it accordingly and only include it where it is really used.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 MAINTAINERS                                  |  1 +
 hw/ide/macio.c                               |  1 -
 hw/intc/heathrow_pic.c                       |  1 -
 hw/intc/openpic.c                            |  1 -
 hw/misc/macio/cuda.c                         |  1 -
 hw/misc/macio/gpio.c                         |  1 -
 hw/misc/macio/macio.c                        |  1 -
 hw/misc/macio/pmu.c                          |  1 -
 hw/nvram/mac_nvram.c                         |  2 +-
 hw/pci-host/grackle.c                        |  1 -
 hw/pci-host/uninorth.c                       |  1 -
 hw/ppc/mac_newworld.c                        |  2 +-
 hw/ppc/mac_oldworld.c                        |  1 -
 include/hw/misc/macio/macio.h                |  2 +-
 hw/ppc/mac.h => include/hw/nvram/mac_nvram.h | 11 ++++++-----
 15 files changed, 10 insertions(+), 18 deletions(-)
 rename hw/ppc/mac.h => include/hw/nvram/mac_nvram.h (89%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 738c4eb647..41a4700979 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1328,6 +1328,7 @@ F: hw/nvram/mac_nvram.c
 F: hw/input/adb*
 F: include/hw/misc/macio/
 F: include/hw/misc/mos6522.h
+F: include/hw/nvram/mac_nvram.h
 F: include/hw/ppc/mac_dbdma.h
 F: include/hw/pci-host/uninorth.h
 F: include/hw/input/adb*
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 1c15c37ec5..e604466acb 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ppc/mac.h"
 #include "hw/ppc/mac_dbdma.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c
index cb97c315da..13048a2735 100644
--- a/hw/intc/heathrow_pic.c
+++ b/hw/intc/heathrow_pic.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ppc/mac.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "hw/intc/heathrow_pic.h"
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index b0787e8ee7..c757adbe53 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -32,7 +32,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/ppc/mac.h"
 #include "hw/pci/pci.h"
 #include "hw/ppc/openpic.h"
 #include "hw/ppc/ppc_e500.h"
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 1498113cfc..0d4c13319a 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/input/adb.h"
diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index b1bcf830c3..c8ac5633b2 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/misc/macio/macio.h"
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index f9f0758b03..93a7c7bbc8 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "hw/ppc/mac.h"
 #include "hw/misc/macio/cuda.h"
 #include "hw/pci/pci.h"
 #include "hw/ppc/mac_dbdma.h"
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 336502a84b..70562ed8d0 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -29,7 +29,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/input/adb.h"
diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index 11f2d31cdb..3d9ddda217 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -25,7 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/nvram/chrp_nvram.h"
-#include "hw/ppc/mac.h"
+#include "hw/nvram/mac_nvram.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/cutils.h"
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 5282123004..d9c11d22e0 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci_host.h"
-#include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index d25b62d6a5..aebd44d265 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
 #include "hw/pci/pci.h"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 94a8b72fb1..c0b2173cbd 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -52,7 +52,7 @@
 #include "qapi/error.h"
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
-#include "hw/ppc/mac.h"
+#include "hw/nvram/mac_nvram.h"
 #include "hw/boards.h"
 #include "hw/pci-host/uninorth.h"
 #include "hw/input/adb.h"
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index cfdee21cd2..b96b6cc141 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -30,7 +30,6 @@
 #include "qapi/error.h"
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
-#include "mac.h"
 #include "hw/boards.h"
 #include "hw/input/adb.h"
 #include "sysemu/sysemu.h"
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 26cf15b1ce..95d30a1745 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -33,7 +33,7 @@
 #include "hw/misc/macio/cuda.h"
 #include "hw/misc/macio/gpio.h"
 #include "hw/misc/macio/pmu.h"
-#include "hw/ppc/mac.h"
+#include "hw/nvram/mac_nvram.h"
 #include "hw/ppc/mac_dbdma.h"
 #include "hw/ppc/openpic.h"
 #include "qom/object.h"
diff --git a/hw/ppc/mac.h b/include/hw/nvram/mac_nvram.h
similarity index 89%
rename from hw/ppc/mac.h
rename to include/hw/nvram/mac_nvram.h
index 3e2df262ee..baa9f6a5a6 100644
--- a/hw/ppc/mac.h
+++ b/include/hw/nvram/mac_nvram.h
@@ -1,5 +1,5 @@
 /*
- * QEMU PowerMac emulation shared definitions and prototypes
+ * PowerMac NVRAM emulation
  *
  * Copyright (c) 2004-2007 Fabrice Bellard
  * Copyright (c) 2007 Jocelyn Mayer
@@ -23,8 +23,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef PPC_MAC_H
-#define PPC_MAC_H
+#ifndef MAC_NVRAM_H
+#define MAC_NVRAM_H
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
@@ -47,5 +47,6 @@ struct MacIONVRAMState {
     uint8_t *data;
 };
 
-void pmac_format_nvram_partition (MacIONVRAMState *nvr, int len);
-#endif /* PPC_MAC_H */
+void pmac_format_nvram_partition(MacIONVRAMState *nvr, int len);
+
+#endif /* MAC_NVRAM_H */
-- 
2.30.4


