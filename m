Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52500612D53
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGoU-00015z-UK; Sun, 30 Oct 2022 18:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoT-00010G-0q
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoF-0007Ig-U1
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id g12so13649312wrs.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q6dtBSvlruukQsa4Krt9GQSDeQQ5kK09kZhFC5HQRLY=;
 b=iui9zM6Ol0VRP6DhjP/aJzOTzo+X25vyAEKHAe4Ogx2lrgEr7AGrcXSwej+Yu9yLL0
 Y5m8H9FNVbwGDYWG/OlzF+MwFHHQ2s/IiWwZoBTNVMMq2dTWNTVJM6+1ZoOactrseCsO
 4jJ0UdvwG+nou4/o9wxpp9olvOM6P6CC2VcN4m9L2q5bGlCTDziRAQZWS6eiPrsFNZzb
 Nk4F7v+362cHexb+/4Fl5+l4cLuH5Xxb8bsmnuudEUajklYNJtPnlFW0p3/A/Dx7L4sa
 1nD3rNvcnjnGwHnjBMDrwvZ1Ht7qsIKSyMPLkV2hr3Chygsvn8tFnJBTJe/EDRy2KYmb
 N7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6dtBSvlruukQsa4Krt9GQSDeQQ5kK09kZhFC5HQRLY=;
 b=5GGfjxXcxzFJMTnt8XoVj4hKgt30B31ddqQpTg2M6cyU7tplVbnUzFZACHa4Vyltcd
 tUhLytN4ENAZtllBzWoJNVGYOsiFk9lXGUJiQaVo+g8ZohF47xV+H1qiTiipC7ALmfNa
 WgIxbbEAL9VNENWVztkuXGcPelXKP/Dl2DwnDg06x42+GscVI0ojyyK6kzjB7eRCUDIF
 dQULSqFf6iro03VVpZD+dLOey3lqkVeARcjaOMryFhtQ0HayTdTvJuueVJ0Uxi59wlg6
 xP4IkbM5f9wUoai9p8OJjQZpkIwR8eFCq2M7hdXvFz2xHDWrUrL5yeKn0X+1gxvGj7q+
 sL+Q==
X-Gm-Message-State: ACrzQf2GxQDLz//Y3tQAqwhWEwocqGE4S0QJuKCz8tKsfpTzCuthFmtL
 jEf5TAsxVEaoHPudoOC/wKYSOkwrwECF8Q==
X-Google-Smtp-Source: AMsMyM7ssaJ8hHvdSd0fVylP1vwioa89nDVZjcTxiJzs0ir7ahKNkCBFAUQU8m3f54fYGwybtS6lpA==
X-Received: by 2002:adf:f303:0:b0:236:d1c0:79dc with SMTP id
 i3-20020adff303000000b00236d1c079dcmr189525wro.695.1667168978315; 
 Sun, 30 Oct 2022 15:29:38 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c489100b003cf6c2f9513sm2835363wmp.2.2022.10.30.15.29.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 08/55] hw/isa/vt82c686: Instantiate USB functions in host device
Date: Sun, 30 Oct 2022 23:27:54 +0100
Message-Id: <20221030222841.42377-9-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The USB functions can be enabled/disabled through the ISA function. Also
its interrupt routing can be influenced there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-9-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 23b4156a5e..bd3c5cf835 100644
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


