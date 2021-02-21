Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9644320B3F
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:06:52 +0100 (CET)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqJv-0002uW-UB
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprd-0000Si-LI
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprb-0003UN-GH
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r3so4700503wro.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnTZ/TustYEbBKJFReUwns6tIkh8Sbj+jG6SPisGBxc=;
 b=NDBAnlrIS3aWn63oG7pD0Rm5yLVGHvCNp67W2CEBzjaBesiHuwBTlztCJEG3OzcWD/
 gVhortgw1Yd8hLEywT1IC1t/JvxmkW1yDz1ikTkf8NCRrRD6xOJOqLZ8Ny0yYWgsPGAh
 ujOxe5pM5jBN87bfCIg7KhSqjuPY6gDBuPNOqYxIQ+2LrZLp7weXkWSHkMARi9B6u42o
 uAlMdzT+8mCsZWDjxP+u4HM8445GPKdxTieZ3/EECt3fZNddNGkEz5VtOlX1OmepH0dQ
 afm01osZllXKHs7s3G26hp3h9FaihiVJwusyLBGwBTJYLudT8yAAAGXJaE+b2CRLk65b
 9p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MnTZ/TustYEbBKJFReUwns6tIkh8Sbj+jG6SPisGBxc=;
 b=kX9BRQ9V8eOO0p9xlQmGoGowF2WUod7q/WzYEdjHVh4cca8n3TNSOu/U7XROAS+Ytk
 /RlbCEPi8pXLBN4YyrXWy4V5RU60zYj9xNQaYa++zK3Ny7E1pE1saU9NvJryYBVwxzsX
 u0hs+yaIdOllo+eClQgVRdyNwT0VnOZr603tH3l/k0gLXXVh11x4If4EcwZfdr1ziYLC
 D2ruCBBIYT/CJF2/g0JhYXvBYrPkW7GeltwiopgBCOG2f4t6XhYmktNGLlqtfviTY0pL
 ptwQ5C5iYnfFshNZ7cTtEtgPpwsfr5RJxq5HX2cZDh1z9sSliPDpKyHoq8lbjXpap/Zu
 wUhA==
X-Gm-Message-State: AOAM532RdM81t+H4h7QwzqM022YxX4v/cR+aJHXp2CrpUShEND9vXwj/
 28h1DU3gTUX+ij5ROWmAJVPBd2OrhsQ=
X-Google-Smtp-Source: ABdhPJzbtn4Gv0j7y6GLFBasD0J59BjTQB3DwX3XhF3r007cXvjRxmEBPjNsHLvZB3aiRL1IsUxN2A==
X-Received: by 2002:a05:6000:107:: with SMTP id
 o7mr17433134wrx.87.1613918253898; 
 Sun, 21 Feb 2021 06:37:33 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q25sm17099061wmq.15.2021.02.21.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/43] vt82c686: Make vt82c686b-pm an abstract base class and
 add vt8231-pm based on it
Date: Sun, 21 Feb 2021 15:34:25 +0100
Message-Id: <20210221143432.2468220-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
only difference between the two is the device id in what we emulate so
make an abstract via-pm model by renaming appropriately and add types
for vt82c686b-pm and vt8231-pm based on it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <34969fc7be984fa070479bfb9f748993a0aef31b.1610223397.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/vt82c686.h |  1 +
 include/hw/pci/pci_ids.h  |  3 +-
 hw/isa/vt82c686.c         | 84 ++++++++++++++++++++++++++-------------
 3 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 5b0a1ffe725..9b6d610e838 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -4,6 +4,7 @@
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index bd0c17dc789..ea28dcc850b 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -207,9 +207,10 @@
 #define PCI_DEVICE_ID_VIA_ISA_BRIDGE     0x0686
 #define PCI_DEVICE_ID_VIA_IDE            0x0571
 #define PCI_DEVICE_ID_VIA_UHCI           0x3038
-#define PCI_DEVICE_ID_VIA_ACPI           0x3057
+#define PCI_DEVICE_ID_VIA_82C686B_PM     0x3057
 #define PCI_DEVICE_ID_VIA_AC97           0x3058
 #define PCI_DEVICE_ID_VIA_MC97           0x3068
+#define PCI_DEVICE_ID_VIA_8231_PM        0x8235
 
 #define PCI_VENDOR_ID_MARVELL            0x11ab
 
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5e2bf6d16c3..0e812c49241 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -27,9 +27,10 @@
 #include "exec/address-spaces.h"
 #include "trace.h"
 
-OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
+#define TYPE_VIA_PM "via-pm"
+OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
 
