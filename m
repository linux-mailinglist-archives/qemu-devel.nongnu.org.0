Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC65A6D84
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:41:40 +0200 (CEST)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT77D-0007Yl-Ou
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U7-0002zO-Tj; Tue, 30 Aug 2022 15:01:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U5-0008Pm-40; Tue, 30 Aug 2022 15:01:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id c7so8782076wrp.11;
 Tue, 30 Aug 2022 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I6X3vE/Uc+qT5j8hdi0r3ATIc1MxCB7p/1oogRD6oQc=;
 b=d1idZiiO6JRXKJMWClh0UTH9/yyRd/YSKVTkugPmJXbFs5aqGd7QXjCat4b/WtdayH
 wcuK7clRj2flNe50gcGY02zRyhn7JBUOMR9hVkhy1vOWBjGcSrimMbL5Lb7BDvggnrFN
 7N5L6EFttsh7/u4Kjn0Y/PHeRtB78zxk+kcbwMs5g5baDBMlVvfd1M4TxzJbhFTzAY1r
 aDwqmd2G0D8fLyTkNigd97E5Yzny6GLswm+Z/gVN2jRYE6l9fOmriVxcs/lcIHMw7tr2
 gP6uawySfKzVCwPBbO4B7Ssiqc3RpWZT8micDHXCkXmgOlN6NsudMAniyqL6wR2oJc9A
 s3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I6X3vE/Uc+qT5j8hdi0r3ATIc1MxCB7p/1oogRD6oQc=;
 b=qcDeND9tt02nMWr72oWfrZOVyGbHcDKfs/HgBvslZvjjxg1yYUP7UMlBRnv05/v6ol
 ma65XBHkcKfHNg6OrK1VJ5aKlJ5WWCUxLRlBrpxxbLcIE0EhNwb4FRAhq6Rh82XMqL/A
 QyF3G1Zm1NemCe+OTd+JgRFa1NOtVw8RbFYzW+6xquVl6cX0bfYpvHqyIks92cY2e+c/
 Y7Cbr3RE/5giRP4ZE0vLRylrqqL1PWeWu0+QZhGelQ8WYUMapTiHKbgZ59Q4CchxvW6S
 nkHyCmhXqEUgoJuQIC4k9acIVfjgzHqEbt3VzNiXzWhT/CsvZ24No2G2Wbr7W7Slz8NW
 L04Q==
X-Gm-Message-State: ACgBeo3azNzNuGn/DjWakRLnvtyYIW7qGJ+EuJ70AOK7Yb7gFZ0ApRBN
 TGylEnIueFbdZZJOiy21MjTXHhWR5QA=
X-Google-Smtp-Source: AA6agR4LXe7AVFSTlnIpp2i08+FKN3ei/WQ84MV9Hg+WGXOTk8ajC/eBUWnsRbj6gHQVbuCf1CoD7Q==
X-Received: by 2002:adf:d23b:0:b0:226:d4e4:4a6 with SMTP id
 k27-20020adfd23b000000b00226d4e404a6mr8216655wrh.246.1661886067918; 
 Tue, 30 Aug 2022 12:01:07 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 01/10] hw/isa/vt82c686: Resolve chip-specific realize
 methods
Date: Tue, 30 Aug 2022 21:00:39 +0200
Message-Id: <20220830190048.67448-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
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
2.37.2


