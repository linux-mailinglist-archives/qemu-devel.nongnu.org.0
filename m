Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2054743B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:28:41 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzIG-0006er-KQ
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTa-0006Ap-G6
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTY-0006lB-2h
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:17 -0400
Received: by mail-wr1-x433.google.com with SMTP id v14so1490652wra.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xDd2IWWipz5tS1XrqxuI9D9wP2W2TyPn8FKseiRH7o=;
 b=GPDYFHPr0G/BXD6utf+XpVhHaTM6/T7R71CIhuSGB4Mg7AYJ/Z63D2iapZLgbPdB0y
 M/OZVUc8T/hBEgSmyelU0NXTw/47ZjrfmRDf5l5ZSVtliTmYW7NyMew64l99ZvNGgnUz
 OQ1hlCrUczWlvN4qHoFBrGC/sdTx1VEn3x0cbcV0Gflpki4iy0Go87IaQ1ysX9Td0NF4
 AfkO7jj4oJ8g60tL7/v7ZCrnc3g2/BAEd5HBFIjVbSkyqEMFgi7FDe4FnCS386lxzsGg
 xrktMR77t0G9ZHquE6ZW0N5pBhPbPq/CDbgbzyJa7Cj4JDtXiNgpvF7Xtc0HVqjOMEhm
 /69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xDd2IWWipz5tS1XrqxuI9D9wP2W2TyPn8FKseiRH7o=;
 b=m9eBmtesneMFZ5Wn1kEjazXWJNl/TRrZY8DoqWZ6l6CUBdMouMTG47DJeixqLcGc+Y
 APAmvs6QjZTy4PEzSHPwa0oWnyWuIe/4Fo+uzkHIcFhfzcpGeRIfoiMZJPKUK6bIPdBO
 AhVZYi5i97C7MawcOJPy+2QvcERMyL7UoFE20yJJs9Wq9fNsMhVgPq34Y6bYhbn1Qtl6
 Jc865g+d72oA6p9bM3QxJkhhtU+E/Avg9jfj90U0Peno9ozcRKvDLNk8ffRX4Q0tfZ7Y
 /ZoDApwcCAbjeGZnFhYR8cg+CGw5Z19Z88VIULrUtmu6p9IW6RiaGFl2rFCAEfCoc9YT
 HfWQ==
X-Gm-Message-State: AOAM531kDoCZZXSuCcYJ0ougNflhVFuMylTWZEeKWDIvBNVI8EoiMuwg
 rJqo03vlRdSfp6vW1kRBRVYjAxG+Isc=
X-Google-Smtp-Source: ABdhPJzIo/i1dqOHibe85SC8mdIdzc63+JxlbObq7Cnb54hPqXNK4BAtHUM84JEScrfHXSpKU5MBgg==
X-Received: by 2002:adf:a4d8:0:b0:219:ecd4:159b with SMTP id
 h24-20020adfa4d8000000b00219ecd4159bmr5382242wrb.431.1654943774618; 
 Sat, 11 Jun 2022 03:36:14 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 l2-20020a5d6682000000b0020e6ce4dabdsm2145027wru.103.2022.06.11.03.36.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 35/49] hw/isa/piix3: QOM'ify PCI device creation and wiring
Date: Sat, 11 Jun 2022 12:32:58 +0200
Message-Id: <20220611103312.67773-36-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

PCI interrupt wiring was performed in create() functions which are
obsolete. Move these tasks into QOM functions to modernize the code.

In order to avoid duplicate checking for xen_enabled() the realize
methods are now split.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-10-shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d50a07b58b..89064eb837 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/range.h"
+#include "qapi/error.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -278,7 +279,7 @@ static const MemoryRegionOps rcr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN
 };
 
-static void piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
 
@@ -317,7 +318,6 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-    k->realize      = piix3_realize;
     k->vendor_id    = PCI_VENDOR_ID_INTEL;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -343,11 +343,28 @@ static const TypeInfo piix3_pci_type_info = {
     },
 };
 
+static void piix3_realize(PCIDevice *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+
+    pci_piix3_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+                 piix3, PIIX_NUM_PIRQS);
+    pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
+};
+
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config;
+    k->realize = piix3_realize;
 }
 
 static const TypeInfo piix3_info = {
@@ -356,11 +373,33 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
+static void piix3_xen_realize(PCIDevice *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+
+    pci_piix3_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    /*
+     * Xen supports additional interrupt routes from the PCI devices to
+     * the IOAPIC: the four pins of each PCI device on the bus are also
+     * connected to the IOAPIC directly.
+     * These additional routes can be discovered through ACPI.
+     */
+    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
+                 piix3, XEN_PIIX_NUM_PIRQS);
+};
+
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
+    k->realize = piix3_xen_realize;
 };
 
 static const TypeInfo piix3_xen_info = {
@@ -382,27 +421,11 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
+    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                     : TYPE_PIIX3_DEVICE;
 
-    /*
-     * Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI.
-     */
-    if (xen_enabled()) {
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
-                                                  TYPE_PIIX3_XEN_DEVICE);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
-                     piix3, XEN_PIIX_NUM_PIRQS);
-    } else {
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
-                                                  TYPE_PIIX3_DEVICE);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
-                     piix3, PIIX_NUM_PIRQS);
-        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-    }
+    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+    piix3 = PIIX3_PCI_DEVICE(pci_dev);
     *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
-- 
2.36.1


