Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CC5A9611
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:52:50 +0200 (CEST)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTikb-00050U-AX
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaS-0005h5-9z; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaI-0000Ej-DP; Thu, 01 Sep 2022 07:42:19 -0400
Received: by mail-ed1-x532.google.com with SMTP id b44so22157819edf.9;
 Thu, 01 Sep 2022 04:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RWj9GRHrzzr15/ZkR3tiTCwed+rhxbgqjltEgakH7eA=;
 b=fQK46l2htxKZvYco8quosSuVPJHQXiz5L+P4M+oUcyIV9AL/at7g5xc1Vbb32xbFmv
 dVq/wLP6tvWbRYvzdXFlUg/qSZGJIDR0VSBDmJKyaQg7x3RRB8ey7vjGgWIaLuPAXgk6
 NJ2VT5oDil9pMuzGiu98zgsNoDhCCm45uoyxBYT9HLN/GelBotU90/XvGZvmMe2+PWyH
 gj6d28V923rbmZQ188c73x4iPI8BLj/gXO7N1N4/Eet+I44U3KNvDWNs+seZbPqFdlR1
 vAoIImvegwYFjl2TafHPdwdfRd8ek/mZ/StvwJdIes5w9voo/lHib9DV8lXZAM54oomp
 dtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RWj9GRHrzzr15/ZkR3tiTCwed+rhxbgqjltEgakH7eA=;
 b=HTiH2QNhX5oaNPiaA+Noufh9X+eS9UbBPJJWKUc6jWib4Ps1dyyD+9mQ0C3Z3Frhrk
 uJRHbVr/nWYtOW6lmH910g60fAeNMkfEsdazOi52ZubiCTQWQ7tfCvYfgyFdhFXysbSG
 Ow6DDvkgRznyUkurOGVagUDgei1uiC97TKkUXdvk1+FLFPesqx4SSKssRZ9TngKm6mqK
 AHZ9+UqvU/m8XiFG1tTL5pahZpqtVMKhLQfB0h5vUMjzcSgpVv9/3WRvZ9KK/+6NOUmF
 kf5qeuzoVLWzz61Xksh3qvzzerEwGCviR6x0kEyCO9Hzaa1+YHR3L8vLFQ937mgxy0oZ
 RQrQ==
X-Gm-Message-State: ACgBeo2P8pt4Sln2jcTlYzzcpsiPOGAJcTevwplJOyKcKh5/ZwnZU+AW
 EBaeQYHs19mgUNrTvBaxj7Q25nr1rgU=
X-Google-Smtp-Source: AA6agR5T6cvC+pJXX1YDHni6N2UrRX/Hb81NVPUS2rxo11za+nTjf3IF92NJ0zhSWl4Ww6C6kTTcSQ==
X-Received: by 2002:a05:6402:2684:b0:448:6a69:4b59 with SMTP id
 w4-20020a056402268400b004486a694b59mr16060987edd.390.1662032524965; 
 Thu, 01 Sep 2022 04:42:04 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:04 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 08/13] hw/isa/vt82c686: Instantiate USB functions in host
 device
Date: Thu,  1 Sep 2022 13:41:22 +0200
Message-Id: <20220901114127.53914-9-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
index 63c1e3b8ce..f05fd9948a 100644
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
 
     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
+    object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
+    object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
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
index 6b7370f2aa..dc92223b76 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,9 +208,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
-
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 70776558c9..85cca6f7a6 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -168,10 +168,6 @@ static void pegasos2_init(MachineState *machine)
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    /* VT8231 function 2-3: USB Ports */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), TYPE_VT82C686B_USB_UHCI);
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), TYPE_VT82C686B_USB_UHCI);
-
     /* VT8231 function 4: Power Management Controller */
     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-- 
2.37.3


