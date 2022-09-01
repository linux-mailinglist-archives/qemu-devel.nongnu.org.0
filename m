Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA55A9DEA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:20:50 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTns1-00061Z-Pj
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2Z-0002R7-U6
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:43 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2T-0001Zn-FT
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kk26so35781874ejc.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EYL1ArUXnBEDKheHV+RJi2vAyx0SKvcQH3qkVL+XdAA=;
 b=Ls8KsdDNf0XIVNsyGYKFhWiU1jlIxUHCl+qzcZflwuB62gWmN7NT+JtGyySK/tuHyX
 t9FzVoj1BwzCj133FB3U9RTNbLGuop5Olb0CkbFJ/BMHEskS7w1jhHgxTl9VYGlajNUF
 YfIutBWN5DWQRlDVfNkCAmOrKFU7eUiaCPjr63lQD7Lva0jxoo712Uif+dWbYllW6jk6
 mjBqDIYV+z7PErgcaZdmY0p6aNiwMmSWTxOXZix3TI7xilFRBVnl79gkuXfA0LQPeYyx
 yEEBQw9gwmYbPl6dZx9HeOxUOgJRdPFOziP8YxL4pZ2QbFtMgyTUOHnKWeH4GrU9U2nT
 lOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EYL1ArUXnBEDKheHV+RJi2vAyx0SKvcQH3qkVL+XdAA=;
 b=2jFywaot3LRQCZIvTVPAX6/E9EYfXg1iVHRci4/xSr55P/kYmpyKftu4iTZRrxmN8n
 ec7SVapaUqAwl77UeoStTyCYEkMJ7yjPFEIQTF1zb81AldCy+k4afMkZGGjFTZm07b46
 GZ14i3XAW+vWiIUVWBx155hE2WZrwctxOmi7MzUnVQTQtITVm02PQuc+e+z+wKZAI2Tn
 cxyLrfMTrl/LS0Uzx7ORDQ/YqvmAqYWzJBMRkLWWQjqXoeX/wzxIFK2nv/0GscNmMLLn
 dB/v/iNxyraaH8dTrIA96rWmGOESsTpb1VBf+f/xGxDDXXjYkvy+nSCwZEouL25cJVur
 JcoA==
X-Gm-Message-State: ACgBeo1DOIK2w0r8mMHA+xYpLdHuTglW9RdM7w9e6UcrWFWxfsR1iuGe
 9vU4ug9Sz02GU4xpwn9LcBLi4dzvzuE=
X-Google-Smtp-Source: AA6agR7vIgdUhVhnZyQp0IVBg0FU3xZVrEouW00VA4N3q5vLqNyCfKs1JaMKIdAWx3FpZXHbNsjxjA==
X-Received: by 2002:a17:906:7315:b0:741:5b1b:920d with SMTP id
 di21-20020a170906731500b007415b1b920dmr16667089ejc.484.1662049650467; 
 Thu, 01 Sep 2022 09:27:30 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:30 -0700 (PDT)
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
Subject: [PATCH 39/42] hw/isa/piix: Unexport PIIXState
Date: Thu,  1 Sep 2022 18:26:10 +0200
Message-Id: <20220901162613.6939-40-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

The - deliberately exported - components can still be accessed
via QOM properties.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c                 | 52 +++++++++++++++++++++++++++++++++
 include/hw/southbridge/piix.h | 54 -----------------------------------
 2 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index e413d7e792..c503a6e836 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -26,20 +26,72 @@
 #include "qemu/osdep.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "qom/object.h"
+#include "hw/acpi/piix4.h"
 #include "hw/dma/i8257.h"
+#include "hw/ide/pci.h"
 #include "hw/intc/i8259.h"
 #include "hw/southbridge/piix.h"
 #include "hw/timer/i8254.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "hw/rtc/mc146818rtc.h"
+#include "hw/usb/hcd-uhci.h"
 #include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
+#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
+struct PIIXState {
+    PCIDevice dev;
+
+    /*
+     * bitmap to track pic levels.
+     * The pic level is the logical OR of all the PCI irqs mapped to it
+     * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
+     *
+     * PIRQ is mapped to PIC pins, we track it by
+     * PIIX_NUM_PIRQS * ISA_NUM_IRQS = 64 bits with
+     * pic_irq * PIIX_NUM_PIRQS + pirq
+     */
+#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
+#error "unable to encode pic state in 64bit in pic_levels."
+#endif
+    uint64_t pic_levels;
+
+    /* This member isn't used. Just for save/load compatibility */
+    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
+    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
+
+    ISAPICState pic;
+    RTCState rtc;
+    PCIIDEState ide;
+    UHCIState uhci;
+    PIIX4PMState pm;
+
+    uint32_t smb_io_base;
+
+    /* Reset Control Register contents */
+    uint8_t rcr;
+
+    /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
+    MemoryRegion rcr_mem;
+
+    bool has_acpi;
+    bool has_usb;
+    bool smm_enabled;
+};
+typedef struct PIIXState PIIXState;
+
+DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
+                         TYPE_PIIX3_PCI_DEVICE)
+
 static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
     qemu_set_irq(piix->pic.in_irqs[pic_irq],
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index c9fa0f1aa6..0edc23710c 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -12,14 +12,6 @@
 #ifndef HW_SOUTHBRIDGE_PIIX_H
 #define HW_SOUTHBRIDGE_PIIX_H
 
-#include "hw/pci/pci.h"
-#include "qom/object.h"
-#include "hw/acpi/piix4.h"
-#include "hw/ide/pci.h"
-#include "hw/intc/i8259.h"
-#include "hw/rtc/mc146818rtc.h"
-#include "hw/usb/hcd-uhci.h"
-
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
 #define PIIX_PIRQCB 0x61
@@ -32,53 +24,7 @@
  */
 #define PIIX_RCR_IOPORT 0xcf9
 
-#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
-
-struct PIIXState {
-    PCIDevice dev;
-
-    /*
-     * bitmap to track pic levels.
-     * The pic level is the logical OR of all the PCI irqs mapped to it
-     * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
-     *
-     * PIRQ is mapped to PIC pins, we track it by
-     * PIIX_NUM_PIRQS * ISA_NUM_IRQS = 64 bits with
-     * pic_irq * PIIX_NUM_PIRQS + pirq
-     */
-#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
-#error "unable to encode pic state in 64bit in pic_levels."
-#endif
-    uint64_t pic_levels;
-
-    /* This member isn't used. Just for save/load compatibility */
-    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
-    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
-
-    ISAPICState pic;
-    RTCState rtc;
-    PCIIDEState ide;
-    UHCIState uhci;
-    PIIX4PMState pm;
-
-    uint32_t smb_io_base;
-
-    /* Reset Control Register contents */
-    uint8_t rcr;
-
-    /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
-    MemoryRegion rcr_mem;
-
-    bool has_acpi;
-    bool has_usb;
-    bool smm_enabled;
-};
-typedef struct PIIXState PIIXState;
-
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
-
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
-- 
2.37.3


