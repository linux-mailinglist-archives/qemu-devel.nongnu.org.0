Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44F5A9D38
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:37:04 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnBf-0005UQ-DL
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1s-0001cj-Td
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:57 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1q-0001Tm-DF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id og21so35828030ejc.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MffKLLssHiuk2+RAKmOyGgeB7YqVCfQyTk6jntfkXQQ=;
 b=j1OkI1JXI4oPyFLWu5I9Fc+hBw2ygrwU9VbvCJPxzOqsUzcxKXVPVgT/EQ1IOeGvix
 YRxD94sPQtonn72UvWHFPPy+GqjrWcf1TNGknW63fIQdA+HsPcwUSShmnsngvECmnCgy
 zM8y6LLxnkeB3RfNgpDIoEn6B2Y2yPYrQgGxapW2xE5MQHBqkYuFi5+LOqbtxECdWw2D
 D/Xwl0t5v7Utkq+a3l5R+voc7q6pM6ZHGRUHyzX7QgNCAZCBTqakDo3JPrTm7UAx0yB7
 pS57WBBJ+my9s32h26lavq7oGtpAuVhsE/hoHC7r9Lt5n0qnuNT3AyUvQXm1iBKZjHog
 22tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MffKLLssHiuk2+RAKmOyGgeB7YqVCfQyTk6jntfkXQQ=;
 b=vxVTQc05rYSUwpHr+bB02690yhMkmdQiDwYRb4ERxICnBL3OfIUDibDRwi6BYvMOUF
 YZhKoWm5dEtfgwizVZuNBr0ZP1IgJrxquVdkVasfwmB7VOViBKEenkeHQHw8ZVSgAqwz
 GrBoiqQw52TNOsCxFLOXQ9i3FU8TMp4xkV8cxoPXRZy+pl/JgUCFNTJ+mCHqdwZWgfaE
 MJ85++9QeCc9YSoOgAfWjG+rcNzcdzWKevzDMvRGmQYrAk7YG355PZf4X/Q99O4BzSIK
 JfOnhw4iL3DIZt+xRY2NonzNowbvQghwGCXiK9RiWqJ68vkAwvbg+zlEcsBXtKKfjlis
 MS6w==
X-Gm-Message-State: ACgBeo0W6ICDIepn2CykyrQSGV/Nkcn73pn6wqOwjuvZzy59tyJhk2ed
 DkFFERejPVArv2q1GN+z0xgb4Jlsrjk=
X-Google-Smtp-Source: AA6agR7Y1WC58HG9oSqnlzftgOUpJYQewJzrNp8LTdWK4ooS9T/K9OHNHwtwk3C6d0DmFZb8eXUHPA==
X-Received: by 2002:a17:907:3f98:b0:730:cfce:9c0f with SMTP id
 hr24-20020a1709073f9800b00730cfce9c0fmr24767263ejc.475.1662049612896; 
 Thu, 01 Sep 2022 09:26:52 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:52 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 06/42] hw/isa/piix3: Create power management controller in
 host device
Date: Thu,  1 Sep 2022 18:25:37 +0200
Message-Id: <20220901162613.6939-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The power management controller is an integral part of PIIX3 (function
3). So create it as part of the south bridge.

Note that the ACPI function is optional in QEMU. This is why it gets
object_initialize_child()'ed in realize rather than in instance_init.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             | 23 +++++++++++++----------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                | 14 ++++++++++++++
 include/hw/southbridge/piix.h |  6 ++++++
 4 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 76ac8b2035..7efef4f364 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -45,11 +45,11 @@
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
+#include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
-#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -84,6 +84,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
+    Object *piix4_pm;
     int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
@@ -221,6 +222,13 @@ static void pc_init1(MachineState *machine,
         pci_dev = pci_new_multifunction(-1, true, type);
         object_property_set_bool(OBJECT(pci_dev), "has-usb",
                                  machine_usb(machine), &error_abort);
+        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
+                                 x86_machine_is_acpi_enabled(x86ms),
+                                 &error_abort);
+        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
+        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
+                                 x86_machine_is_smm_enabled(x86ms),
+                                 &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -228,8 +236,10 @@ static void pc_init1(MachineState *machine,
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
+        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
     } else {
         pci_bus = NULL;
+        piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
 
@@ -299,15 +309,8 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        PCIDevice *piix4_pm;
-
+    if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
-        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
-        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
-                          x86_machine_is_smm_enabled(x86ms));
-        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
 
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
@@ -321,7 +324,7 @@ static void pc_init1(MachineState *machine,
                                  object_property_allow_set_link,
                                  OBJ_PROP_LINK_STRONG);
         object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
-                                 OBJECT(piix4_pm), &error_abort);
+                                 piix4_pm, &error_abort);
     }
 
     if (machine->nvdimms_state->is_enabled) {
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index f02eca3c3e..f10daa26bc 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -33,6 +33,7 @@ config PC87312
 
 config PIIX3
     bool
+    select ACPI_PIIX4
     select I8257
     select ISA_BUS
     select MC146818RTC
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 27052a5546..3bd25013ee 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -330,6 +330,17 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
             return;
         }
     }
+
+    /* Power Management */
+    if (d->has_acpi) {
+        object_initialize_child(OBJECT(d), "pm", &d->pm, TYPE_PIIX4_PM);
+        qdev_prop_set_int32(DEVICE(&d->pm), "addr", dev->devfn + 3);
+        qdev_prop_set_uint32(DEVICE(&d->pm), "smb_io_base", d->smb_io_base);
+        qdev_prop_set_bit(DEVICE(&d->pm), "smm-enabled", d->smm_enabled);
+        if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -353,7 +364,10 @@ static void pci_piix3_init(Object *obj)
 }
 
 static Property pci_piix3_props[] = {
+    DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 5367917182..1c291cc954 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,6 +14,7 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/acpi/piix4.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -56,6 +57,9 @@ struct PIIXState {
 
     RTCState rtc;
     UHCIState uhci;
+    PIIX4PMState pm;
+
+    uint32_t smb_io_base;
 
     /* Reset Control Register contents */
     uint8_t rcr;
@@ -63,7 +67,9 @@ struct PIIXState {
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
 
+    bool has_acpi;
     bool has_usb;
+    bool smm_enabled;
 };
 typedef struct PIIXState PIIX3State;
 
-- 
2.37.3


