Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68D536E32
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:30:43 +0200 (CEST)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv294-0008AC-BN
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv208-0003e5-DI; Sat, 28 May 2022 15:21:31 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv206-000239-S5; Sat, 28 May 2022 15:21:28 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso4420966wmn.4; 
 Sat, 28 May 2022 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+kHjN97aKIa/cUh2efk1eaRbhSzFZpiKt2PIyG8hVM=;
 b=ZbbSVy1bieW34xhrOugYFi/4m07NpbAbqnUtuJxq0D4f9tGD5bOoTAIJcyP8zT+RnF
 PecjVrPgsRW75SD1Rch9t60GPaCnE5XVdHVqKqF+v62nL8VlhDwt2t4WEM9WB+rMECRl
 kNbqr7gULMjJCF05zstQLZvM35Do0xIjyrgrrHjYxumL+vrQKyzY/x0Y7uwL8VCGsmT2
 /f0Yh1IRAV2qZeZoWoVO/gdwf4zYFClsZbTyyGdocPEYTssv4bb1z1MB1Rp3Kdi8bV8R
 dcIUcqZal9j6XRe84rPUMUE4gDYgMAfepRFRCSiQC4gNUaBhZG/tLDrxbImgfweKvCws
 TaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+kHjN97aKIa/cUh2efk1eaRbhSzFZpiKt2PIyG8hVM=;
 b=Ttedk3YOGxl05S8ZdRD7sc7SAPQ7X3ajabdh/PcG/fRFfFzsEuSa1c1rsUtC6ahHSy
 PeDxjDqtTTBpRa5yG76eRzd9Q6YT7jJgKIiWxaHqjPE6DkPaRWLe/XKPpsy+b+cOzYhL
 NICbUugmraHHAcj7ZyYYWd/XE/WFxQkzcDnIeLnsG6J4gmEq0KiJA1tNrQU1lIP1KDoP
 tmkRG/Thuouvr85GP/zyQ7pYYwUNf0BmhxvkQOJlr6DUuZBUjqqg6mmctGpUv8MvJVSv
 QLYe2ofkbEitcBjuwc0rUcVcdfj3Pe3hQnhUBC+SXRR96SGuHeNJ3Tkgvhw4xP/v+nDa
 GFSA==
X-Gm-Message-State: AOAM53137th1rD6lNTl4bpGE3bSqla2Ri6EhxJHk3wM0PA2CjBueD+XD
 DV44qz3/DjP/yRxzBuzxWqVZu/XOt1uRi3VWoLk=
X-Google-Smtp-Source: ABdhPJwu400HQLV7SSV0P/KWILeZALCymW7ksiKqGSbfhcc6Et1oSNS/QlPKy9XpcBnClXZF39IGQA==
X-Received: by 2002:a05:600c:a45:b0:346:5e67:cd54 with SMTP id
 c5-20020a05600c0a4500b003465e67cd54mr12341693wmq.127.1653765685066; 
 Sat, 28 May 2022 12:21:25 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:24 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 6/7] hw/isa/piix4: QOM'ify PIIX4 PM creation
Date: Sat, 28 May 2022 21:20:55 +0200
Message-Id: <20220528192057.30910-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
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
 hw/isa/piix4.c                | 25 ++++++++++++++-----------
 hw/mips/malta.c               |  3 ++-
 include/hw/southbridge/piix.h |  2 +-
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 96df21a610..217989227d 100644
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
@@ -261,6 +262,14 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* ACPI controller */
+    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
+    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+        return;
+    }
+    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+    object_property_add_alias(OBJECT(s), "smbus", OBJECT(&s->pm), "i2c");
+
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
@@ -271,6 +280,10 @@ static void piix4_init(Object *obj)
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
     object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
+
+    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
+    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
+    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
@@ -312,7 +325,7 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus)
 {
     PCIDevice *pci;
     DeviceState *dev;
@@ -322,15 +335,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
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
index e446b25ad0..b0fc84ccbb 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1399,8 +1399,9 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus, &smbus);
+    dev = piix4_create(pci_bus);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "smbus"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0a2ef0c7b6..e1f5d6d5c8 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus);
 
 #endif
-- 
2.36.1


