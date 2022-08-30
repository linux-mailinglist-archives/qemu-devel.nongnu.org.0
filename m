Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F35A6D3F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:24:23 +0200 (CEST)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6qU-00074c-2Y
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UC-00038T-BL; Tue, 30 Aug 2022 15:01:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6UA-0008Q4-CQ; Tue, 30 Aug 2022 15:01:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so6688857wmb.4; 
 Tue, 30 Aug 2022 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0tHl4cxkn8o0GZy8/Ma1WXNR3cPMru32DFXp05W5Ldo=;
 b=RMYkKum2pEd9/paFlev2ASfyfBd3+VLWTw9fFFPfN7o1zFmKy3FwZRSnEe5ngo4BQN
 Vo6wv2PVRuaf0ENojSlxGnczLaBVUkoF1NZC01pICr2jYxAsIh2DYpuTk89+OaogJRE3
 Nlct5JL1icQSolV5I3Fx1ASFVlR1Rh4cmgh9DLJTwT6vwO/M4FwWTryCvXIlyuVn6O2P
 nUGILAIUnfm/WBoa8v7qhnCKmjxa+7NgS+rYImnisN0k5WHeBtDQ8791s60C28XyEP6r
 ooNyCZ+7lDtnKXg+AqnRmNn4lagzuQJe7s1ExfD8/yIraY5tl2nxb/KJoerNzOmxwJdI
 sg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0tHl4cxkn8o0GZy8/Ma1WXNR3cPMru32DFXp05W5Ldo=;
 b=TyGuK2L0Zs4GodVQ/Gwb/Lr/DJB84dMbC6GeBwXjWDJIiwEJWThk1lwQ0TAwrEibQZ
 vGKDxBFo+izu5b/RWT0/YFNJgl/t0Zs8qJJe53UC673X6ntBBtaz1hmckncdOJ7WayL6
 yuwXmr44d8m1mJ19myoLPRPJRbkReTIFF0mLgq9wUR6Wz42/+ct2RDtme/e8hJeFS9+m
 Izr0rjJCMGYBt50rRHg8AtNDmnBFRaPBg8XSf9jDE7ADMEnveNAVPsSWXPEBYaPWS/HX
 PL4lWqt+vR1XqMDk8OawNY5vJCsMneK+2xA/1/zSn16Zhff87dd5+GukSbQmbqnxlMJB
 G5IQ==
X-Gm-Message-State: ACgBeo09jnO3bnbCzGzNLB16rSP18Q0w482XdXZM8W2YpKeeb1y0Stxs
 4KpKLd1xqArnGDVm2u7MKTjxUcKErn0=
X-Google-Smtp-Source: AA6agR4WfTwFCXa81azBBERXsbXpk2dinjhotYWJ0nGoL2daRuVkY9892YZs/32VsXDdFUHP7+Iz2w==
X-Received: by 2002:a05:600c:1d14:b0:3a5:e8ba:f394 with SMTP id
 l20-20020a05600c1d1400b003a5e8baf394mr10416213wms.137.1661886077095; 
 Tue, 30 Aug 2022 12:01:17 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 07/10] hw/isa/vt82c686: Instantiate PM function in host
 device
Date: Tue, 30 Aug 2022 21:00:45 +0200
Message-Id: <20220830190048.67448-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
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
 hw/isa/vt82c686.c         | 12 ++++++++++++
 hw/mips/fuloong2e.c       |  2 +-
 hw/ppc/pegasos2.c         |  3 +--
 include/hw/isa/vt82c686.h |  2 --
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 6aba7f29de..4e66570655 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -40,6 +40,9 @@
 #define TYPE_VIA_PM "via-pm"
 OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
 
+#define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT8231_PM "vt8231-pm"
+
 struct ViaPMState {
     PCIDevice dev;
     MemoryRegion io;
@@ -548,6 +551,7 @@ struct ViaISAState {
     ViaSuperIOState via_sio;
     PCIIDEState ide;
     UHCIState uhci[2];
+    ViaPMState pm;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -641,6 +645,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
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
@@ -683,6 +693,7 @@ static void vt82c686b_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -746,6 +757,7 @@ static void vt8231_init(Object *obj)
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
2.37.2


