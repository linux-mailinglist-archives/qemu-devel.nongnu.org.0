Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A265A7B07
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:10:45 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKgF-000665-4Q
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXp-0006aB-SD; Wed, 31 Aug 2022 06:02:01 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXn-0002tc-TK; Wed, 31 Aug 2022 06:02:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id p16so24174428ejb.9;
 Wed, 31 Aug 2022 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bEVoRSXcrRzaQgrfpsjgEaEoGMvIu/5y+odrkvqlkLw=;
 b=GN0kVRyVCuN0LTi10YfU6HzT8Xav65WiFstQo/462w7udG9o/m3/nK0YZNut5C3dnH
 3sroWhTiqmycXtNjEyFpO8Rd54gLdqWySs4+Dm40tV+E+0roORd6rQqQ04FLTGcA0qZI
 vlEHp9wd/5BmIhA+Xc+ab1hKQjou9ld3BdvTpjA5We37jr6J7Uc61jffK8kPPADhnr16
 jpLMr+K6puEBhsEUES8yK+VpkmdCOYtx6ndof3vfnni8v6l6vo+jzqoJFa6wbfoO/a61
 hjLu3KRzBRgFnTK4Yylekl6taVVKKeC4gUT8XbwSl2HEbC1RsHVOT0tDThfJLGGigo+l
 G7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bEVoRSXcrRzaQgrfpsjgEaEoGMvIu/5y+odrkvqlkLw=;
 b=CVc9APsdK0Dx0MnDfE6taTqRS9Qj8/hhMq1A0kpURbWmiM6hntxDZ1fbL3ZBvVfv4a
 U423x79w0P6NpZYfw8e+EIcGPic/xOBvOkHEmENqmcoA8xyFJ42he6XcD8NqVNtTG2NI
 6+xiMsPaVNxH4QdpmvXJ2xqY1Wu/NFwRwdOdWTcyZgaTVPtQiy13wgsG2Qh2PeDhykRK
 w1XRQ9dlkzoM7pp5BOTWp3HE0LKLtOOD9F1NMnS2tMvqO6SpFRNpwy/ZIOrQCshlHkPo
 lgBeUPTvC/gaVZnvLuHpX5eAmrRj+3OOFhq+Ti7lLppEjD7g+qCAyX8T1TI89sooqtt4
 5zAw==
X-Gm-Message-State: ACgBeo17zZx8NFl/KrDJFXnb88jUmgKLKXFbTgwHkdAOyuMAPen9PTWJ
 7uRF487wITN0GO6jhceiPBHWTp3+Vfs=
X-Google-Smtp-Source: AA6agR4T0Ikgm3WnkQYfMERKxold48l5aSxRnspqps89pGDKQsaenNNUNFoXxmg0YojAXGG8GBONUw==
X-Received: by 2002:a17:907:7630:b0:73d:d749:975b with SMTP id
 jy16-20020a170907763000b0073dd749975bmr18539444ejc.632.1661940117438; 
 Wed, 31 Aug 2022 03:01:57 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 07/10] hw/isa/vt82c686: Instantiate PM function in host
 device
Date: Wed, 31 Aug 2022 11:59:11 +0200
Message-Id: <20220831095914.2041-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831095914.2041-1-shentey@gmail.com>
References: <20220831095914.2041-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

The PM controller has activity bits which monitor activity of other
built-in devices in the host device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c         | 13 +++++++++++++
 hw/mips/fuloong2e.c       |  2 +-
 hw/ppc/pegasos2.c         |  3 +--
 include/hw/isa/vt82c686.h |  2 --
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 66a4b9c230..fcc9894e8b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -250,6 +250,8 @@ static const ViaPMInitInfo vt82c686b_pm_init_info = {
     .device_id = PCI_DEVICE_ID_VIA_82C686B_PM,
 };
 
+#define TYPE_VT82C686B_PM "vt82c686b-pm"
+
 static const TypeInfo vt82c686b_pm_info = {
     .name          = TYPE_VT82C686B_PM,
     .parent        = TYPE_VIA_PM,
@@ -261,6 +263,8 @@ static const ViaPMInitInfo vt8231_pm_init_info = {
     .device_id = PCI_DEVICE_ID_VIA_8231_PM,
 };
 
+#define TYPE_VT8231_PM "vt8231-pm"
+
 static const TypeInfo vt8231_pm_info = {
     .name          = TYPE_VT8231_PM,
     .parent        = TYPE_VIA_PM,
@@ -548,6 +552,7 @@ struct ViaISAState {
     ViaSuperIOState via_sio;
     PCIIDEState ide;
     UHCIState uhci[2];
+    ViaPMState pm;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -641,6 +646,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
             return;
         }
     }
+
+    /* Function 4: Power Management */
+    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
+    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
@@ -683,6 +694,7 @@ static void vt82c686b_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -746,6 +758,7 @@ static void vt8231_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index dc92223b76..377108d313 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,7 +208,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 85cca6f7a6..e32944ee2b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -168,8 +168,7 @@ static void pegasos2_init(MachineState *machine)
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    /* VT8231 function 4: Power Management Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 56ac141be3..559f7c8926 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -4,9 +4,7 @@
 #include "hw/pci/pci.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
-#define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT8231_ISA "vt8231-isa"
-#define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
-- 
2.37.3


