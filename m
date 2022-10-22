Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC3609687
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:31:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhA8-0005RX-Iy
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG57-0007Bg-Hh; Sat, 22 Oct 2022 11:06:37 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG55-0002Cw-OD; Sat, 22 Oct 2022 11:06:37 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a5so3028387edb.11;
 Sat, 22 Oct 2022 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYVfy9y1+h6JyR2m6Er7WWMrinNKJlNZKF1s+lQY25M=;
 b=ClnOJpQw7uNuC+2TT9kBGMM1m3ik+K5Zq+UC5U8/YjEGmEce+qQWOQ7iWXf27N6pum
 3Hjs7oFNTycqOg9Vxct8eKhGBhEA+w+7uIdMDAzNIzbEuVo5zr19GHJSWUPvcQH667so
 Yz/f0rXVUsItXd5XSRVwcPztkGNGQrWjBaLEacwkyo5Kg6FVHUPkUcIWbhCTFjrvT9vz
 gA+UtRa+0Sgq+WQNQE2rZ0j/Ap5z9owksCRm3LCYWr4R7g8x+mK6xpJFk+gd9RqOswFT
 +fxBm8wMeFQnjOAsXixFY+r2GYFfkvUp0gtv9nAEgJ18W+vPsFTUzjClUuMQ5Tp1hfQh
 G0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYVfy9y1+h6JyR2m6Er7WWMrinNKJlNZKF1s+lQY25M=;
 b=sg/QcWnp8mSCOhF2uxFAhajyFe48pRM3tGZEkKFQUGrLEkDw2aZ8OyPq/p9vL13Cb4
 cu7x5qwQBeHxhhqKFHxjTY+hELjLjeZfHuhIdkKOMljjEgtWHnJJIkaghAiZYyEZ7crB
 GM9+SJDKBBP3w7lo1LvZuNsB/xfbE5R2iuuW5Hn/1cFlJt+5jioxd/+GvDd/Vs43vz8H
 6vLnPk1mZF1mw8RDN+O3lv6ugrUSdXuW0m04RCX7YC7K85AXrT6kQUUCuymxR75ux0pX
 7jsF8o5WBdTRgkvuxIxjBWl/0yHJcDT9nB+RPQNijBgRE1jwHXbnZxDvDnsoq9DQYpyk
 FhuQ==
X-Gm-Message-State: ACrzQf2F5hDS/Ct6jpwFQpACgT0rLR3m1rAzMUEesd8rtFYxkVauBWEd
 rGcz4FR5/vIufdXDh1c4ZUJPP2l9yUARhg==
X-Google-Smtp-Source: AMsMyM4GLIe5MzCDWztZIYY35QhbzFNIuMQXqOOjoRfXcpbZ5OnDYfitxLO01rfe6g+X6fqc/C4ZGw==
X-Received: by 2002:a17:907:7215:b0:791:a61f:56b3 with SMTP id
 dr21-20020a170907721500b00791a61f56b3mr17409950ejc.331.1666451193453; 
 Sat, 22 Oct 2022 08:06:33 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:32 -0700 (PDT)
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
Subject: [PATCH v2 16/43] hw/isa/piix3: Create IDE controller in host device
Date: Sat, 22 Oct 2022 17:04:41 +0200
Message-Id: <20221022150508.26830-17-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

Now that PIIX3 contains the new isa-pic, it is possible to instantiate
PIIX3 IDE in the PIIX3 southbridge. PIIX3 IDE wires up its interrupts to
the ISA bus in its realize method which requires the interrupt
controller to provide fully populated qemu_irqs. This is the case for
isa-pic even though the virtualization technology not known yet.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/Kconfig               |  1 -
 hw/i386/pc_piix.c             | 15 ++++++---------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                |  8 ++++++++
 include/hw/southbridge/piix.h |  2 ++
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..dd247f215c 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -74,7 +74,6 @@ config I440FX
     select ACPI_SMBUS
     select PCI_I440FX
     select PIIX3
-    select IDE_PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f81e91220f..19fe07a13b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -41,7 +41,6 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
-#include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
@@ -86,7 +85,6 @@ static void pc_init1(MachineState *machine,
     PCIBus *pci_bus;
     ISABus *isa_bus;
     Object *piix4_pm;
-    int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
     BusState *idebus[MAX_IDE_BUS];
@@ -236,11 +234,14 @@ static void pc_init1(MachineState *machine,
         for (i = 0; i < ISA_NUM_IRQS; i++) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
         }
-        piix3_devfn = pci_dev->devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+        pci_ide_create_devs(PCI_DEVICE(dev));
+        idebus[0] = qdev_get_child_bus(dev, "ide.0");
+        idebus[1] = qdev_get_child_bus(dev, "ide.1");
     } else {
         pci_bus = NULL;
         piix4_pm = NULL;
@@ -254,6 +255,8 @@ static void pc_init1(MachineState *machine,
 
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
@@ -282,12 +285,6 @@ static void pc_init1(MachineState *machine,
     pc_nic_init(pcmc, isa_bus, pci_bus);
 
     if (pcmc->pci_enabled) {
-        PCIDevice *dev;
-
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
-        pci_ide_create_devs(dev);
-        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
-        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #ifdef CONFIG_IDE_ISA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 24e79a9a41..a021e1cbfc 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -36,6 +36,7 @@ config PIIX3
     select ACPI_PIIX4
     select I8257
     select I8259
+    select IDE_PIIX
     select ISA_BUS
     select MC146818RTC
     select USB_UHCI
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index ce3ec84e22..bbd1dfc373 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,6 +29,7 @@
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/xen.h"
@@ -329,6 +330,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+
     /* USB */
     if (d->has_usb) {
         object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
@@ -370,6 +377,7 @@ static void pci_piix3_init(Object *obj)
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix3_props[] = {
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 7178147b75..1f22eb1444 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/ide/pci.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
@@ -56,6 +57,7 @@ struct PIIXState {
 
     ISAPICState pic;
     RTCState rtc;
+    PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
 
-- 
2.38.1


