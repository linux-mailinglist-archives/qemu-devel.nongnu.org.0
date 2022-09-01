Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52F5A9650
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:07:08 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTiyQ-0000Rv-JL
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaS-0005h4-3r; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaI-0000F9-DO; Thu, 01 Sep 2022 07:42:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id z2so22204424edc.1;
 Thu, 01 Sep 2022 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Jlk6oFJAY+l1qPvv1++yQk3ViQamm2gz/v6Qx4/s2dE=;
 b=C9KrqMOHd6yQ/681FA4yf7A6WJ5fPS00SASNlBIlXCEQAKWhbxMYq1BNsQ26J3CrPJ
 DtS48RZhZriQyFopZrpGqp2a8rNZPmQn3AMo+ZxJ4CLE9MEX34LQy4VoybTM1zOCV6AY
 6xpc4bXr8XbqDYzMag/y1ixUGTLbjquOP4+1vj0hLSn2SBvYmWm/63QRl8Peq5Af/Mh0
 iziFoX8yCj7/SFSttboKhftlFM/NfZCCBMsICkb4ZRoCymegAlgwZpRBLPUoFn6X9dKL
 f7LAW94ab988drCjIUmkRDq+t6WexD/RRemhCZd6d8KC124aGEDr72SapbZPYIEdzN8m
 s/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Jlk6oFJAY+l1qPvv1++yQk3ViQamm2gz/v6Qx4/s2dE=;
 b=7qcc7topd2UmlmnQ56MTgkMSY4/BjbhwIDEOSdcd1RBKaFADM/ohqgaY0CSIsVW8ar
 0diDsaMKwSmFq8Au1wtckz0BZ3C6ga8lK76IYrFOG+JWXdbswQk1kBebZN9hpackAamp
 ZcJyvG5FGRQ3tJ1M+VYnFlwgqACCmIFRMUrRnHoTHUN6G8B/vVL418mNXk8th7aJieb8
 SVcrNUHhuU08v3m7LtJEMA2sH2u5Pv6snVmoNRn2i88QOBFmw3azeslqiC3PlB+1/Nmg
 59tyH5d0m4WBM6PFnc13aTtkPmVOurmdl5NLApUvPVfsZVeVJHuL+ALa4tkg2nomjTGh
 pclQ==
X-Gm-Message-State: ACgBeo3TxPNRm7bCPcWaIx+a9qiqb6KPWckDULmCXUsQcMufU3BVxVy8
 dC3mmkv9jmRAX7BVu2A+pTTxbgKjCIA=
X-Google-Smtp-Source: AA6agR7n7h1daxfK+MPXF28eoK2fdqRhgdN76Q+PMCis9t3wsLAl+Yr7VoUtdhm6/+O3l714KOq3ig==
X-Received: by 2002:aa7:d58b:0:b0:448:e63d:ee5e with SMTP id
 r11-20020aa7d58b000000b00448e63dee5emr8738976edq.236.1662032526210; 
 Thu, 01 Sep 2022 04:42:06 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 09/13] hw/isa/vt82c686: Instantiate PM function in host
 device
Date: Thu,  1 Sep 2022 13:41:23 +0200
Message-Id: <20220901114127.53914-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
index f05fd9948a..d048607079 100644
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
index e6f6dd4d43..eaa07881c5 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -4,10 +4,8 @@
 #include "hw/pci/pci.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
-#define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
 #define TYPE_VT8231_ISA "vt8231-isa"
-#define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
-- 
2.37.3


