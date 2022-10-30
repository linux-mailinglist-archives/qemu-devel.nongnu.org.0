Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99798612D56
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGo8-0000Mi-Al; Sun, 30 Oct 2022 18:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGo5-0000Jn-KK
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGo3-0007BD-R7
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:29 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so2404142wmp.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/69RLPnInvU+qZMlE1eDfBHySO7gxDsMFkwM9Xf3KA=;
 b=vpS4cf2U1PoGZkRSajbxOEUt8ihR94mrmj7lVI82ZCALsdnAxw+9Z/ZXUIOQijN5gG
 vRJfiCvBd8MyWIj4adHZz7xeERJWZFfh6wOnDGWGuDu5qrh2po1OAxEOkvHSHdPzYRpr
 cAzVfZ1i99fV2SzfZGQ5XVGXJRJ6h6Li6O7cih4zzs9ryE5UHKvacsIKVFOdFkmFUL6C
 uCDgaep+h/eQQqcB9D60OlJnp17VY+PG76ahSY5YWiEHyu8wChqY9rY1iOTYT6iSVQ0l
 UNoyOhFemklvneUZipSuBU8QT9GHPtyTL2viohuOHO/8yKqglB4uSuZgYkJtj586vRxy
 pbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/69RLPnInvU+qZMlE1eDfBHySO7gxDsMFkwM9Xf3KA=;
 b=4ZCGxJii+tdvuw6IluzwMTHc/7ZTKPUszAnW18/FcxpMfIOid21G0n5bnIHJT74ojI
 dGgYIcw15rCTlUgMfBMHdj0hFse8qoVUs8xkNagAGmYYVAIwjFLzsfUjTe/Cy2bunu9M
 LyC84pme6w/X/H05p08UDLwwfw1VroCIz55uiOdHkZFNGLhRGoum7Jhrdhf9JHrDp88b
 EBChdVKowGJ3SosbbTQSI9egbPPYNJkgVZb9InWg0X2r/a/nToXFhWP2f3y97UjJn1dT
 2Yvv30IMH3MgSc1YLpUK1sbL1bNXlqYvwqLwJR1v8Rac9KvbWKR4g/7UKuiHiVaXmUfZ
 ZHzw==
X-Gm-Message-State: ACrzQf3iPgdE6HUUPxUlI2VF+L7cNtUil7bVX6u4ZfXr2bp8ShV5cRK1
 HTu+re00E9bggCXxwRF/gGDp6PfKF//V/Q==
X-Google-Smtp-Source: AMsMyM7ucvOYCVK5CE7sMENDr8QSJ4gsHVfeDReuO1qoiH/Y1BVbzz0wtkxII9CJX92hHbzmV4i6+A==
X-Received: by 2002:a1c:ac81:0:b0:3c6:e566:cc21 with SMTP id
 v123-20020a1cac81000000b003c6e566cc21mr6231340wme.0.1667168965649; 
 Sun, 30 Oct 2022 15:29:25 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b002238ea5750csm6367396wrb.72.2022.10.30.15.29.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 06/55] hw/isa/vt82c686: Instantiate IDE function in host device
Date: Sun, 30 Oct 2022 23:27:52 +0100
Message-Id: <20221030222841.42377-7-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

The IDE function is closely tied to the ISA function (e.g. the IDE
interrupt routing happens there), so it makes sense that the IDE
function is instantiated within the south bridge itself.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configs/devices/mips64el-softmmu/default.mak |  1 -
 hw/isa/Kconfig                               |  1 +
 hw/isa/vt82c686.c                            | 17 +++++++++++++++++
 hw/mips/fuloong2e.c                          |  8 ++++----
 hw/ppc/Kconfig                               |  1 -
 hw/ppc/pegasos2.c                            |  9 ++++-----
 6 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index c610749ac1..d5188f7ea5 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -1,7 +1,6 @@
 # Default configuration for mips64el-softmmu
 
 include ../mips-softmmu/common.mak
-CONFIG_IDE_VIA=y
 CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
 CONFIG_ATI_VGA=y
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index d42143a991..20de7e9294 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -53,6 +53,7 @@ config VT82C686
     select I8254
     select I8257
     select I8259
+    select IDE_VIA
     select MC146818RTC
     select PARALLEL
 
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 37e37b3855..63c1e3b8ce 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -17,6 +17,7 @@
 #include "hw/isa/vt82c686.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
+#include "hw/ide/pci.h"
 #include "hw/isa/isa.h"
 #include "hw/isa/superio.h"
 #include "hw/intc/i8259.h"
@@ -544,6 +545,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    PCIIDEState ide;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
     }
 };
 
+static void via_isa_init(Object *obj)
+{
+    ViaISAState *s = VIA_ISA(obj);
+
+    object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
+}
+
 static const TypeInfo via_isa_info = {
     .name          = TYPE_VIA_ISA,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(ViaISAState),
+    .instance_init = via_isa_init,
     .abstract      = true,
     .interfaces    = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
+    PCIBus *pci_bus = pci_get_bus(d);
     qemu_irq *isa_irq;
     ISABus *isa_bus;
     int i;
@@ -612,6 +623,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
         return;
     }
+
+    /* Function 1: IDE */
+    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
+    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 44225fbe33..32605901e7 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -199,13 +199,13 @@ static void main_cpu_reset(void *opaque)
 static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                        I2CBus **i2c_bus)
 {
-    PCIDevice *dev;
+    PCIDevice *dev, *via;
 
-    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
+    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
+    qdev_connect_gpio_out(DEVICE(via), 0, intc);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), TYPE_VIA_IDE);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 791fe78a50..76a4612d96 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -74,7 +74,6 @@ config PEGASOS2
     imply ATI_VGA
     select MV64361
     select VT82C686
-    select IDE_VIA
     select SMBUS_EEPROM
     select VOF
 # This should come with VT82C686
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 0ccc130b88..76f0dee4aa 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -102,7 +102,7 @@ static void pegasos2_init(MachineState *machine)
     CPUPPCState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     PCIBus *pci_bus;
-    PCIDevice *dev;
+    PCIDevice *dev, *via;
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
@@ -160,13 +160,12 @@ static void pegasos2_init(MachineState *machine)
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     /* VT8231 function 0: PCI-to-ISA Bridge */
-    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
+    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0,
+    qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-    /* VT8231 function 1: IDE Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), TYPE_VIA_IDE);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
-- 
2.37.3


