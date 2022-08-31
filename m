Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA25A7B1A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:11:59 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKhS-0007IC-Lg
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXu-0006ho-Qz; Wed, 31 Aug 2022 06:02:08 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXo-0002uk-An; Wed, 31 Aug 2022 06:02:06 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kk26so27268644ejc.11;
 Wed, 31 Aug 2022 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Pf0QjczUiEZOR1B24+CfCkAPEvD+NiZS4nVxeZEgpts=;
 b=nIkMqGr5HWp8misygPgJyPSCKQRgztcYRXYcjhkcHDWhFNGgShCb+yTBDrFtdW/gtg
 aTM10qOounpdtK7umNvG6yNzmw0zAI6hsa+tF3eB4FEuJ6k8kLs5JeIds6YB3l+yS0c4
 mACzXKVxFO9Zed7Es84flG4x2xO1JdRSpGME3t/tufNmjcSV21v7BGOa0u+Arj8aRMGR
 rj6NDdNrZc+uTQrO7iGgwyJYGLdvwB6g3dcwJwM+L8MAOu/lhAhthPlgfA1brari5x9u
 juHGfot6JWTPaxVoqsaKvP5jLlp9/cIQspofPXcLUwpSRWpvgvPkXSZi6ljfuODVSVHM
 BM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Pf0QjczUiEZOR1B24+CfCkAPEvD+NiZS4nVxeZEgpts=;
 b=gSfR038LYV4RHrhw+Upnhk2xnT9g+cnZuxopDzY8lUf9K5PwlNyrDB1Ni/NDnvazwr
 zjWoAIkm/ehDL9q/Bg3bfI4wYvCocAr6a6gm4chUUfKMfHQwKVy9Sa4kqcTSQvIXbQOz
 2SSSOIBNcRynj0tl7MKxwyBO5kz+i9QvaYbkSamxqt3n+cl8AHZhY42gUVPxrE7N23Rj
 uT95/nldxSe3NNBEtWyQmBZmb/dgShLv87Y+sxwox0/SOMmOPWUBxkzRFW/QhN/oHd8o
 vQiC9KDq4UNAA2NNBEWaeduj0CSUDl5rhx3m22GwmeKispIdmkOK0C4JAYmfYbFX78FP
 Jh4A==
X-Gm-Message-State: ACgBeo1bUvQeOYP7ysdxvMeb4+3+WwoZ3tRoI0uVTXLiOQ/pGahQpBuK
 IS0N8GmRS9NxB0HuMYAQxDAhZDSFRY4=
X-Google-Smtp-Source: AA6agR5E8nhndwHQCLvnp7iUhidomKVUE1hdY75o0yuCWTHEsO0RJG4JqCpimKXTCXRYnsKXyW94SQ==
X-Received: by 2002:a17:907:3fa2:b0:73d:79b4:2c9c with SMTP id
 hr34-20020a1709073fa200b0073d79b42c9cmr12581044ejc.644.1661940118287; 
 Wed, 31 Aug 2022 03:01:58 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 08/10] hw/isa/vt82c686: Instantiate AC97 and MC97 functions
 in host device
Date: Wed, 31 Aug 2022 11:59:12 +0200
Message-Id: <20220831095914.2041-9-shentey@gmail.com>
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

The AC97 function's wakeup status is wired to the PM function and both
the AC97 and MC97 interrupt routing is determined by the ISA function.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 16 ++++++++++++++++
 hw/mips/fuloong2e.c |  4 ----
 hw/ppc/pegasos2.c   |  5 -----
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index fcc9894e8b..691a467b2c 100644
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
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
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
2.37.3


