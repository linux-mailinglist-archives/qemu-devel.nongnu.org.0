Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B565A2E86F5
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:16:39 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kveti-0002Qs-IM
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqn-0000fk-P8
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqj-00073Q-DD
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6A1D274763C;
 Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D0D3B7470FA; Sat,  2 Jan 2021 12:13:29 +0100 (CET)
Message-Id: <510ddb17836a2c2e68a27cf2dcaee420bc2efbc1.1609584215.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 01/24] vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


