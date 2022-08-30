Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3040C5A6CF7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:17:41 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6k0-0002QF-84
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UB-00036L-CZ; Tue, 30 Aug 2022 15:01:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U9-0008RW-BU; Tue, 30 Aug 2022 15:01:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id k9so15486519wri.0;
 Tue, 30 Aug 2022 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Z7zkiUKq4zn6nt4eEGe3a2HvPXZSJU1RDsgycY8W8fE=;
 b=VbiJ2agfFdlqk235n68okjVPn9uhb/46iJoJvwPULAaTLPukM/4DXrJKK7nAkhoSov
 1CfwrDEE9zVJKKFFacRMuFzaEG+KzHaC4yOlhXzE0xlnLlkal0x7xuEyaaGSITt3i6mW
 IyRn6Ujjb4Ry95JFUA3mmNn3d9I9P7Qqvq75FIRlZvo5/cgFloE8Ir4miS1lrvvzQH2O
 BkS1nRFfDS86TtkOxMiMyX+v7ImzaWUxepUmFk/QohjWZZJiUvs3z4F46hbV9yZi3a6s
 xQaCKdKm53l5JdL13ZVFTsnJDnn3qDGl7tefknJfi8i8gXg8NIZAqvocS/GxdNbQwxn2
 cxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Z7zkiUKq4zn6nt4eEGe3a2HvPXZSJU1RDsgycY8W8fE=;
 b=n2RJWv/rxm10/fG0uT8zYjUCYQTc5q5VnHvn7FLI9GAwN6TwL/rReaEvJ58GKxZVZL
 3o5esa8QQi3U45AAmooIO07Hb3saWOq6X41E6hXCR3cZKCQD2slv1DO0wF44HBRr/7S2
 i5mNjvo0srkOTo241oXA29eNt9qEv1cEcyTR83v0r+r74zcPpu/9WdtlF6iT7wgJRewb
 CovxGUeAMdjR2o/34ovM0jY9PESepfZUAwOdWKElzzr/0V66nKyVD6y5QqA5iZ0+yYyq
 pPu46eqC0wSu6RpJDUP1Gn+/Fq6kceH/lwZyb4b2x/UZk+koQLNmlFoY6fQE9m8+rdD1
 2+iQ==
X-Gm-Message-State: ACgBeo0+dt3GZlin64VR+Psx0CY7+qVe4DcE05r/pKr7NLx6fSMgD9YU
 +1Cqd+ACw5KGUJvoNx3qc93Gt+EFyF4=
X-Google-Smtp-Source: AA6agR7tYA+9GYqwCxCyeOjWxbMc5INIAg21s2b57MVsXCsfqh6q55YqtXD/ligz7vyH8lOOgIkoJg==
X-Received: by 2002:a5d:64ab:0:b0:226:d997:ad5c with SMTP id
 m11-20020a5d64ab000000b00226d997ad5cmr6675450wrp.602.1661886075342; 
 Tue, 30 Aug 2022 12:01:15 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/10] hw/isa/vt82c686: Instantiate USB functions in host
 device
Date: Tue, 30 Aug 2022 21:00:44 +0200
Message-Id: <20220830190048.67448-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x435.google.com
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

The USB functions can be enabled/disabled through the ISA function. Also
its interrupt routing can be influenced there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 12 ++++++++++++
 hw/mips/fuloong2e.c |  3 ---
 hw/ppc/pegasos2.c   |  4 ----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9d946cea54..6aba7f29de 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -23,6 +23,7 @@
 #include "hw/intc/i8259.h"
 #include "hw/irq.h"
 #include "hw/dma/i8257.h"
+#include "hw/usb/hcd-uhci.h"
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "migration/vmstate.h"
@@ -546,6 +547,7 @@ struct ViaISAState {
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
     PCIIDEState ide;
+    UHCIState uhci[2];
 };
 
 static const VMStateDescription vmstate_via = {
@@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
+    object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
+    object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
 }
 
 static const TypeInfo via_isa_info = {
@@ -629,6 +633,14 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
         return;
     }
+
+    /* Functions 2-3: USB Ports */
+    for (i = 0; i < ARRAY_SIZE(s->uhci); ++i) {
+        qdev_prop_set_int32(DEVICE(&s->uhci[i]), "addr", d->devfn + 2 + i);
+        if (!qdev_realize(DEVICE(&s->uhci[i]), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 32605901e7..dc92223b76 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,9 +208,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
-
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 8bc528a560..85cca6f7a6 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -168,10 +168,6 @@ static void pegasos2_init(MachineState *machine)
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    /* VT8231 function 2-3: USB Ports */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
-
     /* VT8231 function 4: Power Management Controller */
     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-- 
2.37.2


