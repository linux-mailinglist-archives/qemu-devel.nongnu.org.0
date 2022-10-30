Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3F612D8A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGtP-0006UC-Cd; Sun, 30 Oct 2022 18:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrd-0002gp-RD
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrb-00009m-Kb
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id o4so13673979wrq.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prCZWe1qUq4h9W9onhXJqZxcG/1SDlWv+xiRK3rSU4E=;
 b=jPLtpFcXxWSiepqJ2VrohNqcCtx2iTzaIRBwRw1bCKpdJj7MHKK0fkEXT/J5NY2RqA
 j2YyJ4QmAAWM1wg+uNQJvWhPo+A08alRibgLPbPtG+8MKr41zFs0s0jNo8NQ+fcF95mt
 HgLt3R5w0WfsCDFyo0hbZo4EzS0SxumA48k55zUFLraucgjrhZjJih4o83INWsejKHCg
 ZSyJ+zIX3FibQ/s5twoUPnSVxPWMsFuGygg+aiiOV0/uXi0AL+M698Kb3ecU1NMmVOx3
 tLS4i8dIHddVtDOz3VJaF04oT24AfUsuVeZHqm4GMJUe8tbgLz/fYl5Nn+3OgpZXia0a
 7I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prCZWe1qUq4h9W9onhXJqZxcG/1SDlWv+xiRK3rSU4E=;
 b=Tl44GMX1B4JuvqBo/f/wZI4hknAghyGGekCLxMJkPNHWtaii0vZQuZ8mP/chNPmzGK
 CQIt/GeH2KefKwq0SWXgOXgwwnqcClU9XL2nxGAh8ABxFz7/ww8CXSRinj0oSgvt3r2b
 3RwK319nc66DkHNDvgd0Ycvf+aI4CZS5B+8jDDHawctFclBehgRK9y+ebZ2LcKhE6OxU
 mEEXi3CqDdDUtK2T6kKVK9B4iZjF0D1ktIOL2DOVUdCp6SjSS0IleI1D3wOMkZZd3Cqr
 xaqSlp1j7JFtJWWu7XgJoSOdRrfuGhhUdLm9CdLd0WGk99QVhEk38up2nlb8/JMwjtNe
 ZNHA==
X-Gm-Message-State: ACrzQf1sKuE0IMy4cehlWCfCfnOfddY96Ug64VX8T81ikPAe1NACw6UM
 sPKxX/zOXI+ku2tnAkUPk4213hf9rDnaMg==
X-Google-Smtp-Source: AMsMyM5COuYOjCfyhlZaToyVK1Tad7AlkwSweG0qI/YwdlpVvBN0dTqYY/OiFXWea3ynJMUZgoyTnQ==
X-Received: by 2002:adf:e907:0:b0:236:5d8d:5525 with SMTP id
 f7-20020adfe907000000b002365d8d5525mr6270874wrm.431.1667169186123; 
 Sun, 30 Oct 2022 15:33:06 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a05600c349100b003b47ff307e1sm5452515wmq.31.2022.10.30.15.33.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 40/55] hw/i386/pc: Create DMA controllers in south bridges
Date: Sun, 30 Oct 2022 23:28:26 +0100
Message-Id: <20221030222841.42377-41-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Just like in the real hardware (and in PIIX4), create the DMA
controllers in the south bridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221022150508.26830-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c      | 3 ---
 hw/i386/pc_piix.c | 2 ++
 hw/isa/Kconfig    | 2 ++
 hw/isa/lpc_ich9.c | 3 +++
 hw/isa/piix3.c    | 9 +++++++--
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 768982ae9a..b39ecd4d0c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -47,7 +47,6 @@
 #include "multiboot.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/intc/i8259.h"
-#include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
 #include "hw/input/i8042.h"
 #include "hw/irq.h"
@@ -1320,8 +1319,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pcspk_init(pcms->pcspk, isa_bus, pit);
     }
 
-    i8257_dma_init(isa_bus, 0);
-
     /* Super I/O */
     pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
                     pcms->vmport != ON_OFF_AUTO_ON);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0b1a79c0fa..7a55b9ca8e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -26,6 +26,7 @@
 #include CONFIG_DEVICES
 
 #include "qemu/units.h"
+#include "hw/dma/i8257.h"
 #include "hw/loader.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
@@ -225,6 +226,7 @@ static void pc_init1(MachineState *machine,
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 20de7e9294..60aad28800 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -33,6 +33,7 @@ config PC87312
 
 config PIIX3
     bool
+    select I8257
     select ISA_BUS
 
 config PIIX4
@@ -68,6 +69,7 @@ config LPC_ICH9
     bool
     # For historical reasons, SuperIO devices are created in the board
     # for ICH9.
+    select I8257
     select ISA_BUS
     select ACPI_SMBUS
     select ACPI_X86_ICH
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 4553b5925b..8694e58b21 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -34,6 +34,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/range.h"
+#include "hw/dma/i8257.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -722,6 +723,8 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, GSI_NUM_PINS);
 
     isa_bus_irqs(isa_bus, lpc->gsi);
+
+    i8257_dma_init(isa_bus, 0);
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 48f9ab1096..44a9998752 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "hw/dma/i8257.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -295,9 +296,11 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    ISABus *isa_bus;
 
-    if (!isa_bus_new(DEVICE(d), get_system_memory(),
-                     pci_address_space_io(dev), errp)) {
+    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
         return;
     }
 
@@ -307,6 +310,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
     qemu_register_reset(piix3_reset, d);
+
+    i8257_dma_init(isa_bus, 0);
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
-- 
2.37.3


