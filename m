Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E242F2E3399
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:27:37 +0100 (CET)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiG0-0000p2-Sl
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD0-0007SJ-W4
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiCx-0003vB-7I
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BEC6D7470F0;
 Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35A76746552; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <43d949fea01d0ceacc677c9d68b8e64bb637cc21.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 01/10] vt82c686: Rename AC97/MC97 parts from VT82C686B to
 VIA
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

These parts are common between VT82C686B and VT8231 so can be shared
in the future. Rename them to VIA prefix accordingly.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b3170c70c3..2a0f85dea9 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -168,22 +168,22 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-struct VT686AC97State {
+struct VIAAC97State {
     PCIDevice dev;
 };
 
-struct VT686MC97State {
+struct VIAMC97State {
     PCIDevice dev;
 };
 
 #define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM_DEVICE)
 
-#define TYPE_VT82C686B_MC97_DEVICE "VT82C686B_MC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VT686MC97State, VT82C686B_MC97_DEVICE)
+#define TYPE_VIA_MC97_DEVICE "VIA_MC97"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97_DEVICE)
 
-#define TYPE_VT82C686B_AC97_DEVICE "VT82C686B_AC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VT686AC97State, VT82C686B_AC97_DEVICE)
+#define TYPE_VIA_AC97_DEVICE "VIA_AC97"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97_DEVICE)
 
 static void pm_update_sci(VT686PMState *s)
 {
@@ -260,7 +260,7 @@ static const VMStateDescription vmstate_acpi = {
 
 static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
 {
-    VT686AC97State *s = VT82C686B_AC97_DEVICE(dev);
+    VIAAC97State *s = VIA_AC97_DEVICE(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -274,7 +274,7 @@ void vt82c686b_ac97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_new(devfn, TYPE_VT82C686B_AC97_DEVICE);
+    dev = pci_new(devfn, TYPE_VIA_AC97_DEVICE);
     pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
@@ -293,9 +293,9 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ac97_info = {
-    .name          = TYPE_VT82C686B_AC97_DEVICE,
+    .name          = TYPE_VIA_AC97_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT686AC97State),
+    .instance_size = sizeof(VIAAC97State),
     .class_init    = via_ac97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -305,7 +305,7 @@ static const TypeInfo via_ac97_info = {
 
 static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
 {
-    VT686MC97State *s = VT82C686B_MC97_DEVICE(dev);
+    VIAMC97State *s = VIA_MC97_DEVICE(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -318,7 +318,7 @@ void vt82c686b_mc97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_new(devfn, TYPE_VT82C686B_MC97_DEVICE);
+    dev = pci_new(devfn, TYPE_VIA_MC97_DEVICE);
     pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
@@ -337,9 +337,9 @@ static void via_mc97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_mc97_info = {
-    .name          = TYPE_VT82C686B_MC97_DEVICE,
+    .name          = TYPE_VIA_MC97_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT686MC97State),
+    .instance_size = sizeof(VIAMC97State),
     .class_init    = via_mc97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.21.3


