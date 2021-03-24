Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3C348035
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:18:17 +0100 (CET)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP85A-0006r7-GY
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7jB-0004c9-7R; Wed, 24 Mar 2021 13:55:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7j5-0000GI-S4; Wed, 24 Mar 2021 13:55:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id x13so25338227wrs.9;
 Wed, 24 Mar 2021 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33tIPVTTy4w3TP0mdRFjmaEZnocP/TEDVOP38fCjKBg=;
 b=Vf+xioGAtyAAFH6MTZNUrzcJeMEDwQMCrQU71OTQAGH0XSk0MASnvuQdedyl2ODOLv
 p0F09a/Et3HuMRrDpKqRwNvU0VlaEkPH4QP5v/6d3XqlRBMoeaZHZ6HJGj6vBlGNFxMB
 f3xM/QJWTJqr/dzwtD6/yUtzD+UBPRwmRmzsnkGILx0DaMlMzDVmgVoef9LE0uMcSS1D
 H9RWIsOKvxhiAzgZQdYI1stRuia0ucY96fsmOP7EngnTPj2TRdQuiwOUsH08Yd46aclC
 2VKr2LpbStVN6dDeRfxhHWnjEupPUtqdfNsuv5eEhSzxanEGzw6lfiCdA9ymdxfY/qgG
 NuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=33tIPVTTy4w3TP0mdRFjmaEZnocP/TEDVOP38fCjKBg=;
 b=icY5jLfTXQ+tMZpShWPW14VRoLPBy7xBSZwhLHnSp8wBC3fNcj0Ay6LHhcJFmZHvtq
 PIkIBEcdBIx+BF1W2b2/IVh4rg2suv2DC9TFfWUJXudxPRqGXozx4TCYdLQ01I/7o9O0
 /XmlmaLZ1gxVIW/QzK/g6NqwwDKh0yfHn3dUumM+Iz4cXngEg1qKGODbu45h4FvMOuGn
 HkD3oeQzz74iSUnsDamWwrqfPiGcWxV40ok7RF9N79qrGRGZE1e/UZ7SIlXwc9S93K5V
 u/FTvj/DtgNzB7jFLTd5zdUKbevotmsie9TXxCYV/cRN6YvRfwx1e7ZkmBoVy8jtyn0W
 D2VA==
X-Gm-Message-State: AOAM531oWVp1IUUZ32k7yTVEqY6PXUTdGgRxOGPm2WmL6wj148JodZ7+
 VHSmRWrSklYVESfdU4IQqtbVapsihPWg/g==
X-Google-Smtp-Source: ABdhPJzxS8R48h7V6wmk/hb0PvH7C/tSc4VPjUgacpbeKVbqvdFf03g3kcWMR2O5PuFvosjZH0wVFA==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr4743750wrr.274.1616608525921; 
 Wed, 24 Mar 2021 10:55:25 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 12sm3156632wmw.43.2021.03.24.10.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:55:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/southbridge/vt82c686: Introduce VT82C686B_SOUTHBRIDGE
Date: Wed, 24 Mar 2021 18:54:38 +0100
Message-Id: <20210324175438.680310-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324175438.680310-1-f4bug@amsat.org>
References: <20210324175438.680310-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VT82C686B south bridge is a single chipset. Model
it as a single sysbus device.
Move the vt82c686b_southbridge_init as via_southbridge_realize,
add the QOM state: ViaSouthBridgeState. This device needs 2
properties to be realized: the PCI bus and its slot number.
2 aliases are exposed: the ISA PIC output IRQ and the I2C bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c        |  42 +++------------
 hw/southbridge/vt82c686.c  | 107 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                |   1 +
 hw/Kconfig                 |   1 +
 hw/isa/Kconfig             |   8 ---
 hw/meson.build             |   1 +
 hw/southbridge/Kconfig     |   7 +++
 hw/southbridge/meson.build |   1 +
 8 files changed, 126 insertions(+), 42 deletions(-)
 create mode 100644 hw/southbridge/vt82c686.c
 create mode 100644 hw/southbridge/Kconfig
 create mode 100644 hw/southbridge/meson.build

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index f1c5db13b78..01f5ef89339 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -35,10 +35,8 @@
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
-#include "hw/ide/pci.h"
 #include "hw/qdev-properties.h"
 #include "elf.h"
