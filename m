Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42203547407
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:57:13 +0200 (CEST)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyno-0000tg-9t
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySG-0004an-05
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySE-0006Fu-4V
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id v14so1487127wra.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aka9zrKZ1Pu7z4eA5LJk1ldhlMt84LQmDaw8xmwJCYg=;
 b=dNc59ttl7MoYA3C+jATq7muSM7Olefyz1C2hec9dxqmhQegDrbjxilMstEwsmTzp83
 EV3UaaUDJIKGXeNrJjjvFjHHFHLG+T7PQkYS1UtJHckRyJS/mJzJmW67FvtSownq4LYV
 8JW8Nc7JwUXMO0LacDfTlbVk7bqZrvWDdox6jJgD6/KvGNrs/sGKMaxwFHeLFibTQXZZ
 0INw0Sm5CMzZy1fkIy4P2g51IcAkM/MJq8a/Tc/o19AEh4TJ03/ZU0uGpeJ7kFsd3PNq
 AKjXw4n4NfeCQbT0GqroXBLu6my7sWW0gNVTzmTdGH0Hx+/RqNY9clljsSTp15bNB4Xw
 Re2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aka9zrKZ1Pu7z4eA5LJk1ldhlMt84LQmDaw8xmwJCYg=;
 b=16TfdH/veujWazXqrOe0UkTeE1mzzwtOg4XoYk0PaZ9vEHQ/ofcI+G6FTxLzEyzu+7
 a969pe7ZX5XyIRTAmope46zmE/Vb1ebOzLr50WdWlI4pzdDQT4Amfg6ghao6XBGf+XtH
 NslRtOuuhj1a2vwthhWLijns4gMQUoRhpihsnIUGAfaT9vK517QqxLHAnWt71uzxczGO
 8A76igluWWhSI0Lte9sWZbyajKUF0Bjie6XyO470EVYky94EObSUgmnJWVJjGYxg7Q6k
 eXv7dbgC8SbTa3E1h119zn/vIwjU05Vwx1UfBuIU5+hHURGAAsAVD9tEBr56C2mtPYM6
 aj5w==
X-Gm-Message-State: AOAM532GsBrNx1fwYSaN355Vpza3gk4RhAw3GivmHB9QZnT44Ar8w5Jj
 HvCwLx86fVPlIhA/zacUP5lwWY9PTqQ=
X-Google-Smtp-Source: ABdhPJy+OmY2f/Wn4G8iE2pmOebJwjwd5kMbzyGeyWvvxmXetuNvfy7gXk5APso28Lty/4RUlISv/w==
X-Received: by 2002:a5d:5492:0:b0:210:2f29:b1cf with SMTP id
 h18-20020a5d5492000000b002102f29b1cfmr48650563wrv.468.1654943692618; 
 Sat, 11 Jun 2022 03:34:52 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 t11-20020adff60b000000b002130f1dfe0bsm2131489wrp.74.2022.06.11.03.34.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 19/49] hw/acpi/piix4: move PIIX4PMState into separate piix4.h
 header
Date: Sat, 11 Jun 2022 12:32:42 +0200
Message-Id: <20220611103312.67773-20-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This allows the QOM types in hw/acpi/piix4.c to be used elsewhere by simply including
hw/acpi/piix4.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-5-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 43 +-------------------
 hw/i386/acpi-build.c          |  1 +
 include/hw/acpi/piix4.h       | 75 +++++++++++++++++++++++++++++++++++
 include/hw/southbridge/piix.h |  2 -
 4 files changed, 78 insertions(+), 43 deletions(-)
 create mode 100644 include/hw/acpi/piix4.h

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 316e41e1d0..c2177c5093 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -28,6 +28,8 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
+#include "hw/acpi/piix4.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
@@ -56,47 +58,6 @@ struct pci_status {
     uint32_t down;
 };
 
-struct PIIX4PMState {
-    /*< private >*/
-    PCIDevice parent_obj;
-    /*< public >*/
-
-    MemoryRegion io;
-    uint32_t io_base;
-
-    MemoryRegion io_gpe;
-    ACPIREGS ar;
-
-    APMState apm;
-
-    PMSMBus smb;
-    uint32_t smb_io_base;
-
-    qemu_irq irq;
-    qemu_irq smi_irq;
-    bool smm_enabled;
-    bool smm_compat;
-    Notifier machine_ready;
-    Notifier powerdown_notifier;
-
-    AcpiPciHpState acpi_pci_hotplug;
-    bool use_acpi_hotplug_bridge;
-    bool use_acpi_root_pci_hotplug;
-    bool not_migrate_acpi_index;
-
-    uint8_t disable_s3;
-    uint8_t disable_s4;
-    uint8_t s4_val;
-
-    bool cpu_hotplug_legacy;
-    AcpiCpuHotplug gpe_cpu;
-    CPUHotplugState cpuhp_state;
-
-    MemHotplugState acpi_memory_hotplug;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
-
 static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                                            PCIBus *bus, PIIX4PMState *s);
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 73d0bf5937..cad6f5ac41 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
 #include "hw/acpi/erst.h"
+#include "hw/acpi/piix4.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
new file mode 100644
index 0000000000..32686a75c5
--- /dev/null
+++ b/include/hw/acpi/piix4.h
@@ -0,0 +1,75 @@
+/*
+ * ACPI implementation
+ *
+ * Copyright (c) 2006 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2.1 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#ifndef HW_ACPI_PIIX4_H
+#define HW_ACPI_PIIX4_H
+
+#include "hw/pci/pci.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/cpu_hotplug.h"
+#include "hw/acpi/memory_hotplug.h"
+#include "hw/acpi/pcihp.h"
+#include "hw/i2c/pm_smbus.h"
+#include "hw/isa/apm.h"
+
+#define TYPE_PIIX4_PM "PIIX4_PM"
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
+
+struct PIIX4PMState {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion io;
+    uint32_t io_base;
+
+    MemoryRegion io_gpe;
+    ACPIREGS ar;
+
+    APMState apm;
+
+    PMSMBus smb;
+    uint32_t smb_io_base;
+
+    qemu_irq irq;
+    qemu_irq smi_irq;
+    bool smm_enabled;
+    bool smm_compat;
+    Notifier machine_ready;
+    Notifier powerdown_notifier;
+
+    AcpiPciHpState acpi_pci_hotplug;
+    bool use_acpi_hotplug_bridge;
+    bool use_acpi_root_pci_hotplug;
+    bool not_migrate_acpi_index;
+
+    uint8_t disable_s3;
+    uint8_t disable_s4;
+    uint8_t s4_val;
+
+    bool cpu_hotplug_legacy;
+    AcpiCpuHotplug gpe_cpu;
+    CPUHotplugState cpuhp_state;
+
+    MemHotplugState acpi_memory_hotplug;
+};
+
+#endif
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index ff8d96ae8c..04cbc3fe30 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,8 +15,6 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 
-#define TYPE_PIIX4_PM "PIIX4_PM"
-
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
                       bool smm_enabled, DeviceState **piix4_pm);
-- 
2.36.1


