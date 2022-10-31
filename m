Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5F613ED2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCF-0007sz-2V; Mon, 31 Oct 2022 16:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCB-0007qQ-7M; Mon, 31 Oct 2022 16:15:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC9-0001A9-9W; Mon, 31 Oct 2022 16:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RxsDWQAdJStnEC8K4Ef2GQKl+HhuRZ0ZJ+Jb5gKchas=; b=1DlRB4h6tk2vG3cVe7nfRy7t9/
 X6L7KpnjawdxN91hYuyvBRdK20sttKatef4mrBPNoYB/J564s/T4XlFXnD2APvu+ozE9SQMvwkAbz
 XZrJIIIv90TftE5Hh7dOr3fvzt05zT44+cpnLH3T2lxNyJh9b2/ZWt3GS214apH3bOu2g2iNkZHo5
 JzWiWYpbAHbedb04yHBvs+Hf3D9i1+wajW5sRzoQBrIguaDdMfPQ/ElrtS+oozQoYHoR2QU/8awLJ
 k154ZiDdYedRd4fWkehhBEzwwZMQQ7KGlBWFlyC19Od53yt+mE51qCHRFQhXhQGWBZexTZv6257+J
 TkV7UXxOEa+8Odbpk2X1WzwoKaKMm3mNy8scpT+fEk48NZuxXgRPMZAZbxkGy2ul67i0hR9J++FVG
 VFgsOt3sILVNXW8tlYnI1k1eSSfstjLUBwlw8Cm72nAz6LaovPScqICBA7E4a5vyQBJqwX5tT//kO
 G9f88YpMaNZ339GSFix+gc8AnFm5HuiXKxXRTjUwafjWZdRBW0x3TtEfZHoGGqouEDHkV7kghWLk3
 Km6A8aGqSgLP5IzGK9al53vUA3vJM9I5wWxIVxyGykgU1nNHHzcDGFih06D6Zh/qwjVBhyhJAQa3j
 UJLEbvabTrvg6iqgC6GMt8G8mld9sZDAZRG4IGUE0=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC0-0003Dd-4z; Mon, 31 Oct 2022 20:15:36 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:30 +0000
Message-Id: <20221031201435.677168-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 09/14] hw/ppc/mac.h: Move grackle-pcihost type declaration out
 to a header
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <b133a84dfd38366eea2bb11b7ca433758efacc10.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 MAINTAINERS                   |  1 +
 hw/pci-host/grackle.c         | 14 +----------
 hw/ppc/mac.h                  |  3 ---
 hw/ppc/mac_oldworld.c         |  1 +
 include/hw/pci-host/grackle.h | 44 +++++++++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/pci-host/grackle.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c41d8d65e2..9f424bceb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1344,6 +1344,7 @@ F: hw/intc/heathrow_pic.c
 F: hw/input/adb*
 F: include/hw/intc/heathrow_pic.h
 F: include/hw/input/adb*
+F: include/hw/pci-host/grackle.h
 F: pc-bios/qemu_vga.ndrv
 
 PReP
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index b05facf463..e4c7303859 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci_host.h"
 #include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
@@ -33,18 +32,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "qom/object.h"
-
-OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
-
-struct GrackleState {
-    PCIHostState parent_obj;
-
-    uint32_t ofw_addr;
-    qemu_irq irqs[4];
-    MemoryRegion pci_mmio;
-    MemoryRegion pci_hole;
-    MemoryRegion pci_io;
-};
+#include "hw/pci-host/grackle.h"
 
 /* Don't know if this matches real hardware, but it agrees with OHW.  */
 static int pci_grackle_map_irq(PCIDevice *pci_dev, int irq_num)
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 55cb02c990..fe77a6c6db 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -35,9 +35,6 @@
 #define KERNEL_LOAD_ADDR 0x01000000
 #define KERNEL_GAP       0x00100000
 
-/* Grackle PCI */
-#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
-
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
 OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index f323a49d7a..47a1abf248 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -38,6 +38,7 @@
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/pci-host/grackle.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
diff --git a/include/hw/pci-host/grackle.h b/include/hw/pci-host/grackle.h
new file mode 100644
index 0000000000..7ad3a779f0
--- /dev/null
+++ b/include/hw/pci-host/grackle.h
@@ -0,0 +1,44 @@
+/*
+ * QEMU Grackle PCI host (heathrow OldWorld PowerMac)
+ *
+ * Copyright (c) 2006-2007 Fabrice Bellard
+ * Copyright (c) 2007 Jocelyn Mayer
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef GRACKLE_H
+#define GRACKLE_H
+
+#include "hw/pci/pci_host.h"
+
+#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
+OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
+
+struct GrackleState {
+    PCIHostState parent_obj;
+
+    uint32_t ofw_addr;
+    qemu_irq irqs[4];
+    MemoryRegion pci_mmio;
+    MemoryRegion pci_hole;
+    MemoryRegion pci_io;
+};
+
+#endif
-- 
2.30.2


