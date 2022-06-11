Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606054742A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:17:47 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzz7i-0002Cf-6F
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySV-0004qv-BT
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyST-0006Uu-Ni
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id u8so1448778wrm.13
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycvq963bj+0x7tuoq8vXuG7x1mD6FvAr2h3JjItEWiM=;
 b=kJOoRR3gG6FF2fcQfgU90hXUKVXgfHqiiLoBzTKJniJq5KkGG0jEoQ3/DtZwLAc+Dj
 JK+PGbuwdgRpoIf18B3yhlamRBRjg8X6PJQESUg5tDeMALLKQ4JDGhD1QgyeJezJQNmT
 ac2oj33QUefp+9gn8zrGaEMomzX3/nK5rhm+BroZy25xQ/gPnreth4NiTYVb5HiBmNlY
 cHLzBkXNnqGscwcKDyaTTgMYZAmS+Wesu38tn8fIccj1qsGP+nQSMcGPuNS4UGHUeBwt
 YeTMOtZI1WZ4uDppOBiuCdHl+C8Sq0b1Khk4yULIdUPzPV6GkT1YfsLnm6G5X7TsJgQ6
 FstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ycvq963bj+0x7tuoq8vXuG7x1mD6FvAr2h3JjItEWiM=;
 b=q291tpbS8FPRnyDZbl60Rv4N6Ah+s5YAwLdQC26ActIFK9kzyCKgHXWxWdyjVBT3o/
 juzANIpgu+S6CMaUY/D7bwgCRIKVWONDbLdEr404L/4H/WfLnHHFvEcPzhXpRTbTF26Y
 dce7RtfHo1Q4YgItSFzaZkQGtee1ABWTRQ1rm1UGJmOt6CvBJUlDRj3VsF7mmo2EhIdn
 DT+EOAYaPlYMb3bSa1VGX+/fdU42qjA0WP1V9AFUwduigHWCnERINQ4AM7kn0YySF7nL
 DtbeQYkIIPiHc2TnwUJyd+Q9XjLJ16f393qan1jwxSCMMsvy5Fao1B1wkgpJpWACZw1d
 F0LQ==
X-Gm-Message-State: AOAM5335qMrbi1oRNA8NL+KbtEXlyKL53jbq69bMZQJA6tpIzHLyOYE0
 cqQlCqjzhWhwGmZC3un92MhgEc3TJlk=
X-Google-Smtp-Source: ABdhPJymdh3U3gyzuNFI6EAJ5bKvQLV8BOzsVoNtZPA74X58Oen2c0K7sRtMvlJ1ibTxLs+0D9Wdww==
X-Received: by 2002:a5d:59a4:0:b0:218:4a29:f12b with SMTP id
 p4-20020a5d59a4000000b002184a29f12bmr27370139wrr.145.1654943708265; 
 Sat, 11 Jun 2022 03:35:08 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c265200b003973d425a7fsm2247352wmy.41.2022.06.11.03.35.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:07 -0700 (PDT)
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
Subject: [PULL 22/49] hw/acpi/piix4: use qdev gpio to wire up sci_irq
Date: Sat, 11 Jun 2022 12:32:45 +0200
Message-Id: <20220611103312.67773-23-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
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
index fde0fdc088..27acba4146 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -283,9 +283,9 @@ static void pc_init1(MachineState *machine,
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


