Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260D4CFBB6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:44:25 +0100 (CET)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAqm-0007fK-CU
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:44:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALv-00039L-Fr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:32 -0500
Received: from [2a00:1450:4864:20::436] (port=35504
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALt-0004JY-NQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id b5so22396552wrr.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RwdUgpkZN5CktV/umLjJJE5bTR8gDxBJwZfTcsY4jPo=;
 b=SaUhlxpUGyem0CGjSzZVcdlYjrl+q+2UPGvjfLncHIZ44tLxHzFeiHUHdMNr2PTsPM
 iKVdndyxXrms55QzA/tWQRrrnRi4qeVYldyHlP8P7UYHe/QIrloQ2yPCChS/Dh2hKwyK
 P+rab4O+qzzc4O0psCGaxH3RTYX7DfPzZ3KDSQ9FJU6w9XzfVKBQV1lyBt/2Fxal6nft
 LaAjoMehayoh7DwKAIsz7ZPg9Apw2CrHJy85zu/qAXhnw935pPNkX8MtEtcjX6ugQWtt
 /fmYVO2qmGktrcSQxXvrSqnEOunG86Zqslz8KSCSm/DQW78wsx87+zcicptiKY/oNs8p
 EENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RwdUgpkZN5CktV/umLjJJE5bTR8gDxBJwZfTcsY4jPo=;
 b=XZwq3LDAHW0Q81YKridnql39BMi2dHX12GZvVwwv9/tPJGulXf9+BCkSgJfjO2387L
 7fisXUC5rBMCBQ7Pp5Fm1IKKZFDw14vXLgHGEDTf6MfP9rz+ONjA7AGNv9AC9zTnBs5t
 FGPYW4mGnIYupGSViJS5S+fFxj+PslleRAnPpOGmSauzseK5774p9S14JQxQTaj/Cvvj
 z9zZcdHA0qGqd0ivieDXlEyhwhqDv5q2JCdy4kls4CXPJRZqtdlTw6i4+05m2moeWok+
 V7zSueDajSN++odwK1fcCTWJxLBwmG47jPJlwkPYwZKPV23MDEn+uwpAi2XfdJLQ+xvF
 rcgw==
X-Gm-Message-State: AOAM5338S+HnOPDnK7g7ofKb+YvLmpO5vFDcTEPNHU4e33iYQ7YHrZjw
 lf80qo63ZC0Dd3P3159rXHmwNrmDVcE=
X-Google-Smtp-Source: ABdhPJwMOzaIzLwXjaxDPZPcH1w1FVD743VajhYufQ+dPMhJ2TAwUqp19UGv6+dHmnCR6r1xXJfkqw==
X-Received: by 2002:adf:9144:0:b0:1f1:eb7c:be75 with SMTP id
 j62-20020adf9144000000b001f1eb7cbe75mr4363621wrj.259.1646647948052; 
 Mon, 07 Mar 2022 02:12:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm12628341wmh.33.2022.03.07.02.12.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] malta: Move PCI interrupt handling from gt64xxx_pci to
 piix4
Date: Mon,  7 Mar 2022 11:11:55 +0100
Message-Id: <20220307101207.90369-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Handling PCI interrupts in piix4 increases cohesion and reduces differences
between piix4 and piix3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220217101924.15347-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c         | 55 ++++++++++++++++++++++++++++++++++++++
 hw/mips/gt64xxx_pci.c  | 60 ++++--------------------------------------
 hw/mips/malta.c        |  6 +----
 include/hw/mips/mips.h |  2 +-
 4 files changed, 62 insertions(+), 61 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0fe7b69bc4..196b56e69c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,6 +45,7 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
+    qemu_irq i8259[ISA_NUM_IRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -54,6 +55,27 @@ struct PIIX4State {
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 
+static void piix4_set_irq(void *opaque, int irq_num, int level)
+{
+    int i, pic_irq, pic_level;
+    qemu_irq *pic = opaque;
+    PCIBus *bus = pci_get_bus(piix4_dev);
+
+    /* now we change the pic irq level according to the piix irq mappings */
+    /* XXX: optimize */
+    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
+    if (pic_irq < 16) {
+        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+        pic_level = 0;
+        for (i = 0; i < 4; i++) {
+            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
+                pic_level |= pci_bus_get_irq_level(bus, i);
+            }
+        }
+        qemu_set_irq(pic[pic_irq], pic_level);
+    }
+}
+
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -248,8 +270,34 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
+    PIIX4State *s;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -257,6 +305,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
+    s = PIIX4_PCI_DEVICE(pci);
     if (isa_bus) {
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
@@ -271,5 +320,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
+
+    for (int i = 0; i < ISA_NUM_IRQS; i++) {
+        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
+    }
+
     return dev;
 }
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 4cbd0911f5..eb205d6d70 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -29,7 +29,6 @@
 #include "hw/mips/mips.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
-#include "hw/southbridge/piix.h"
 #include "migration/vmstate.h"
 #include "hw/intc/i8259.h"
 #include "hw/irq.h"
@@ -981,53 +980,6 @@ static const MemoryRegionOps isd_mem_ops = {
     },
 };
 
-static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
-static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
-    PCIBus *bus = pci_get_bus(piix4_dev);
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < 4; i++) {
-            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_bus_get_irq_level(bus, i);
-            }
-        }
-        qemu_set_irq(pic[pic_irq], pic_level);
-    }
-}
-
-
 static void gt64120_reset(DeviceState *dev)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
@@ -1204,7 +1156,7 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                           "gt64120-isd", 0x1000);
 }
 
-PCIBus *gt64120_register(qemu_irq *pic)
+PCIBus *gt64120_register(void)
 {
     GT64120State *d;
     PCIHostState *phb;
@@ -1215,12 +1167,10 @@ PCIBus *gt64120_register(qemu_irq *pic)
     phb = PCI_HOST_BRIDGE(dev);
     memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
     address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
-    phb->bus = pci_register_root_bus(dev, "pci",
-                                     gt64120_pci_set_irq, gt64120_pci_map_irq,
-                                     pic,
-                                     &d->pci0_mem,
-                                     get_system_io(),
-                                     PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
+    phb->bus = pci_root_bus_new(dev, "pci",
+                                &d->pci0_mem,
+                                get_system_io(),
+                                PCI_DEVFN(18, 0), TYPE_PCI_BUS);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index b770b8d367..13254dbc89 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -97,7 +97,6 @@ struct MaltaState {
 
     Clock *cpuclk;
     MIPSCPSState cps;
-    qemu_irq i8259[ISA_NUM_IRQS];
 };
 
 static struct _loaderparams {
@@ -1391,7 +1390,7 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    pci_bus = gt64120_register(s->i8259);
+    pci_bus = gt64120_register();
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
      * exception when accessing invalid memory. Create an empty slot to
@@ -1404,9 +1403,6 @@ void mips_malta_init(MachineState *machine)
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
 
     /* generate SPD EEPROM data */
     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 6c9c8805f3..ff88942e63 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -10,7 +10,7 @@
 #include "exec/memory.h"
 
 /* gt64xxx.c */
-PCIBus *gt64120_register(qemu_irq *pic);
+PCIBus *gt64120_register(void);
 
 /* bonito.c */
 PCIBus *bonito_init(qemu_irq *pic);
-- 
2.34.1