-#include "hw/isa/vt82c686.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
@@ -199,36 +197,6 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
-                                       I2CBus **i2c_bus)
-{
-    PCIDevice *dev;
-    DeviceState *isa;
-
-    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
-                                          TYPE_VT82C686B_ISA);
-    isa = DEVICE(dev);
-    qdev_connect_gpio_out_named(isa, "intr", 0, intc);
-
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
-    for (unsigned i = 0; i < 2; i++) {
-        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", i,
-                                    qdev_get_gpio_in_named(isa,
-                                                           "isa-irq", 14 + i));
-    }
-    pci_ide_create_devs(dev);
-
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
-
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
-    *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-
-    /* Audio support */
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
-}
-
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
@@ -325,8 +293,14 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
 
     /* South bridge -> IP5 */
-    vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
-                               &smbus);
+    dev = qdev_new("vt82c686b-southbridge");
+    object_property_set_uint(OBJECT(dev), "pci-slot",
+                             FULOONG2E_VIA_SLOT, &error_fatal);
+    object_property_set_link(OBJECT(dev), "pci-bus",
+                             OBJECT(pci_bus), &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    qdev_connect_gpio_out_named(dev, "intr", 0, env->irq[5]);
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
diff --git a/hw/southbridge/vt82c686.c b/hw/southbridge/vt82c686.c
new file mode 100644
index 00000000000..61c3e6ae306
--- /dev/null
+++ b/hw/southbridge/vt82c686.c
@@ -0,0 +1,107 @@
+/*
+ * VT82C686B south bridge emulation
+ *
+ * Copyright (c) 2008 yajin (yajin@vm-kernel.org)
+ * Copyright (c) 2009 chenming (chenming@rdc.faw.com.cn)
+ * Copyright (c) 2010 Huacai Chen (zltjiangshi@gmail.com)
+ * Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ * This code is licensed under the GNU GPL v2.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci.h"
+#include "hw/ide/pci.h"
+#include "hw/isa/vt82c686.h"
+
+#define TYPE_VT82C686B_SOUTHBRIDGE "vt82c686b-southbridge"
+OBJECT_DECLARE_SIMPLE_TYPE(ViaSouthBridgeState, VT82C686B_SOUTHBRIDGE)
+
+struct ViaSouthBridgeState {
+    /* <private> */
+    SysBusDevice parent_obj;
+    /* <public> */
+
+    uint8_t pci_slot;
+    PCIBus *pci_bus;
+    PCIDevice *isa;
+    PCIDevice *ide;
+    PCIDevice *usb[2];
+    PCIDevice *apm;
+    PCIDevice *audio;
+    PCIDevice *modem;
+};
+
+static void via_southbridge_realize(DeviceState *dev, Error **errp)
+{
+    ViaSouthBridgeState *s = VT82C686B_SOUTHBRIDGE(dev);
+
+    if (!s->pci_bus) {
+        error_setg(errp, "SMMU is not attached to any PCI bus!");
+        return;
+    }
+
+    s->isa = pci_create_simple_multifunction(s->pci_bus,
+                                             PCI_DEVFN(s->pci_slot, 0),
+                                             true, TYPE_VT82C686B_ISA);
+    qdev_pass_gpios(DEVICE(s->isa), dev, "intr");
+
+    s->ide = pci_create_simple(s->pci_bus,
+                               PCI_DEVFN(s->pci_slot, 1), "via-ide");
+    for (unsigned i = 0; i < 2; i++) {
+        qdev_connect_gpio_out_named(DEVICE(s->ide), "ide-irq", i,
+                            qdev_get_gpio_in_named(DEVICE(s->isa),
+                                                   "isa-irq", 14 + i));
+    }
+    pci_ide_create_devs(s->ide);
+
+    s->usb[0] = pci_create_simple(s->pci_bus,
+                                  PCI_DEVFN(s->pci_slot, 2),
+                                  "vt82c686b-usb-uhci");
+    s->usb[1] = pci_create_simple(s->pci_bus,
+                                  PCI_DEVFN(s->pci_slot, 3),
+                                  "vt82c686b-usb-uhci");
+
+    s->apm = pci_create_simple(s->pci_bus,
+                               PCI_DEVFN(s->pci_slot, 4),
+                               TYPE_VT82C686B_PM);
+    object_property_add_alias(OBJECT(s), "i2c",
+                              OBJECT(s->apm), "i2c");
+
+    s->audio = pci_create_simple(s->pci_bus,
+                                 PCI_DEVFN(s->pci_slot, 5),
+                                 TYPE_VIA_AC97);
+    s->modem = pci_create_simple(s->pci_bus,
+                                 PCI_DEVFN(s->pci_slot, 6),
+                                 TYPE_VIA_MC97);
+}
+
+static Property via_southbridge_properties[] = {
+    DEFINE_PROP_UINT8("pci-slot", ViaSouthBridgeState, pci_slot, 0),
+    DEFINE_PROP_LINK("pci-bus", ViaSouthBridgeState, pci_bus, "PCI", PCIBus *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void via_southbridge_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = via_southbridge_realize;
+    device_class_set_props(dc, via_southbridge_properties);
+}
+
+static const TypeInfo via_southbridge_info = {
+    .name          = TYPE_VT82C686B_SOUTHBRIDGE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ViaSouthBridgeState),
+    .class_init    = via_southbridge_class_init,
+};
+
+static void via_southbridge_register_types(void)
+{
+    type_register_static(&via_southbridge_info);
+}
+
+type_init(via_southbridge_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 10ed6d76240..65a0ec11c2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1195,6 +1195,7 @@ S: Odd Fixes
 F: hw/mips/fuloong2e.c
 F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
+F: hw/southbridge/vt82c686.c
 F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
 
diff --git a/hw/Kconfig b/hw/Kconfig
index ff40bd3f7bb..76e35ad189f 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -32,6 +32,7 @@ source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
 source smbios/Kconfig
+source southbridge/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
 source tpm/Kconfig
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 2691eae2f0c..34adc411fa6 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -41,14 +41,6 @@ config PIIX4
     select ISA_BUS
     select USB_UHCI
 
-config VT82C686
-    bool
-    select ISA_SUPERIO
-    select ACPI_SMBUS
-    select SERIAL_ISA
-    select FDC
-    select USB_UHCI
-
 config SMC37C669
     bool
     select ISA_SUPERIO
diff --git a/hw/meson.build b/hw/meson.build
index 8ba79b1a528..4bdd254e041 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -31,6 +31,7 @@
 subdir('scsi')
 subdir('sd')
 subdir('smbios')
+subdir('southbridge')
 subdir('ssi')
 subdir('timer')
 subdir('tpm')
diff --git a/hw/southbridge/Kconfig b/hw/southbridge/Kconfig
new file mode 100644
index 00000000000..356434f4e44
--- /dev/null
+++ b/hw/southbridge/Kconfig
@@ -0,0 +1,7 @@
+config VT82C686
+    bool
+    select ISA_SUPERIO
+    select ACPI_SMBUS
+    select SERIAL_ISA
+    select FDC
+    select USB_UHCI
diff --git a/hw/southbridge/meson.build b/hw/southbridge/meson.build
new file mode 100644
index 00000000000..53b02e9563c
--- /dev/null
+++ b/hw/southbridge/meson.build
@@ -0,0 +1 @@
+softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686.c'))
-- 
2.26.2


