Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483D85A960D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:51:52 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTijf-0004QY-25
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaR-0005h2-AJ; Thu, 01 Sep 2022 07:42:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaD-0000Dt-QV; Thu, 01 Sep 2022 07:42:19 -0400
Received: by mail-ed1-x534.google.com with SMTP id z2so22203971edc.1;
 Thu, 01 Sep 2022 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I6LPJZUvTPv4BSyUK+1MUo2I6TDAef6EvKzOqmCgYAk=;
 b=k1dcvUjSiHBgrh+9Gi/sXzINSXP7R+65kpukBoLD4wJnjKOVbZW7kx9v8DkhxT2KVo
 Iu2tOIvO02ALbPKfP2hxMsXnGo4NWHhSGej1JQ34CHZx3sHCnfrop5vP9ude7NEKobmW
 r7lQqL+uzccCC2Bnp4w9O+usvaHDoF4k31eL17iSG7mfnmwZxpnJLkAw8tPWeh/S6Xk4
 8ZJMRr7qiwQhxvF8rfaxvGsVCDvLgCjgREkVRAO8052cOITSzcL08YIDEXeUlhWeCKm1
 2h/gaDmagcEPxx3s1XRgjFuL95tqifR63Sa0XoYsQ4B8hB8DM7jrlbYg1YrTjeOG//9E
 yGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I6LPJZUvTPv4BSyUK+1MUo2I6TDAef6EvKzOqmCgYAk=;
 b=4VUj452KE37NsWWinhtlez70UYCmOsmR24gMWJLgHZZuLsM6AVTwscM5xXbMUaoN6a
 RNWwkux72EVfjo0pUpPB40M5tLRGN6/5OCxnDIslm/Zo3/A+TArYs6SwKrb+zDc47zCT
 fWLyeBfHNmm1f/7mz/JI3O/+AQ8fuyYMPhC9YcPaG8T9zpyfIz7ou6QwQC37Pz1uhoAy
 96qBx018manxrNHytf4HviMrxMtrz5fNTeT3xr5RyHoqQJE4p9+OmInJmI1xiBa/7+Sp
 7+PGYXEkbQ7N1iu+Lfr7xm/swiwGu1+m94Kb+fXIJ7W5YlEDfcROtu2dAr7mZrY8axWZ
 1sSA==
X-Gm-Message-State: ACgBeo0vZKTyYoJhTOzy5uP55roBqsgAsjpb19PK07zz8MFJ3n9sCqpm
 DKZL6jUg8XO7TvG0G2WVp3bSeWGxcv0=
X-Google-Smtp-Source: AA6agR7K7azTKPj0L6UeU4QtgKkM8jrNDEiA8dG4r+1k5EeNQ5+gTvNRQrTyZODgXgb+R8IgqOYCgA==
X-Received: by 2002:aa7:d612:0:b0:447:7ac7:e686 with SMTP id
 c18-20020aa7d612000000b004477ac7e686mr28757945edr.145.1662032518228; 
 Thu, 01 Sep 2022 04:41:58 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:41:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 01/13] hw/isa/vt82c686: Resolve chip-specific realize
 methods
Date: Thu,  1 Sep 2022 13:41:15 +0200
Message-Id: <20220901114127.53914-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

The object creation now happens in chip-specific init methods which
allows the realize methods to be consolidated into one method. Shifting
the logic into the init methods has the addidional advantage that the
parent object's init methods are called implicitly - like constructors
in object-oriented languages.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 8f656251b8..0217c98fe4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -544,7 +544,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ISABus *isa_bus;
-    ViaSuperIOState *via_sio;
+    ViaSuperIOState via_sio;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
             d->wmask[i] = 0;
         }
     }
+
+    /* Super I/O */
+    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
@@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x85) {
         /* BIT(1): enable or disable superio config io ports */
-        via_superio_io_enable(s->via_sio, val & BIT(1));
+        via_superio_io_enable(&s->via_sio, val & BIT(1));
     }
 }
 
@@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 }
 
-static void vt82c686b_realize(PCIDevice *d, Error **errp)
+static void vt82c686b_init(Object *obj)
 {
-    ViaISAState *s = VIA_ISA(d);
+    ViaISAState *s = VIA_ISA(obj);
 
-    via_isa_realize(d, errp);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
-                                               TYPE_VT82C686B_SUPERIO));
+    object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->realize = vt82c686b_realize;
+    k->realize = via_isa_realize;
     k->config_write = vt82c686b_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
@@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info = {
     .name          = TYPE_VT82C686B_ISA,
     .parent        = TYPE_VIA_ISA,
     .instance_size = sizeof(ViaISAState),
+    .instance_init = vt82c686b_init,
     .class_init    = vt82c686b_class_init,
 };
 
@@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice *d, uint32_t addr,
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x50) {
         /* BIT(2): enable or disable superio config io ports */
-        via_superio_io_enable(s->via_sio, val & BIT(2));
+        via_superio_io_enable(&s->via_sio, val & BIT(2));
     }
 }
 
@@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState *dev)
     pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
 }
 
-static void vt8231_realize(PCIDevice *d, Error **errp)
+static void vt8231_init(Object *obj)
 {
-    ViaISAState *s = VIA_ISA(d);
+    ViaISAState *s = VIA_ISA(obj);
 
-    via_isa_realize(d, errp);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
-                                               TYPE_VT8231_SUPERIO));
+    object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
@@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->realize = vt8231_realize;
+    k->realize = via_isa_realize;
     k->config_write = vt8231_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
@@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info = {
     .name          = TYPE_VT8231_ISA,
     .parent        = TYPE_VIA_ISA,
     .instance_size = sizeof(ViaISAState),
+    .instance_init = vt8231_init,
     .class_init    = vt8231_class_init,
 };
 
-- 
2.37.3


