Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB8537A42
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:59:11 +0200 (CEST)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nve3C-0005hl-K9
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZl-0001EE-G2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZc-0001Qt-E2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:41 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so10472951pjq.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gl7VmOFS0QE71p65j/AIx7cuE/Y7oce8vEQOaqGwrOw=;
 b=oI8tn1x05z9uzB2+Z0Dd8Ard+oEWeW8GySzGV4jnxfD+BVBGWu6A4lgQ2mOQREVyBL
 gaF8VWrMo7+/pMEu/TKjbgdDyG9P11rtd1/wGBQGmvE/yQmjm7/7ce3Ua6mQ3NqACzzg
 uAMG3DcU6dFtudtqH8dhgLQVlDPRL3pRZMFCDLTMSpbDUb+dulL33AXtKwT7qoRUsv5D
 Rz1LZfVW4kARO8FReE/iPzenIv3f9A3TPkPQU3qHxtK2YRGZxuCgCBv7T9ZWYAW2ykqS
 s1vougYpvKKKK+JST93WMihmkhdrdoGWPiv9g/pXphMR0za/EsrBRTusoJtDmaMQsr8U
 FuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gl7VmOFS0QE71p65j/AIx7cuE/Y7oce8vEQOaqGwrOw=;
 b=VjME/J7W2Vslb1abVARW1BEnkEaCvP/ax12x2JZqIR6sGcvMycLQmWtplrwGZCEyg9
 3/xWGLry9rjWwisKuPYt0YLFVG1sKYVGfA65D/ZiF1cwmIDxl4oNGV3g2qTxj3zRtjK+
 EbKP8lZFkZc9n95VBSMIszmHRLI7D4OREK4RSUP2Rl+hfbmYfAqznN8CWXqebvrdNe9X
 L5lf5tG/6wsvJ3xLbNFEZjCWb/e4MWGIwzCkiPUdCJAPN2pFHfa1t1RVeE4TOYFN1jrc
 PJZx98fQ2QqU8lseANKXf2iPKNBmQJP9SjVW6TEW9WCKAoOn52jUAfaRj+V4imYTaN6d
 KsVg==
X-Gm-Message-State: AOAM531zC/qUvoHzFOU+UqQouNyNiZbuFVRkgN7fjNeNRXlE4NW28Oot
 xoYSr5OtpQbeevW/BJ/C2x0=
X-Google-Smtp-Source: ABdhPJxe69m3aQajjTqVS9zL1PPYL44mryItujQJNCdH4i+OKTWenAExLzZ3ImaQISafG1C7C0mryA==
X-Received: by 2002:a17:90a:66c1:b0:1e2:758c:46f1 with SMTP id
 z1-20020a17090a66c100b001e2758c46f1mr18942688pjl.104.1653910115142; 
 Mon, 30 May 2022 04:28:35 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170902d5c200b0015e8d4eb2ddsm8905312plh.295.2022.05.30.04.28.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:28:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 07/11] hw/acpi/piix4: use qdev gpio to wire up sci_irq
Date: Mon, 30 May 2022 13:27:14 +0200
Message-Id: <20220530112718.26582-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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

Introduce piix4_pm_init() instance init function and use it to
initialise the separate qdev gpio for the SCI IRQ.

The sci_irq can now be wired up directly using a qdev gpio instead
of having to set the IRQ externally in piix4_pm_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-9-mark.cave-ayland@ilande.co.uk>
[PMD: Partially squash 20220528091934.15520-8-mark.cave-ayland@ilande.co.uk]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 12 +++++++++---
 hw/i386/pc_piix.c             |  4 ++--
 hw/isa/piix4.c                |  6 +++---
 include/hw/southbridge/piix.h |  3 +--
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 418ec4ee56..fe5ec0a723 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,15 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
+static void piix4_pm_init(Object *obj)
+{
+    PIIX4PMState *s = PIIX4_PM(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+}
+
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq sci_irq, qemu_irq smi_irq,
-                              bool smm_enabled)
+                              qemu_irq smi_irq, bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -511,7 +517,6 @@ PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
 
     s = PIIX4_PM(dev);
-    s->irq = sci_irq;
     s->smi_irq = smi_irq;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
@@ -663,6 +668,7 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_pm_info = {
     .name          = TYPE_PIIX4_PM,
     .parent        = TYPE_PCI_DEVICE,
+    .instance_init  = piix4_pm_init,
     .instance_size = sizeof(PIIX4PMState),
     .class_init    = piix4_pm_class_init,
     .interfaces = (InterfaceInfo[]) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d2ab9f966c..0662bf44a9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -284,9 +284,9 @@ static void pc_init1(MachineState *machine,
         PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
-                                   x86ms->gsi[9], smi_irq,
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100, smi_irq,
                                    x86_machine_is_smm_enabled(x86ms));
+        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 33a7015ea3..0b6ea22143 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,9 +311,9 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100,
-                              qdev_get_gpio_in_named(dev, "isa", 9),
-                              NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, NULL, 0);
+        qdev_connect_gpio_out(DEVICE(pms), 0,
+                              qdev_get_gpio_in_named(dev, "isa", 9));
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
     }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f75a4adf5f..105d158f78 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -17,8 +17,7 @@
 #include "hw/acpi/piix4.h"
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq sci_irq, qemu_irq smi_irq,
-                              bool smm_enabled);
+                              qemu_irq smi_irq, bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


