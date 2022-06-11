Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14535547408
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:57:36 +0200 (CEST)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyoB-0001Q7-2Z
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySL-0004iY-9Y
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySJ-0006Jg-Lu
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k16so1482865wrg.7
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1t9tYgatWt24bQaSrmnXZ4KfcWsmexzRBCbydLr6+Y=;
 b=NBScj0Q1eam0szZ/snIhmuEs/IbXpDIlDqBtX+eLtR8dcKa6Fr2S0+PMnwrjhFZMJX
 JxTRDB0raKfFReCYylLX9vEvIYv/G73s5JvPNOdrhMuqQTMWLM3kTNeRZLFi2J9wtwz0
 hzNe9BcL4YvycKmOCbn3Ahq60dwTBSNaYinmZGYU6IrYYfORr3uGFYfU4IUkpod5H63I
 C4SimYMM+m0gIW+81R0sq1MIja/tA+7JY3lFRY78OnGlX3z+PASs85XpAaqK6AVn3zwV
 1e7rXhCzLYXpLYrY0/sUUYRn0+eA84iorSDXBfiNoy+ieTNgC1tgJ1N15vactqLy3XXh
 cSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1t9tYgatWt24bQaSrmnXZ4KfcWsmexzRBCbydLr6+Y=;
 b=N3y4y3tvcY3x7SJGQHLj8IOT6XtExb0DVfZ3KG7ce60SjNEdwFZ2n2N+PFY+y/56+o
 MIbkTMZnVS90TUxpW+PenjPlTl89d8/Y5/bop4CJoZjq1M3ZpwKQcT8Kn6VawK2393Ic
 6IllFH7ZqkzZpedniQ6ebJoZh4HrGLxfdB1zn51GVtJw3mCMjDDjjXDDCRLG9amg7PO6
 ta6uTM6wZre/sj1NWQT2e3Z/2Mtw8dsFwfCNhBbXMZ4kkkrqp1WHte9dVhqZdJ4c41ht
 x51KyKiCPDS4+XOTS+GFdditWOYjCfzagfzQHsdPOtq+70BJT+8OqMuiiGmi1dsRHHuL
 NzCQ==
X-Gm-Message-State: AOAM531mpgeHWXRBR0v0gwhKQFAfi1W7l73pQ+XQWFTFtPCV+97eSMLO
 zmsc7RjtDc9ri4fQJYFAdhP96xQf2P4=
X-Google-Smtp-Source: ABdhPJyvjhsd9Nz02KwEkB5jMMPVfPE1bOudh8QOaxbuhaOrZFnCypnFTEyGfu8MwKpUu5ub8UqSKw==
X-Received: by 2002:adf:e30f:0:b0:210:346e:d5da with SMTP id
 b15-20020adfe30f000000b00210346ed5damr47067400wrj.313.1654943697669; 
 Sat, 11 Jun 2022 03:34:57 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m12-20020a5d6a0c000000b0020cdcb0efa2sm2159084wru.34.2022.06.11.03.34.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:57 -0700 (PDT)
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
Subject: [PULL 20/49] hw/acpi/piix4: alter piix4_pm_init() to return
 PIIX4PMState
Date: Sat, 11 Jun 2022 12:32:43 +0200
Message-Id: <20220611103312.67773-21-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

This exposes the PIIX4_PM device to the caller to allow any qdev gpios to be
mapped outside of piix4_pm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-6-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 11 ++++-------
 hw/i386/pc_piix.c             | 10 +++++-----
 hw/isa/piix4.c                |  8 +++++---
 include/hw/southbridge/piix.h |  7 ++++---
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index c2177c5093..c4cfb75020 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      bool smm_enabled, DeviceState **piix4_pm)
+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                            qemu_irq sci_irq, qemu_irq smi_irq,
+                            bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -509,9 +509,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     dev = DEVICE(pci_dev);
     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
-    if (piix4_pm) {
-        *piix4_pm = dev;
-    }
 
     s = PIIX4_PM(dev);
     s->irq = sci_irq;
@@ -519,7 +516,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
-    return s->smb.smbus;
+    return s;
 }
 
 static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index bd63511c1c..3359b40f54 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -280,14 +280,14 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        DeviceState *piix4_pm;
+        PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
+        piix4_pm = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
+                                 x86ms->gsi[9], smi_irq,
+                                 x86_machine_is_smm_enabled(x86ms));
+        pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
-        pcms->smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                                    x86ms->gsi[9], smi_irq,
-                                    x86_machine_is_smm_enabled(x86ms),
-                                    &piix4_pm);
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
 
         object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8607e0ac36..7d9bedd1bb 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -293,6 +293,7 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
+    PIIX4PMState *pms;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -310,9 +311,10 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                               qdev_get_gpio_in_named(dev, "isa", 9),
-                               NULL, 0, NULL);
+        pms = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
+                            qdev_get_gpio_in_named(dev, "isa", 9),
+                            NULL, 0);
+        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 04cbc3fe30..a362ec7484 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,10 +14,11 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/acpi/piix4.h"
 
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      bool smm_enabled, DeviceState **piix4_pm);
+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                            qemu_irq sci_irq, qemu_irq smi_irq,
+                            bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


