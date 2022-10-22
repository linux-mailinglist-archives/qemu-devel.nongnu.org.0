Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F91609901
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:04:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgeM-0001Gn-Kg
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4P-0006zC-Ec; Sat, 22 Oct 2022 11:05:53 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4N-00020s-NI; Sat, 22 Oct 2022 11:05:53 -0400
Received: by mail-ed1-x533.google.com with SMTP id m15so16048518edb.13;
 Sat, 22 Oct 2022 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NYjJAiwL3UkwUI5mA0F3Wlg5qiA3msCo54CbNGwBvU=;
 b=Y9BFyq6eC2hhZUACYAhhwfxetpXfaVv8xvz8h4fo37MaMENg2lSZgQyIJ/HO0TWWCN
 fT9ue+DGg8eYjazACEspN2nQsjFCpbsDJJS1QKvh4j6KowPjscBorUXEVk8Ct7D9B9Ss
 K4IR6pLjg70sS0L2eFXLBp8fawfENn1Dpi6/95PHg0Fb5WagUY/5moDhsmhPp8jdZFzx
 p5lPSqCHPr2feSxEd29xNi4/uW1lRr6n1IqD9jp+Sm2deUTW729EzOkOO6wUkDxvGCKU
 WmGwqVrWv8zFeHzKer/glsWxyA6z0ZcUMe0ehQkseMj6QIDa2sbO6T0vwtpYmgkY/Nyo
 KhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NYjJAiwL3UkwUI5mA0F3Wlg5qiA3msCo54CbNGwBvU=;
 b=faCEjyBB8TqLr9RYy69+QPLuUJdj76SUTyq3+I5cX479a8gQo7T74ZHB5cv7C734bk
 6/DevZqxY8kvVFf45Le5U/tVh7RsG5J+s9kV5qgodS2X+6xOMQp7+xeEhxjSEbwnmmBl
 xyUq9jxDE32ghYbM7ZcEyMcrR9MhzLXLtNsliRizqdk0rx2uMT4VB2ILAwhngdmcfkRK
 L2S7IkEZjzFUxZT0mOyrOYDL0YjrdY4B631voqSiABmWPoEU+XkNy68rc0d9yFGAXLGs
 suSzPXJVUY+A/KEkyiXxu2xw+OjdXWsjaN5glVVyW3bLga9hfZGIshkyLHj125FRqV6z
 ucoQ==
X-Gm-Message-State: ACrzQf1eAUgNd+oUtOh5g4inzueQ3TVhfSuraMSONWPaL5f/3yWz1KOF
 BZBbYAOqCwgGrmGLBujo6SZ5dNQrLD1mYw==
X-Google-Smtp-Source: AMsMyM4nXtChWRXkOU/AyiyUMhmhOFJaAeFiotW50Mq6NZZOv2EAUcV3ur0ZB35vrBXGojQv59hJ7Q==
X-Received: by 2002:a17:907:d9e:b0:78e:2ff7:72f4 with SMTP id
 go30-20020a1709070d9e00b0078e2ff772f4mr19383740ejc.608.1666451148449; 
 Sat, 22 Oct 2022 08:05:48 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:05:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 01/43] hw/i386/pc: Create DMA controllers in south bridges
Date: Sat, 22 Oct 2022 17:04:26 +0200
Message-Id: <20221022150508.26830-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like in the real hardware (and in PIIX4), create the DMA
controllers in the south bridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index d42143a991..c65d2d2666 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -33,6 +33,7 @@ config PC87312
 
 config PIIX3
     bool
+    select I8257
     select ISA_BUS
 
 config PIIX4
@@ -67,6 +68,7 @@ config LPC_ICH9
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
2.38.1


