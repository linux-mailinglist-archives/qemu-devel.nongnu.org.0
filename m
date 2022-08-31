Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8A5A7AFC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:08:58 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKeX-00026m-LH
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXo-0006XX-Gm; Wed, 31 Aug 2022 06:02:00 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXm-0002tN-KE; Wed, 31 Aug 2022 06:02:00 -0400
Received: by mail-ej1-x62b.google.com with SMTP id y3so27338856ejc.1;
 Wed, 31 Aug 2022 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZobStzvhLV97I9yjmb/DEDWKSejQvQwkxE0N4+qr6YM=;
 b=GtBpoF5Cz7z/SCfrrHXukPka+mqyAcrq/bxZmxv/HVOrfrJSSn5zN8jzFG/VfPRTGF
 KB5HUdIhPZMgTfygrryGqg7wP7KLAHDJi1s7meHtqw195PzjqbIxgRugNsEtvIBOobZ3
 4pIqzDqAzypT6pW0TLT1EHqlHuj5a4H4e2ngRl9Ju7P8Oz1u/vrHDNpgNsU8wXrlq6FV
 IIypvmaDcuV93A7bJUJZo0JJTuoXuqxDQKqQhCGNry6fFAZIiUx/8tEUD5tqQWGW5GFH
 CJuBe8Vux7ZuzH4HbS3BPx0TOrjDiDGXyCsTC5xvGZdqz29i5mS1SJkTxMSO4Q2KZSMz
 3zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZobStzvhLV97I9yjmb/DEDWKSejQvQwkxE0N4+qr6YM=;
 b=I86w10VJNkcfOjenBn2ANXVmTggmqKTfpqG6W+YR62uiUkIl7qFqCNfFIPAH/m1tPn
 PliKTFmFhXsnk7QtFWAL0OzMakpjhEaeS28TnF4ztWE/OJ1EaeQ1DK2ObZnlpb1y2toZ
 eVRkA5Psg/CqsL1Zb3Zr/4C+17lfXz8qFiBvooVh36+NWE4/4A0la3gHXJu6mKmJVzZH
 Nodp9LEm9t1phRQYMVRIY/dVJT8PK4QGH2TJmPY6GXQmIDTa8/jIsqR953ngC5tA8hxW
 TJUH2EkF6l8kGrUoY/D+Rw/oKgod/F7VNZj+elkBYuLgXT4Y3w/BAd3LAIyIb23mp9kX
 9Rpg==
X-Gm-Message-State: ACgBeo1E/sgjFPzTXBedGbdjzt8GSINma7F9dEQjPG1liK33X7xhfSvZ
 J2oVAXLvJCEiUE+xukdBK7X5kCC7ljY=
X-Google-Smtp-Source: AA6agR7y0XLEQyhAFKc/kYJSHioIfgRhGRifKLtsgEEoeip1Vy18veXvi+/7L87D3lV1Imvy915YFQ==
X-Received: by 2002:a17:907:2c44:b0:741:5173:8082 with SMTP id
 hf4-20020a1709072c4400b0074151738082mr12142591ejc.428.1661940116762; 
 Wed, 31 Aug 2022 03:01:56 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 06/10] hw/isa/vt82c686: Instantiate USB functions in host
 device
Date: Wed, 31 Aug 2022 11:59:10 +0200
Message-Id: <20220831095914.2041-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831095914.2041-1-shentey@gmail.com>
References: <20220831095914.2041-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
index 9d946cea54..66a4b9c230 100644
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
+    for (i = 0; i < ARRAY_SIZE(s->uhci); i++) {
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
2.37.3


