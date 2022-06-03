Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7A53D1F2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:57:11 +0200 (CEST)
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCTu-0007BT-Jd
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO8-00078n-IO
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO6-00049m-6i
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:12 -0400
Received: by mail-ed1-x530.google.com with SMTP id w27so11283363edl.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+b0Zu1GpfMHDnb2ysjGbnPDUKZFXcnMEMYykhWD4rs=;
 b=Ei93CIWqMJLoRBjXg5cXJZTCH7jUkaOANSpvzFw/7ySPTy1vFiTApeRjfpmK8HZ3XH
 TVW1By4KZERnZ5G7AVCW569s+p/VSVrP435QZzMA93nijzc8jviItX4ZRdZdHDOttQzM
 EVbaiLiG0DNXN746UQyUXQH6SpphiHmiQ0+aPDPUTSf4Kr0T2Kja4Pop66WxiDFRxt4j
 1w2OMJQMGdhaM1/ktW6FB1MBkVvFvb8cbdkNhkaD4P+Cgiv+jWRKQzDPFMRHdsog+p2B
 86anmce/J4t3Yh9DtpwQ1DQN3LeeDePPaqDFL/HuIPffQmGjKiAT0A+ROpychgri8QgL
 5eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+b0Zu1GpfMHDnb2ysjGbnPDUKZFXcnMEMYykhWD4rs=;
 b=3CPoBVVKo7qIzdzWn3THmFp3Q43yE1RQCMw0Ak0FINf40Gx5/qgMOs93jieX+qmq/2
 qZkEQ5eBBZB2+ImJoueI3AZvND0QfUGVfNH9W7LozyHV0dGpSXj9BIrHTbzOGtTaR8pF
 AOdx9UgmJt+nJloJrjluL+GmLnsvrcL1BwUxoer5h7QvvTWjfvKZeCzTNtgCjeBMsnDz
 jwM448w74EP3ZRxI+X4Rcp/Rd142bDzv8UE4kduqMnJ8RhePW/S11rgFmW4ElS5Gmixj
 3UMFWXHiDAx/DSGKF0k/LQuSkIujEsPvR2NpEC3amx3RbDaoZndWmUcuIIxprvKD84UA
 pQBA==
X-Gm-Message-State: AOAM533aTS54lT2k+yed1c2Qry6WpuPoVbNUR3bL0nV45p1TnoRINkzo
 NUkOPXNoMbk799QOZhvi9URKuaCdG2FBaQ==
X-Google-Smtp-Source: ABdhPJwzis9RPDPNTemaStprXTug8QsHp2LQ9HX0JH9DCbJzco7bXmkVV13BvX5os9FGDlkKLzkmgQ==
X-Received: by 2002:a05:6402:254e:b0:42b:4633:e53e with SMTP id
 l14-20020a056402254e00b0042b4633e53emr12485663edb.314.1654282268634; 
 Fri, 03 Jun 2022 11:51:08 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 06/11] hw/isa/piix4: QOM'ify PIIX4 PM creation
Date: Fri,  3 Jun 2022 20:50:40 +0200
Message-Id: <20220603185045.143789-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

Just like the real hardware, create the PIIX4 ACPI controller as part of
the PIIX4 southbridge. This also mirrors how the IDE and USB functions
are already created.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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