-struct VT686PMState {
+struct ViaPMState {
     PCIDevice dev;
     MemoryRegion io;
     ACPIREGS ar;
@@ -37,7 +38,7 @@ struct VT686PMState {
     PMSMBus smb;
 };
 
-static void pm_io_space_update(VT686PMState *s)
+static void pm_io_space_update(ViaPMState *s)
 {
     uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
 
@@ -47,7 +48,7 @@ static void pm_io_space_update(VT686PMState *s)
     memory_region_transaction_commit();
 }
 
-static void smb_io_space_update(VT686PMState *s)
+static void smb_io_space_update(ViaPMState *s)
 {
     uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
 
@@ -59,7 +60,7 @@ static void smb_io_space_update(VT686PMState *s)
 
 static int vmstate_acpi_post_load(void *opaque, int version_id)
 {
-    VT686PMState *s = opaque;
+    ViaPMState *s = opaque;
 
     pm_io_space_update(s);
     smb_io_space_update(s);
@@ -72,20 +73,20 @@ static const VMStateDescription vmstate_acpi = {
     .minimum_version_id = 1,
     .post_load = vmstate_acpi_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, VT686PMState),
-        VMSTATE_UINT16(ar.pm1.evt.sts, VT686PMState),
-        VMSTATE_UINT16(ar.pm1.evt.en, VT686PMState),
-        VMSTATE_UINT16(ar.pm1.cnt.cnt, VT686PMState),
-        VMSTATE_STRUCT(apm, VT686PMState, 0, vmstate_apm, APMState),
-        VMSTATE_TIMER_PTR(ar.tmr.timer, VT686PMState),
-        VMSTATE_INT64(ar.tmr.overflow_time, VT686PMState),
+        VMSTATE_PCI_DEVICE(dev, ViaPMState),
+        VMSTATE_UINT16(ar.pm1.evt.sts, ViaPMState),
+        VMSTATE_UINT16(ar.pm1.evt.en, ViaPMState),
+        VMSTATE_UINT16(ar.pm1.cnt.cnt, ViaPMState),
+        VMSTATE_STRUCT(apm, ViaPMState, 0, vmstate_apm, APMState),
+        VMSTATE_TIMER_PTR(ar.tmr.timer, ViaPMState),
+        VMSTATE_INT64(ar.tmr.overflow_time, ViaPMState),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 {
-    VT686PMState *s = VT82C686B_PM(d);
+    ViaPMState *s = VIA_PM(d);
 
     trace_via_pm_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
@@ -127,7 +128,7 @@ static const MemoryRegionOps pm_io_ops = {
     },
 };
 
-static void pm_update_sci(VT686PMState *s)
+static void pm_update_sci(ViaPMState *s)
 {
     int sci_level, pmsts;
 
@@ -145,13 +146,13 @@ static void pm_update_sci(VT686PMState *s)
 
 static void pm_tmr_timer(ACPIREGS *ar)
 {
-    VT686PMState *s = container_of(ar, VT686PMState, ar);
+    ViaPMState *s = container_of(ar, ViaPMState, ar);
     pm_update_sci(s);
 }
 
-static void vt82c686b_pm_reset(DeviceState *d)
+static void via_pm_reset(DeviceState *d)
 {
-    VT686PMState *s = VT82C686B_PM(d);
+    ViaPMState *s = VIA_PM(d);
 
     memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
            PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
@@ -164,9 +165,9 @@ static void vt82c686b_pm_reset(DeviceState *d)
     smb_io_space_update(s);
 }
 
-static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
+static void via_pm_realize(PCIDevice *dev, Error **errp)
 {
-    VT686PMState *s = VT82C686B_PM(dev);
+    ViaPMState *s = VIA_PM(dev);
 
     pci_set_word(dev->config + PCI_STATUS, PCI_STATUS_FAST_BACK |
                  PCI_STATUS_DEVSEL_MEDIUM);
@@ -177,8 +178,7 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 
     apm_init(dev, &s->apm, NULL, s);
 
-    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s,
-                          "vt82c686-pm", 128);
+    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s, "via-pm", 128);
     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
     memory_region_set_enabled(&s->io, false);
 
@@ -187,35 +187,61 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
 }
 
+typedef struct via_pm_init_info {
+    uint16_t device_id;
+} ViaPMInitInfo;
+
 static void via_pm_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    ViaPMInitInfo *info = data;
 
-    k->realize = vt82c686b_pm_realize;
+    k->realize = via_pm_realize;
     k->config_write = pm_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_ACPI;
+    k->device_id = info->device_id;
     k->class_id = PCI_CLASS_BRIDGE_OTHER;
     k->revision = 0x40;
-    dc->reset = vt82c686b_pm_reset;
-    dc->desc = "PM";
+    dc->reset = via_pm_reset;
     /* Reason: part of VIA south bridge, does not exist stand alone */
     dc->user_creatable = false;
     dc->vmsd = &vmstate_acpi;
 }
 
 static const TypeInfo via_pm_info = {
-    .name          = TYPE_VT82C686B_PM,
+    .name          = TYPE_VIA_PM,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT686PMState),
-    .class_init    = via_pm_class_init,
+    .instance_size = sizeof(ViaPMState),
+    .abstract      = true,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
     },
 };
 
+static const ViaPMInitInfo vt82c686b_pm_init_info = {
+    .device_id = PCI_DEVICE_ID_VIA_82C686B_PM,
+};
+
+static const TypeInfo vt82c686b_pm_info = {
+    .name          = TYPE_VT82C686B_PM,
+    .parent        = TYPE_VIA_PM,
+    .class_init    = via_pm_class_init,
+    .class_data    = (void *)&vt82c686b_pm_init_info,
+};
+
+static const ViaPMInitInfo vt8231_pm_init_info = {
+    .device_id = PCI_DEVICE_ID_VIA_8231_PM,
+};
+
+static const TypeInfo vt8231_pm_info = {
+    .name          = TYPE_VT8231_PM,
+    .parent        = TYPE_VIA_PM,
+    .class_init    = via_pm_class_init,
+    .class_data    = (void *)&vt8231_pm_init_info,
+};
+
 
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
@@ -424,6 +450,8 @@ static const TypeInfo via_superio_info = {
 static void vt82c686b_register_types(void)
 {
     type_register_static(&via_pm_info);
+    type_register_static(&vt82c686b_pm_info);
+    type_register_static(&vt8231_pm_info);
     type_register_static(&via_info);
     type_register_static(&via_superio_info);
 }
-- 
2.26.2


