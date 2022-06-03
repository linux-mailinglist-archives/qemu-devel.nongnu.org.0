Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10C53D208
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:59:34 +0200 (CEST)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCWD-0003QP-9R
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO6-00077V-PF
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:10 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO5-00048x-27
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:10 -0400
Received: by mail-ed1-x532.google.com with SMTP id n28so11299717edb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INWHJdCEzGhmN69hiuG+Qj1A8L6gKWutj0DTiMvIB5Q=;
 b=duuMEbFnpsbxxmA2fiQRqu5AKm5dOhMCahzcDIuBAT9j2mnRZPKAhIL1Fi4GXjHRdx
 aYJ3hN0PRV0MtFF/9sbmlG0SWRCrjO78G6EAxPD4TgulAb7BbJPZQhvkbWUmh3LBF14O
 6Q1EPBv9koimVXv59qlmVM1z3a+uGhPHPaZtg39KOXxv6Mk1GD9YqKkG9KG1kzKrKen8
 p+9V6PfBI1smChTpRlyoC3bm5OsVy9tuLC1RdoqOaKfrPlgucdhM4aq6lRHf0wI8qWVX
 VpOr1+n7GiJTeuq1FXlgIGQoar6pUPMH0W1OMHN9w+V0Ui3//dqmmljvP7GcDiyhcwTs
 xYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INWHJdCEzGhmN69hiuG+Qj1A8L6gKWutj0DTiMvIB5Q=;
 b=JoqXQuyOoAqez69LYgYZFEsA6IykXM7JMa8JzjA7x2ctFx5mwjLNtqAuGR1H+IXMiB
 OF+dkjCJN0nYi93RlGrOz3ACZosiDXB9NpHBQV+P6Ax5qah8tUiHzjTaYgNWxho+QvZQ
 SmHNk2MG0Ujck0hAP6b4g8eSAuP+w11xtBy9RBs0CEiJR30UIRo+K/uohWfhjUoHGMNo
 zUZJPO+RFKgIR3b6dAsSYZfRYZ/20Fm3WIVAEY5bqwu4kXtGDt36UEOf5w/5e802m+Fy
 70jqYYkEDiDO/8zngAApvSGTHtH2e9m6nuUvslXYTEVf06ZRBQroVfnstHbLEmrRybnR
 akOw==
X-Gm-Message-State: AOAM530C9lEwwUrLH0QVtu9wG66qnzjJKMFzxFtG+AbAD6N90aI80oVZ
 SNr7kd56I1EBxSveDE8Rt3Ed1wwJH5GJvA==
X-Google-Smtp-Source: ABdhPJw4tmGLk/1Xp/iEPARnj0s7Ac1Ahx37R88Inrr/3pn8QNJajorqtBOfTk0bUbYmxCQ+DQJHIw==
X-Received: by 2002:a05:6402:516e:b0:42d:c48b:b724 with SMTP id
 d14-20020a056402516e00b0042dc48bb724mr12406610ede.93.1654282266632; 
 Fri, 03 Jun 2022 11:51:06 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:06 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 04/11] hw/isa/piix4: QOM'ify PCI device creation and wiring
Date: Fri,  3 Jun 2022 20:50:38 +0200
Message-Id: <20220603185045.143789-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PCI interrupt wiring and device creation were performed in create()
functions which are obsolete. Move these tasks into QOM functions to
modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 18aa24424f..058bebb5e2 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -35,6 +35,7 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
 #include "hw/acpi/piix4.h"
+#include "hw/usb/hcd-uhci.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -46,6 +47,8 @@ struct PIIX4State {
     qemu_irq *isa;
 
     RTCState rtc;
+    PCIIDEState ide;
+    UHCIState uhci;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
@@ -205,6 +208,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
 
@@ -243,6 +247,21 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+    pci_ide_create_devs(PCI_DEVICE(&s->ide));
+
+    /* USB */
+    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -250,6 +269,8 @@ static void piix4_init(Object *obj)
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
+    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
@@ -293,7 +314,6 @@ type_init(piix4_register_types)
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
-    PIIX4State *s;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -301,15 +321,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
-    s = PIIX4_PCI_DEVICE(pci);
+
     if (isa_bus) {
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
 
-    pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
-    pci_ide_create_devs(pci);
-
-    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
         pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
         qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
@@ -320,7 +336,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
-
     return dev;
 }
-- 
2.36.1


