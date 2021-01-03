Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607B2E8E2D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:56:18 +0100 (CET)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAQD-0007Uw-AX
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALC-0002qc-EE
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:06 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALA-0005qx-Cs
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:06 -0500
Received: by mail-wr1-x430.google.com with SMTP id r3so29491837wrt.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I0Qx7xrqmoPP3gg4/cVniQfedaijI77x9Nh3r7Ky0Is=;
 b=nh2N+BbjJntilJGIP8zA6Dvb4T+WeDH0ayurtFeCnwPm0iR+iuXTQ14iswTND3pDWv
 3rDM/OK6IPOsD8sYqltf+jaZI0Y7ywHVzNM4GzrnjnUUbemnHQsV/dySlZ0RnGRRNTnV
 FY2ZrokhzIXesBM9NY3FOSir2b0hcxcQaFCI5ZY8qjBHCrcOnOLqPOM7emym6d+IPqRl
 dvTKhAcW47ZQZE+sWBe/BrWb1Vwd+JttcOt2NTTFvSp/kWGSYMgZ4tIUSXCLlWuTEZk0
 IloNFfyGhWZWcZ0kIc/30yYZ+VQrk4zPbR4jDwQ98aV7ZxBAiFyGc3H2GXUrYF1ML6Of
 l7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I0Qx7xrqmoPP3gg4/cVniQfedaijI77x9Nh3r7Ky0Is=;
 b=jGjJMpDciQG2jPbdKfkdeT83qzbKm2DTjp/rBbyXEXLIIUc4fNGGTN/EAAOcaM4Lvh
 XZp+nYVV5yn9EGcVhB7DwMylJ16MCZ1Kxt9zbJjjz0PUADjiiX0cuckhExkIIO2VXaAt
 poxkW5igyFR4wsD4vho3uQYWMbnMGnnOWFmfTom8Sv9p2ENfR+Ssr08ZpoojwWdfPK4h
 GGc7h9Jy5r2enTMNKRxBf7aX10lpln2qxlu7Ld2xX8kYVRlsV+a3QRV1byrrAqYPoqWv
 UpQkQ/jTfoIQA0qI6qH7fs6qCqHPFJKmJa7dEjomeg7rAvGB9RllIUltiU1ZlQ6PXQVn
 31XQ==
X-Gm-Message-State: AOAM533q5CFYCXtnVpBqoyzGYzqp/j3ffQdSBhj+AIPaMKJ+knG8vJrE
 q1sGCnIBH63/5RtAZDXBjriaaYevSr8=
X-Google-Smtp-Source: ABdhPJxFUMGc0yzl1B3G/E1E+/27Jyi8yLpGJ2asiXdd6Fk7GQPYQS+NsCohsvNFl+chWuICxbsAhA==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr76433027wrw.137.1609707062935; 
 Sun, 03 Jan 2021 12:51:02 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id v1sm29170946wmj.31.2021.01.03.12.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/35] vt82c686: Remove unnecessary _DEVICE suffix from type
 macros
Date: Sun,  3 Jan 2021 21:49:54 +0100
Message-Id: <20210103205021.2837760-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

There's no reason to suffix everything with _DEVICE when the names are
already unique without it and shorter names are more readable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <ea89683ebb3528c0f79ed99d3d3cfcefb63c3bfb.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2a0f85dea94..1be1169f83a 100644
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
2.26.2


