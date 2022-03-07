Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D544D0071
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:50:55 +0100 (CET)
Received: from localhost ([::1]:53834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDlG-0003Uk-5h
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDex-0004Jc-5M
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:24 -0500
Received: from [2607:f8b0:4864:20::436] (port=34784
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDer-0006so-Mp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:22 -0500
Received: by mail-pf1-x436.google.com with SMTP id g1so13829052pfv.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RwdUgpkZN5CktV/umLjJJE5bTR8gDxBJwZfTcsY4jPo=;
 b=mBXYZxSqEcZxjbfewbJu94U3TlPL2DAXDQncY3W2F9UyybP2F3fUhOIPV3idQeuWgN
 L0pVIzs1e0WgRXNVDAogulfmcU8EpM64SCm4X2A4LD4XEg+l4ep0ob1LFd1sfi44R40C
 Qn1ceBC6DV/beAalFKm7MOzQVHgQ70tx6SxiqO+wwByy0g3J5K6/7fbQkjyQ3MtNaseR
 Y/MQx+nHqJPtLYtYxnyNwQlCrW7lv4aiaEZLfAyMFoFU1Pygz8/y5h5/V9KYqrF+0D86
 KEL+LntmZIwU4G/+phttFV3mXe0Ugak7DtQ2EGHcKtyW07GO8yhuFirFe0cVoz8a7eVW
 5DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RwdUgpkZN5CktV/umLjJJE5bTR8gDxBJwZfTcsY4jPo=;
 b=heD4L1PYmObA9V5JEKGNT4C2f4UK7m6gw8RVDCDCelWO9CFw4gY/TBqWoU1gZrfmWM
 dPNKTJrhhj6AKvdgYFmc3wxK0XCFl4MLJ8wxu37237oaMiBbWa9uuQNbkQeQPIxNc/js
 nA183GTNYupVocVK52w2sdY6qsiyVAoOPrf3dVIT8p5berCYRycSuZQENIa180UI2ddB
 B5/Yuy6wbHED1/Wj3sqtpAAgtuyG72ZTG7Z1qKGQIrS4JJyshwHSGcYMYvkx8zhM5mpm
 uBxunZ6WyI6+JfzEtp6K+MI+81GDmKesvJjTKeM9Z96BToMX46GBNguW5D5AQAzrULIm
 dXPA==
X-Gm-Message-State: AOAM532tpcPGrBKqlzjhOoeUY0P3bgopHfI+XfK37V23Rd1bzCjw7A6L
 vnIw3NGlyNuvb4Or+pT5wKU=
X-Google-Smtp-Source: ABdhPJyXKMuvfB7bthuNNWULH2LKp2AkvswA+ocYQ3Ul8YQcnsPqNVBUAEQfcMwvK1wEeKHjTL+4CQ==
X-Received: by 2002:a05:6a00:130e:b0:4cc:3c7d:4dec with SMTP id
 j14-20020a056a00130e00b004cc3c7d4decmr12789339pfu.32.1646660656398; 
 Mon, 07 Mar 2022 05:44:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a630c01000000b003758d1a40easm12179074pgl.19.2022.03.07.05.44.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:44:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 02/13] malta: Move PCI interrupt handling from gt64xxx_pci to
 piix4
Date: Mon,  7 Mar 2022 14:43:42 +0100
Message-Id: <20220307134353.1950-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


