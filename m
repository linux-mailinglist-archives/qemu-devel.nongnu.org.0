Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8B53D209
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:59:34 +0200 (CEST)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCWD-0003Q1-By
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCOC-0007Dx-9I
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:16 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCOA-0004Bu-Ml
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:16 -0400
Received: by mail-ej1-x632.google.com with SMTP id gl15so3736608ejb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxlhUXhWWLGkh4tQNKHeVva8WuCFxq7n16eNJytTjtI=;
 b=AAegG21Trd/rndetxiIlYtW7EGuzL2OUeiwu5ArvPmOKDsEscLwX4Gcj0bOuOqWHMS
 8TJfKNl2NP8um+zkirmR09qLkdaaTxVKwqFJwnmEwM6uaRiCRy3vEsqXpgaDZ7CDfp9l
 Hl1BwgqrOoLCrqzkYKq806qIfhRjLoUJdjnPJ2k+l50HVi+W17Fl6Y5wJTOrTbRj84Zi
 lG8odoDAeBQvPcPuh0DOd5UDt3sPbNk2aHWj5g8rjFjUfqJsKs1tyCRIbPxkm+zlFNkp
 Mdoe9tgqPIxP5SZ85PhpkeczMbLIcSO4MClvo/Ic9usu71akkBiCRLhmY8bbTLVHod4W
 SHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxlhUXhWWLGkh4tQNKHeVva8WuCFxq7n16eNJytTjtI=;
 b=bjlRXKbew/LZJvg3bXzyQJiRJLo3FxZdqaWVar7KcLTKBAu+NZioCgHPhR7DTvDOKR
 5ieAKlTusJqCG5y+EmHgBCq7hW4xfx3ZbvfaIu6/UWEhvslZgcdAkzmFEjRgk5NSznX7
 kJtW5e5MrjabQxDd14bxvwL5ulyyiX2gm0EiC/iFRGt5FO9K1mlCy9B+G4oeASwe20Lc
 uLtFn7MymqGanCJgkSrE4scZ74QuaWfDGy6k8aUpF+0EZLwqPFbgZJ/yYHq54lEKwHY1
 VupcvYbIIzfnAM10A+baG/p/pT1CcS2C/QGCA58hRekT25+btZDj/stNEDF/IuSK3IbI
 E3fg==
X-Gm-Message-State: AOAM532oU7L32tzgaeVVkDJpXYtYUmNcO/vU4HEjtx8833y4Jdvmbxcq
 hPTIj2YkXCfui7W6BgaYQjJSmfxqLqnveg==
X-Google-Smtp-Source: ABdhPJyOkrRwp8QCGD3s8IF4O3QQRHmgQ0EFLmAPWXf8Gk0WlFOHnqT8AQMDpzSR8LMbppV8gDMFRw==
X-Received: by 2002:a17:906:c155:b0:708:21b1:dcf6 with SMTP id
 dp21-20020a170906c15500b0070821b1dcf6mr10003170ejc.661.1654282273135; 
 Fri, 03 Jun 2022 11:51:13 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:12 -0700 (PDT)
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
Subject: [PATCH v4 09/11] hw/isa/piix3: QOM'ify PCI device creation and wiring
Date: Fri,  3 Jun 2022 20:50:43 +0200
Message-Id: <20220603185045.143789-10-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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

PCI interrupt wiring was performed in create() functions which are
obsolete. Move these tasks into QOM functions to modernize the code.

In order to avoid duplicate checking for xen_enabled() the realize
methods are now split.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c7a9014c3f..de532cc692 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/range.h"
+#include "qapi/error.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -277,7 +278,7 @@ static const MemoryRegionOps rcr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN
 };
 
-static void piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
 
@@ -302,7 +303,6 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-    k->realize      = piix3_realize;
     k->vendor_id    = PCI_VENDOR_ID_INTEL;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -326,11 +326,28 @@ static const TypeInfo piix3_pci_type_info = {
     },
 };
 
+static void piix3_realize(PCIDevice *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+
+    pci_piix3_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+                 piix3, PIIX_NUM_PIRQS);
+    pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
+};
+
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config;
+    k->realize = piix3_realize;
 }
 
 static const TypeInfo piix3_info = {
@@ -339,11 +356,33 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
+static void piix3_xen_realize(PCIDevice *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+
+    pci_piix3_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    /*
+     * Xen supports additional interrupt routes from the PCI devices to
+     * the IOAPIC: the four pins of each PCI device on the bus are also
+     * connected to the IOAPIC directly.
+     * These additional routes can be discovered through ACPI.
+     */
+    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
+                 piix3, XEN_PIIX_NUM_PIRQS);
+};
+
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
+    k->realize = piix3_xen_realize;
 };
 
 static const TypeInfo piix3_xen_info = {
@@ -365,27 +404,11 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
+    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                     : TYPE_PIIX3_DEVICE;
 
-    /*
-     * Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI.
-     */
-    if (xen_enabled()) {
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
-                                                  TYPE_PIIX3_XEN_DEVICE);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
-                     piix3, XEN_PIIX_NUM_PIRQS);
-    } else {
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
-                                                  TYPE_PIIX3_DEVICE);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
-                     piix3, PIIX_NUM_PIRQS);
-        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-    }
+    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+    piix3 = PIIX3_PCI_DEVICE(pci_dev);
     *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
-- 
2.36.1


