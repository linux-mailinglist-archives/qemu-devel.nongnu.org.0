Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B52E339F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:29:48 +0100 (CET)
Received: from localhost ([::1]:53118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiI7-0004Dx-Bl
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD1-0007Sp-Tt
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiCx-0003vA-7H
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CF4C57470F4;
 Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3D2E47470DD; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <5b62392a6a3f39ea498e0f95a993a6d0f2288176.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 02/10] vt82c686: Remove unnecessary _DEVICE suffix from
 type macros
Date: Mon, 28 Dec 2020 03:08:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

There's no reason to suffix everything with _DEVICE when the names are
already unique without it and shorter names are more readable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2a0f85dea9..1be1169f83 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -49,8 +49,8 @@ struct VT82C686BState {
     SuperIOConfig superio_conf;
 };
 
-#define TYPE_VT82C686B_DEVICE "VT82C686B"
-OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B_DEVICE)
+#define TYPE_VT82C686B "VT82C686B"
+OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
@@ -117,7 +117,7 @@ static const MemoryRegionOps superio_ops = {
 
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BState *vt82c = VT82C686B_DEVICE(dev);
+    VT82C686BState *vt82c = VT82C686B(dev);
     uint8_t *pci_conf = vt82c->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
@@ -146,7 +146,7 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_write_config(PCIDevice *d, uint32_t address,
                                    uint32_t val, int len)
 {
-    VT82C686BState *vt686 = VT82C686B_DEVICE(d);
+    VT82C686BState *vt686 = VT82C686B(d);
 
     DPRINTF("vt82c686b_write_config  address 0x%x  val 0x%x len 0x%x\n",
            address, val, len);
@@ -176,14 +176,14 @@ struct VIAMC97State {
     PCIDevice dev;
 };
 
-#define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
-OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM_DEVICE)
+#define TYPE_VT82C686B_PM "VT82C686B_PM"
+OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
-#define TYPE_VIA_MC97_DEVICE "VIA_MC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97_DEVICE)
+#define TYPE_VIA_MC97 "VIA_MC97"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
 
-#define TYPE_VIA_AC97_DEVICE "VIA_AC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97_DEVICE)
+#define TYPE_VIA_AC97 "VIA_AC97"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
 
 static void pm_update_sci(VT686PMState *s)
 {
@@ -260,7 +260,7 @@ static const VMStateDescription vmstate_acpi = {
 
 static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
 {
-    VIAAC97State *s = VIA_AC97_DEVICE(dev);
+    VIAAC97State *s = VIA_AC97(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -274,7 +274,7 @@ void vt82c686b_ac97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_new(devfn, TYPE_VIA_AC97_DEVICE);
+    dev = pci_new(devfn, TYPE_VIA_AC97);
     pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
@@ -293,7 +293,7 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ac97_info = {
-    .name          = TYPE_VIA_AC97_DEVICE,
+    .name          = TYPE_VIA_AC97,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VIAAC97State),
     .class_init    = via_ac97_class_init,
@@ -305,7 +305,7 @@ static const TypeInfo via_ac97_info = {
 
 static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
 {
-    VIAMC97State *s = VIA_MC97_DEVICE(dev);
+    VIAMC97State *s = VIA_MC97(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -318,7 +318,7 @@ void vt82c686b_mc97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_new(devfn, TYPE_VIA_MC97_DEVICE);
+    dev = pci_new(devfn, TYPE_VIA_MC97);
     pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
@@ -337,7 +337,7 @@ static void via_mc97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_mc97_info = {
-    .name          = TYPE_VIA_MC97_DEVICE,
+    .name          = TYPE_VIA_MC97,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VIAMC97State),
     .class_init    = via_mc97_class_init,
@@ -350,7 +350,7 @@ static const TypeInfo via_mc97_info = {
 /* vt82c686 pm init */
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
-    VT686PMState *s = VT82C686B_PM_DEVICE(dev);
+    VT686PMState *s = VT82C686B_PM(dev);
     uint8_t *pci_conf;
 
     pci_conf = s->dev.config;
@@ -386,10 +386,10 @@ I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     PCIDevice *dev;
     VT686PMState *s;
 
-    dev = pci_new(devfn, TYPE_VT82C686B_PM_DEVICE);
+    dev = pci_new(devfn, TYPE_VT82C686B_PM);
     qdev_prop_set_uint32(&dev->qdev, "smb_io_base", smb_io_base);
 
-    s = VT82C686B_PM_DEVICE(dev);
+    s = VT82C686B_PM(dev);
 
     pci_realize_and_unref(dev, bus, &error_fatal);
 
@@ -419,7 +419,7 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_pm_info = {
-    .name          = TYPE_VT82C686B_PM_DEVICE,
+    .name          = TYPE_VT82C686B_PM,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT686PMState),
     .class_init    = via_pm_class_init,
@@ -442,7 +442,7 @@ static const VMStateDescription vmstate_via = {
 /* init the PCI-to-ISA bridge */
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BState *vt82c = VT82C686B_DEVICE(d);
+    VT82C686BState *vt82c = VT82C686B(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -479,9 +479,7 @@ ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
 {
     PCIDevice *d;
 
-    d = pci_create_simple_multifunction(bus, devfn, true,
-                                        TYPE_VT82C686B_DEVICE);
-
+    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B);
     return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
 }
 
@@ -507,7 +505,7 @@ static void via_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_info = {
-    .name          = TYPE_VT82C686B_DEVICE,
+    .name          = TYPE_VT82C686B,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT82C686BState),
     .class_init    = via_class_init,
-- 
2.21.3


