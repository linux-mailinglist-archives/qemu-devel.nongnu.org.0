Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407725A6DB5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:46:19 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT7Bi-0002zM-Ay
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UI-0003A8-1G; Tue, 30 Aug 2022 15:01:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UD-0008SF-1c; Tue, 30 Aug 2022 15:01:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso6703277wmb.2; 
 Tue, 30 Aug 2022 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0EO7KtOsw0C06qyl69zDnh5KxcY3cif0atwpxtZ2XmY=;
 b=Vq0HKZQaGEPyjJd+dFzbIufxthuiJCBqC0RnPPa09X1ahcQO59MlqgqLZw4CjgOCNq
 uD3IQG+vMF45iU7/VwMRWfxKsLAhIRTAWSCY4fcsefm+ZD+u7wV8B9J+/zVJ+vnbWVR8
 tN+qmW/yDsfTdTjW2d2J80bAVJESzQbuKABLP5YevEscDYD1/neahPsW7/ndyxh3jgX/
 Odd5oEZg1+3dOMU1vwoBioECDEqKhQ4XT9p9ueY6H4BCMpbeF9wyttjTtD2hcTaKPOwJ
 L0MQDdlPLMLn/FDulhbgSq9iM9s+fYnoegxTwtPLGOfVkgMjYxymx6Rc3bf9MvRYsjNE
 UA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0EO7KtOsw0C06qyl69zDnh5KxcY3cif0atwpxtZ2XmY=;
 b=VlYcKGliLkKrKbYGjdgIN5JjRww0W6NQhgwvJzH7q84YsCQ2x/LRRaM1FeHtlRGs9C
 +nXdbNQhkMK8mWCI+ZqCaBO8SWDPNEmMoHQJrfEtP0pdvgsCG1aeD4OWyOMIP3PYeGdf
 nJ+6Dw65P4lKMjNDWdZnQdt1+IEXmOtEqIhPRNjh0XzFQo/Ymc1DPQaWVOxJOwxEJuqM
 r6rEJXNeIMA2WM1E53LuldO3BWSoM8ZqvohSpg6b5yVV4oap+3meygYPSzPAuCdKK54h
 XLFc5eBN38S4EpXyA0IHAk5qVeXafwVRyIvAybNnoiJpZrrMIPfVMANYjKsHcwMYMdw2
 3BUA==
X-Gm-Message-State: ACgBeo2MibIVwxmqwTquemQRbE2xcwRRINOAoLak89dP+h1uimWQGv5i
 g0Jnt6Dg4bXtG1ym2+7G7mqd4XDMWiI=
X-Google-Smtp-Source: AA6agR5lkJxAX5cb5bsQH3tmWVQa7jY04c44xoN6fUP7xLvS7vS+kPRSviDs5GZlE1ZTHk6JbRS79A==
X-Received: by 2002:a05:600c:4fd4:b0:3a6:2694:e3bc with SMTP id
 o20-20020a05600c4fd400b003a62694e3bcmr10257134wmq.60.1661886078765; 
 Tue, 30 Aug 2022 12:01:18 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 08/10] hw/isa/vt82c686: Instantiate AC97 and MC97 functions
 in host device
Date: Tue, 30 Aug 2022 21:00:46 +0200
Message-Id: <20220830190048.67448-9-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32e.google.com
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
index 4e66570655..150e9401d0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -552,6 +552,8 @@ struct ViaISAState {
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
+    PCIDevice ac97;
+    PCIDevice mc97;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -571,6 +573,8 @@ static void via_isa_init(Object *obj)
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
+    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
+    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
 }
 
 static const TypeInfo via_isa_info = {
@@ -651,6 +655,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
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
+    /* Function 6: AC97 Modem */
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
2.37.2


