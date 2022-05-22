Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC953063C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:32:59 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstC6-0004KA-6i
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4k-00032q-Ka; Sun, 22 May 2022 17:25:24 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4U-0005dK-1z; Sun, 22 May 2022 17:25:21 -0400
Received: by mail-ed1-x52a.google.com with SMTP id eg11so16842432edb.11;
 Sun, 22 May 2022 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/72aLvR3YUDPem/swAZcwIGjqfrTDwKyUaOlo6kdIs=;
 b=Zs8O6bxX+Y8z8VqfPo8TQYzHjnE1RHT7v1EmeI3yiPJaZhQ3XytSB5s8zmWStr1kPS
 S7bBz0PCRqDUlqhmncUxE2QPNNTPMuFG5J3dr4wpmoa2nF60Zz8zQHccqTN4xvPw7m5T
 THjKmd2umxs1Ny9egUkaZgwuavekA3wibZ/lIBkFZf1RlGjb6qbtRPRJRig7mOmp3PaN
 dNQIUfSca8Uo5cxHi4+Wwee42CpXpQoU4y9fNb8NDlfLSFX7HyFYEkraM1Z9GgS9EedS
 9g2GdR63N1yT28tQYc2alJDHEROyI6MmfzegTQoTnTCu5nEMG9AkzMt1cjLEeJJNXWgW
 Bz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/72aLvR3YUDPem/swAZcwIGjqfrTDwKyUaOlo6kdIs=;
 b=AFNdqdBUZ+TMYmdvb/TB4cIibnosbkY+yK+AopvB339oAgq4WmS6+32OdxNS9Fko7G
 SpoACKF6r/ZD5WOwINjdpPyR++IKU/5+GEWPVbI49JdGIjVFPHGwbalJqxcq1DjzviTD
 TH8ZLV60hTi8H3tlq6rNGULJds6pOWNr4CmicSqaD5B5xQJkTmOngHjZ9deeTlKP9nm4
 ZeRPiOlUR9V+0nOb8eMhh9Df00gMGPOWZT/QnOZH6HaCkAzsoY7lSunVxbuuEsWGsOFs
 JmpS2WgmKZaiKXhROiyyV1garhIIEFzWViAWmgU2jCkcM2NMPwtOPMYjcro8gGyYALuL
 O+vQ==
X-Gm-Message-State: AOAM530dVagIjBrc/XAEkOdlOrUiZBpDMDzANp1R0BZ7NjdYihQlWKEN
 Q8s43Z6c3ZUMWGt1rjsAePDnQxDBaQA=
X-Google-Smtp-Source: ABdhPJyhrtCU1BFAmukCIYvNW8M72Gct1rp9dVIlHIRhW3CE+SYFAItkKLB6Rypokg6YU7FS/2FAlg==
X-Received: by 2002:a05:6402:908:b0:428:11f5:509d with SMTP id
 g8-20020a056402090800b0042811f5509dmr21228065edz.253.1653254704288; 
 Sun, 22 May 2022 14:25:04 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:25:04 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 5/6] hw/isa/piix4: QOM'ify PIIX4 PM creation
Date: Sun, 22 May 2022 23:24:30 +0200
Message-Id: <20220522212431.14598-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 hw/isa/piix4.c                | 14 +++++++-------
 hw/mips/malta.c               |  3 ++-
 include/hw/southbridge/piix.h |  2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 4968c69da9..1645f63450 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -206,6 +206,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     PCIDevice *pci;
     PCIBus *pci_bus = pci_get_bus(dev);
+    I2CBus *smbus;
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
 
@@ -252,6 +253,11 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* USB */
     pci_create_simple(pci_bus, dev->devfn + 2, "piix4-usb-uhci");
 
+    /* ACPI controller */
+    smbus = piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100, s->isa[9],
+                          NULL, 0, NULL);
+    object_property_add_const_link(OBJECT(s), "smbus", OBJECT(smbus));
+
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
@@ -301,7 +307,7 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus)
 {
     PCIDevice *pci;
     DeviceState *dev;
@@ -311,11 +317,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
 
-    if (smbus) {
-        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                               qdev_get_gpio_in_named(dev, "isa", 9),
-                               NULL, 0, NULL);
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
index 0bec7f8ca3..2c21359efa 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -76,6 +76,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus);
 
 #endif
-- 
2.36.1


