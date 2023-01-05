Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E065EF00
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJH-0002q9-1e; Thu, 05 Jan 2023 09:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002kn-Hl; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIw-0006u3-Iu; Thu, 05 Jan 2023 09:33:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m7so1872171wrn.10;
 Thu, 05 Jan 2023 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHk6ePf0VRd2q38GwoD9GjFLpVvV6YZeT24HsIu9nQs=;
 b=QVwPk808D7OYE8EGmsAXuBfaxZXIxfvwQeOkY1ZOJhabKRcvmcK67tcPmnnic1yzSq
 0cvXTRxoLeugxHYKYwIk2PLJGw0pJ1O4AZ0sYQR5wvZCFniuOl4ScE5UqMMJ56iPjk61
 bFCgcvMUC3x0sXLB82zXxRZtr1FQKC4uHnmzMbS+YnTDNQ2sjjeXLKszSCT7IK44T/WL
 fL8IDuJEE3mAJcyehdKyUb++PyNyNzUUwale8D42PcZAp5tRLVyYSnsW8Chq5US5UPC9
 8un2h/NayD9AvdVA0VtL/Q1wkS9xmsQpMsC/ZULpORV1JabzADV2F3heIkNdOlFJ4PhD
 OFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHk6ePf0VRd2q38GwoD9GjFLpVvV6YZeT24HsIu9nQs=;
 b=Bw5VqlyO+eP/jRHtfaJWSuACU3pKz1ox8KRtoaGRBmKBDPLX7hnBOV8WRs4HNCZhKL
 3XtnfYxNCaA5tBun4QBQQlGU0BsHpyaImH+CQywKyheB0mBhcNVzkaS9+L+0l75d9m9/
 t9E0y8F6snygqPZaPkzpvJ6sKmzlCqkOv9LpfWTtGynJP1I1MLO/mCuEzsHjvdBcQwN0
 hNmkDOpIvW1MiqM2/nJMBc0wB9DBWVmFmHuU9uv/KEiIKPM1be8UZwqs5JqIS9PTXgpB
 D7o1tAax+sppt2GiPpDBNW5GInE18G+yw3eJLpqB1i+9hHY/4dMe8Ga/BUfzBC5vCMHr
 82xw==
X-Gm-Message-State: AFqh2kpox9ElmaqIMGJ/RlIuJFZh+QhDWtBDwXZ6S+irYAOads30EO9v
 59sG0dH7Msbz6HmZ4p0K+HTbdFxjp9IraQ==
X-Google-Smtp-Source: AMrXdXvmphHOYSnvmCz4q4xLXQGf1c+t4pB5SCUfo2vF+FkPESJ5madQNB3+a5Fp4AZFzwGJ3wwZyQ==
X-Received: by 2002:adf:fcc6:0:b0:277:7243:5cef with SMTP id
 f6-20020adffcc6000000b0027772435cefmr34024339wrs.67.1672929191398; 
 Thu, 05 Jan 2023 06:33:11 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v5 05/31] hw/usb/hcd-uhci: Introduce TYPE_ defines for device
 models
Date: Thu,  5 Jan 2023 15:32:02 +0100
Message-Id: <20230105143228.244965-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-10-shentey@gmail.com>
---
 hw/usb/hcd-uhci.h |  4 ++++
 hw/i386/pc_piix.c |  3 ++-
 hw/i386/pc_q35.c  | 13 +++++++------
 hw/isa/piix4.c    |  2 +-
 hw/usb/hcd-uhci.c | 16 ++++++++--------
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index c85ab7868e..83e6f548b1 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -91,4 +91,8 @@ typedef struct UHCIInfo {
 void uhci_data_class_init(ObjectClass *klass, void *data);
 void usb_uhci_common_realize(PCIDevice *dev, Error **errp);
 
+#define TYPE_PIIX3_USB_UHCI "piix3-usb-uhci"
+#define TYPE_PIIX4_USB_UHCI "piix4-usb-uhci"
+#define TYPE_ICH9_USB_UHCI(fn) "ich9-usb-uhci" #fn
+
 #endif
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c743122c52..edc0ac8cf1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -51,6 +51,7 @@
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
+#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -306,7 +307,7 @@ static void pc_init1(MachineState *machine,
 #endif
 
     if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
+        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 65ea226211..83c57c6eb1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -48,6 +48,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/usb.h"
+#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
@@ -65,15 +66,15 @@ struct ehci_companions {
 };
 
 static const struct ehci_companions ich9_1d[] = {
-    { .name = "ich9-usb-uhci1", .func = 0, .port = 0 },
-    { .name = "ich9-usb-uhci2", .func = 1, .port = 2 },
-    { .name = "ich9-usb-uhci3", .func = 2, .port = 4 },
+    { .name = TYPE_ICH9_USB_UHCI(1), .func = 0, .port = 0 },
+    { .name = TYPE_ICH9_USB_UHCI(2), .func = 1, .port = 2 },
+    { .name = TYPE_ICH9_USB_UHCI(3), .func = 2, .port = 4 },
 };
 
 static const struct ehci_companions ich9_1a[] = {
-    { .name = "ich9-usb-uhci4", .func = 0, .port = 0 },
-    { .name = "ich9-usb-uhci5", .func = 1, .port = 2 },
-    { .name = "ich9-usb-uhci6", .func = 2, .port = 4 },
+    { .name = TYPE_ICH9_USB_UHCI(4), .func = 0, .port = 0 },
+    { .name = TYPE_ICH9_USB_UHCI(5), .func = 1, .port = 2 },
+    { .name = TYPE_ICH9_USB_UHCI(6), .func = 2, .port = 4 },
 };
 
 static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 6e9434129d..de60ceef73 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -255,7 +255,7 @@ static void piix4_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
-    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
+    object_initialize_child(obj, "uhci", &s->uhci, TYPE_PIIX4_USB_UHCI);
 
     object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
     qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index d1b5657d72..30ae0104bb 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1292,56 +1292,56 @@ void uhci_data_class_init(ObjectClass *klass, void *data)
 
 static UHCIInfo uhci_info[] = {
     {
-        .name       = "piix3-usb-uhci",
+        .name      = TYPE_PIIX3_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82371SB_2,
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
     },{
-        .name      = "piix4-usb-uhci",
+        .name      = TYPE_PIIX4_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82371AB_2,
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
     },{
-        .name      = "ich9-usb-uhci1", /* 00:1d.0 */
+        .name      = TYPE_ICH9_USB_UHCI(1), /* 00:1d.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI1,
         .revision  = 0x03,
         .irq_pin   = 0,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci2", /* 00:1d.1 */
+        .name      = TYPE_ICH9_USB_UHCI(2), /* 00:1d.1 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI2,
         .revision  = 0x03,
         .irq_pin   = 1,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci3", /* 00:1d.2 */
+        .name      = TYPE_ICH9_USB_UHCI(3), /* 00:1d.2 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI3,
         .revision  = 0x03,
         .irq_pin   = 2,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci4", /* 00:1a.0 */
+        .name      = TYPE_ICH9_USB_UHCI(4), /* 00:1a.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI4,
         .revision  = 0x03,
         .irq_pin   = 0,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci5", /* 00:1a.1 */
+        .name      = TYPE_ICH9_USB_UHCI(5), /* 00:1a.1 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI5,
         .revision  = 0x03,
         .irq_pin   = 1,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci6", /* 00:1a.2 */
+        .name      = TYPE_ICH9_USB_UHCI(6), /* 00:1a.2 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI6,
         .revision  = 0x03,
-- 
2.39.0


