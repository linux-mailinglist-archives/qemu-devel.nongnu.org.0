Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159DD547437
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:25:50 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzFV-0000iK-5L
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTK-0005zQ-GZ
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:02 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTI-0006k5-Ry
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:02 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso2236726wms.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lYYHMhpJah66B43fCdeT+kLyN3px6fr6Fuks14wRcc4=;
 b=hsDZTRGPQlodkvyVzhGrNVKXvLJAHMDb67dCAI3hkGCywrbdQN5PDS8z/0k8NKOqAf
 jW9UJFoAH8Dn7eFJQmx0b5dNj/H4LEwOvHmq0Q0Kyl+p9+9GiBI8+QgvJZSA2pNV+p0H
 umInzdKbGiQhP/BGmtJgVTOEqt5MrJo2cvwxaDi1CL1aX7i2a2z7fhkYOyV5kJsBQZ/X
 7B0sX7tBADqknBhnGDsssFMffMMS1LB1Y2Ur9b/9jnvUNtQ/eeYm1LVQOKdkn8kqZyRI
 T6YgNq68Z2c/bZ4na5uEl2/7Cio59S28nMzNEC/Am0Y9OIoHP5vzrvJRl9nSh/VTGQDZ
 YSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lYYHMhpJah66B43fCdeT+kLyN3px6fr6Fuks14wRcc4=;
 b=Ip1Rb8YjEeHtgJTOltUQtPmb2rVW2uRHsBgEsN2ajrkSz0iR6/mcr4zU1MQpiwpaZo
 STccoeGCbqWl+NxZrIkXEAVRpPR5VVISqgrFJ2518h75bHYDOOd9FAY12i4nJlKonsW7
 NeBE4GDUWSzS3YLy1nUsuWxmDHRh30rE/awD/GlaGAOmEsLBUMdXKjIUJeOS4oDyGArj
 zq966SHhX4BkYw+uGbcdDpK/9ByRdOauWbY7EG5hIcUyBu5/bMFUXMMQ/icsj5Xy8daM
 BQLTlxjarnGdmn9RBRcOARUvpDMDKy16jZwHSaOhHgXfW2EERPkQkXSNbc4HS7aKAyFj
 yXpA==
X-Gm-Message-State: AOAM5307Rls9bwVuQtZF7/jWzF94HvTKtSOaU+BAxwjJfmnEF6XjeK86
 CXRCTmi1HzzofRZZ0jvaM+X5A6tlTRM=
X-Google-Smtp-Source: ABdhPJzuAf6aZSXbLMfNderHoGbgrwKOXsO953iWGslXYN/7eDpwvCZo4jQAJXWpCrECALv63ugr8A==
X-Received: by 2002:a1c:7901:0:b0:39c:4252:d7f1 with SMTP id
 l1-20020a1c7901000000b0039c4252d7f1mr4147422wme.178.1654943759390; 
 Sat, 11 Jun 2022 03:35:59 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b0020c5253d8f7sm2152589wrw.67.2022.06.11.03.35.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 32/49] hw/isa/piix4: QOM'ify PIIX4 PM creation
Date: Sat, 11 Jun 2022 12:32:55 +0200
Message-Id: <20220611103312.67773-33-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

Just like the real hardware, create the PIIX4 ACPI controller as part of
the PIIX4 southbridge. This also mirrors how the IDE and USB functions
are already created.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-7-shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c                | 24 +++++++++++++-----------
 hw/mips/malta.c               |  5 ++++-
 include/hw/southbridge/piix.h |  2 +-
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 96df21a610..d97b245df3 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -49,6 +49,7 @@ struct PIIX4State {
     RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci;
+    PIIX4PMState pm;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
@@ -261,6 +262,13 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* ACPI controller */
+    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
+    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+        return;
+    }
+    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
@@ -271,6 +279,10 @@ static void piix4_init(Object *obj)
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
     object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
+
+    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
+    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
+    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
@@ -312,7 +324,7 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus)
 {
     PCIDevice *pci;
     DeviceState *dev;
@@ -322,15 +334,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
 
-    if (smbus) {
-        pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
-        qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
-        qdev_prop_set_bit(DEVICE(pci), "smm-enabled", 0);
-        pci_realize_and_unref(pci, pci_bus, &error_fatal);
-        qdev_connect_gpio_out(DEVICE(pci), 0,
-                              qdev_get_gpio_in_named(dev, "isa", 9));
-        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
-    }
-
     return dev;
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e446b25ad0..be9f26d841 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1238,6 +1238,7 @@ void mips_malta_init(MachineState *machine)
     int be;
     MaltaState *s;
     DeviceState *dev;
+    DeviceState *pm_dev;
 
     s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
@@ -1399,8 +1400,10 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus, &smbus);
+    dev = piix4_create(pci_bus);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
+    smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index dab5c9704e..2357ce0287 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus);
 
 #endif
-- 
2.36.1


