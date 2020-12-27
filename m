Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052DD2E2F8C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:24:45 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktKnb-0001l6-V9
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkR-0008QC-5F
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:27 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkN-0001AR-6P
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4F1E67470E6;
 Sun, 27 Dec 2020 02:21:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BA50C7470E8; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <5f864b4ad285932076f12ce4beb00e165550c870.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609031406.git.balaton@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
Subject: [PATCH 02/12] vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
Date: Sun, 27 Dec 2020 02:10:06 +0100
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


