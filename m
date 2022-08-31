Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F35A8257
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:53:40 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ27-0002mN-D2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvM-0002vV-GS; Wed, 31 Aug 2022 11:46:40 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvK-000393-IS; Wed, 31 Aug 2022 11:46:40 -0400
Received: by mail-ej1-x629.google.com with SMTP id lx1so29183084ejb.12;
 Wed, 31 Aug 2022 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yR1WuULr3CbcvDGW25RvKawDTHX0S07ta2xKevtnT3M=;
 b=f1HsiNNdNUI1IR+8+7CVu4tUZTj0ITjbZyUpQjx/WhzSGAKVyX2Dpx0Gja1iH4cM8z
 b2K+GgPIZ4Zy4phE/MCaRneR9Ox9WkAKg8j+BEoqlLOQ6t0qn30NaTRm2+Js5A1RsjAh
 zVzTBDDBoPO3PCf4bjgydjzUvz/UdrHGDJKvKrs8I6Zj0fE2l7D6KY8EpVoYYjsCz/8m
 Ac16rdKdEqAyFaL0r3R2U9oP5QYWQJYdrYz2OrnBXQI95jKBS7biNtXZIH4HAeYn//L5
 mhRXO0t6b6gvdvY4v8c6JrUdwmldOQs7PivHB7uwitw24hiBPpahm25bMfcLD0RX6ck4
 v10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yR1WuULr3CbcvDGW25RvKawDTHX0S07ta2xKevtnT3M=;
 b=dmgLwty8H/sGBZV0QU+IIsfUivQxPGHUNwN/2P1m7qa1nOOLppBxqDEdRYPOtXEnn2
 NwaCAZriZGyDc2KbhSHr5QpMnQBPL1tnZcLuJOn6aQQ4dSybVH+nkSDTMdyspnxsi6WC
 Ildr3XRDzOmXShXn5l3A7qDo8jFcuRveQmZhmeBiGKTFFhXWrovt1sXb5smXpb16KZC/
 eVIUz8OPcV2Dt0Yace/tIGcZ8HV17u8+9PZnURDNJM6tbhSlRl17GfkBP/erY9HdhRJl
 7vbvBLWFtH7zhdsHEGCkl+QmISElHrr5/T/fcbDWl/bnliIVrPA7VOSZ4GHvLP3L1mJ+
 +3Rg==
X-Gm-Message-State: ACgBeo0gX9nz8rGSNmHAiFgpnxP5vnNfGJee+IxHjQP27KdZAxqPNLaN
 V6uzr2BhTAAf0Px2RuiwDMMxTDehP4s=
X-Google-Smtp-Source: AA6agR7jXBv5XanU1saozJlQzRjmEX1jwbz43QFtRWS4VF5BX+QXHSke21YZfMxO3IjMeoTVP6piuQ==
X-Received: by 2002:a17:907:a07c:b0:73d:dc49:e8e7 with SMTP id
 ia28-20020a170907a07c00b0073ddc49e8e7mr19340262ejc.393.1661960795819; 
 Wed, 31 Aug 2022 08:46:35 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 10/12] hw/isa/vt82c686: Instantiate AC97 and MC97 functions
 in host device
Date: Wed, 31 Aug 2022 17:46:03 +0200
Message-Id: <20220831154605.12773-11-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

The AC97 function's wakeup status is wired to the PM function and both
the AC97 and MC97 interrupt routing is determined by the ISA function.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 16 ++++++++++++++++
 hw/mips/fuloong2e.c |  4 ----
 hw/ppc/pegasos2.c   |  5 -----
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d048607079..91686e9570 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -553,6 +553,8 @@ struct ViaISAState {
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
+    PCIDevice ac97;
+    PCIDevice mc97;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -572,6 +574,8 @@ static void via_isa_init(Object *obj)
     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
     object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
+    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
+    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
 }
 
 static const TypeInfo via_isa_info = {
@@ -652,6 +656,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
         return;
     }
+
+    /* Function 5: AC97 Audio */
+    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
+    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    /* Function 6: MC97 Modem */
+    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
+    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 377108d313..2d8723ab74 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -210,10 +210,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-
-    /* Audio support */
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
 }
 
 /* Network support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index e32944ee2b..09fdb7557f 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -159,7 +159,6 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    /* VT8231 function 0: PCI-to-ISA Bridge */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
     qdev_connect_gpio_out(DEVICE(via), 0,
@@ -173,10 +172,6 @@ static void pegasos2_init(MachineState *machine)
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
 
-    /* VT8231 function 5-6: AC97 Audio & Modem */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
-
     /* other PC hardware */
     pci_vga_init(pci_bus);
 
-- 
2.37.3


