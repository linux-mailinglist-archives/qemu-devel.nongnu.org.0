Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF6613ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCg-0008Ka-Gd; Mon, 31 Oct 2022 16:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCJ-00080A-JJ; Mon, 31 Oct 2022 16:16:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCH-0001CR-5P; Mon, 31 Oct 2022 16:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q7UkqegOB8CHBfu3yfJiKQqOB3ZnHGphy6lCk4S2S+Y=; b=Q/iq/QvZyOuirlvC/wllthQxIy
 ADZmb2b9QnKuZhHWv2pJcGPTIbtCF3orK6AyJN8ib7qRg0WA9SehdXZG7FHik1aKtcEFPp2d6KIiO
 nIR7+3npVk0ElZmFOQwLMjsvCfc97+up71iPKmIJyQpOQZEYc4RGXAiy4GRrpGMx53983OuLkqeZH
 QIwOnRc7pwIxDBD13QTXY1gyDi/L3xCazQBVEJ+Tbtwlwv9kqtwPJfShEV4SMinB7vpr94UY7WfkQ
 Ba4AJsudUXp1OnTru9O58F5XResryJGHbyGWAMfiViYG9NSXWgLF5wScqt8utN5I/2QO+JIzQtDSC
 tI3Iux5twphQHQ0Czgze/l1LFM1CBID3XTtptR/XbIb169MIfZ82LnJX5L6gYoA4A26wi5oiIHd8l
 YFe0Ls/AtT+LnN6PMGWNtXdePmSZy3MuveJi8ScbTrBti/TwpgFXSj8+32I5WokmB/+LLT+yukwNc
 gES/FHIjdrHBtGKot7Y3oDfEdAJL/SwRbQzYlJgHC5uYo2ErlIxLBY+CBO3h9K38hEHs2kmqny5bT
 yNhqPY/ff+Njkx2GEJHCkFDpwY0LLA6TmnADe8Qv8k6K2Tid8esmI2gXHtjE+EQm+A2ZGQA/VcxJ+
 7pHPinPxzvcJ4uSGmfj37MzP48+wo2T27B7M82H8U=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC8-0003Dd-H0; Mon, 31 Oct 2022 20:15:44 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:32 +0000
Message-Id: <20221031201435.677168-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 11/14] hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

All that is left in mac.h now belongs to the nvram emulation so rename
it accordingly and only include it where it is really used.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <b82449369f718c0e207fe8c332fab550fa0230c0.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
index 9f424bceb1..223afc2e13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1327,6 +1327,7 @@ F: hw/nvram/mac_nvram.c
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
index e4c7303859..95945ac0f4 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
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
index c75c59fe3e..eb597bbe20 100644
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
index ae8e0ff30a..23d9268281 100644
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
2.30.2


