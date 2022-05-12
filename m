Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D935253E5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:41:15 +0200 (CEST)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCoM-0004iV-DG
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ7-0004vQ-3g
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ4-00056d-7d
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7xwy3VVsdIap/nHsMa/gGjbstK4kLAiXSxSTkoGFa0=;
 b=YF/LnA2F5Xv59DSfeOwB+pHkFlqTlRleCRAgL8NZ+T454U5Jgxvmdy71tKy4x3c5qdvj78
 x2YQNKjdgy0xkBlTCM+Mt4R2d/zjph33cND2mABvg5FI4xcTEjv95QRpckxzl8ITpm2xW/
 4tVQRGMwAqzT1XTsxn+cxFPpX7YQTmA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-ZVtorMRVOLmZopMEAqve2g-1; Thu, 12 May 2022 13:25:24 -0400
X-MC-Unique: ZVtorMRVOLmZopMEAqve2g-1
Received: by mail-ej1-f69.google.com with SMTP id
 ox8-20020a170907100800b006f9dc6e4a22so3181363ejb.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7xwy3VVsdIap/nHsMa/gGjbstK4kLAiXSxSTkoGFa0=;
 b=VigFOveG3YlSqsQlQp7AOMwXzdQL+ED5RRRzWxAaHe0GeonpDZQHf9nnU3oz1Dy/il
 ohrjslM+ZABjaEZ+V9abjSxXWPuLOzOJAKO17EPzhFAXm+4ah2p6W1wWB7seeN9CqpMl
 GON8lBgpP/cfiH/9o5KanUoPcTBGbb2Y1Wr+zNMtG6oro2Sk7ajiT3gVjp2nvkebu4Md
 b55sm5kgv6M2afmBwmGj0+53mmY6f/A0DVWdaET+16+olM9NACCHQs5XBpoZ9rWE5NA3
 PQf5CipMnsAXcfNq7USC635DLAtrWgfNcUEZ0+nJTT3Yf7YsiMCmPvPpYoo/lrVLbc48
 L5jQ==
X-Gm-Message-State: AOAM533kf/1VArA/7Py9fFW4tZnpinmvpSdDo28zNqRFJpE94XjOCzQ4
 jnu5/KtkBJ8XnJ2pPKiS6fweUadMXF/KVg3vVmn8eR02QE3vuBf4ZWXrUQ/v3B3xP+5eLJNqp5O
 YNrRVF6ecc2PGy4NgDPxOz4UQA/SyR3RHmUKCqCoDcGXew0uL/SGjK0DfyKB4exuSsL4=
X-Received: by 2002:a17:907:7da6:b0:6f4:dc6f:1e32 with SMTP id
 oz38-20020a1709077da600b006f4dc6f1e32mr840940ejc.614.1652376322544; 
 Thu, 12 May 2022 10:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRiMidKDUI5/KD4gmqVdwiDtEWC/6J8er+v6lLYyTF5VGVB7TptIqJBGysZju8QEQM45/ivw==
X-Received: by 2002:a17:907:7da6:b0:6f4:dc6f:1e32 with SMTP id
 oz38-20020a1709077da600b006f4dc6f1e32mr840890ejc.614.1652376321968; 
 Thu, 12 May 2022 10:25:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 fx16-20020a170906b75000b006f3ef214dcbsm2311976ejb.49.2022.05.12.10.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 06/27] hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
Date: Thu, 12 May 2022 19:24:44 +0200
Message-Id: <20220512172505.1065394-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

igd-passthrough-isa-bridge is only requested in xen_pt but was
implemented in pc_piix.c. This caused xen_pt to dependend on i386/pc
which is hereby resolved.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <20220326165825.30794-2-shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_piix.c        | 118 --------------------------------------
 hw/xen/xen_pt.c          |   1 -
 hw/xen/xen_pt.h          |   1 +
 hw/xen/xen_pt_graphics.c | 119 +++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h     |   1 -
 5 files changed, 120 insertions(+), 120 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4c185c72d0..f843dd906f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -813,124 +813,6 @@ static void pc_i440fx_1_4_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v1_4, "pc-i440fx-1.4", pc_compat_1_4_fn,
                       pc_i440fx_1_4_machine_options);
 
-typedef struct {
-    uint16_t gpu_device_id;
-    uint16_t pch_device_id;
-    uint8_t pch_revision_id;
-} IGDDeviceIDInfo;
-
-/* In real world different GPU should have different PCH. But actually
- * the different PCH DIDs likely map to different PCH SKUs. We do the
- * same thing for the GPU. For PCH, the different SKUs are going to be
- * all the same silicon design and implementation, just different
- * features turn on and off with fuses. The SW interfaces should be
- * consistent across all SKUs in a given family (eg LPT). But just same
- * features may not be supported.
- *
- * Most of these different PCH features probably don't matter to the
- * Gfx driver, but obviously any difference in display port connections
- * will so it should be fine with any PCH in case of passthrough.
- *
- * So currently use one PCH version, 0x8c4e, to cover all HSW(Haswell)
- * scenarios, 0x9cc3 for BDW(Broadwell).
- */
-static const IGDDeviceIDInfo igd_combo_id_infos[] = {
-    /* HSW Classic */
-    {0x0402, 0x8c4e, 0x04}, /* HSWGT1D, HSWD_w7 */
-    {0x0406, 0x8c4e, 0x04}, /* HSWGT1M, HSWM_w7 */
-    {0x0412, 0x8c4e, 0x04}, /* HSWGT2D, HSWD_w7 */
-    {0x0416, 0x8c4e, 0x04}, /* HSWGT2M, HSWM_w7 */
-    {0x041E, 0x8c4e, 0x04}, /* HSWGT15D, HSWD_w7 */
-    /* HSW ULT */
-    {0x0A06, 0x8c4e, 0x04}, /* HSWGT1UT, HSWM_w7 */
-    {0x0A16, 0x8c4e, 0x04}, /* HSWGT2UT, HSWM_w7 */
-    {0x0A26, 0x8c4e, 0x06}, /* HSWGT3UT, HSWM_w7 */
-    {0x0A2E, 0x8c4e, 0x04}, /* HSWGT3UT28W, HSWM_w7 */
-    {0x0A1E, 0x8c4e, 0x04}, /* HSWGT2UX, HSWM_w7 */
-    {0x0A0E, 0x8c4e, 0x04}, /* HSWGT1ULX, HSWM_w7 */
-    /* HSW CRW */
-    {0x0D26, 0x8c4e, 0x04}, /* HSWGT3CW, HSWM_w7 */
-    {0x0D22, 0x8c4e, 0x04}, /* HSWGT3CWDT, HSWD_w7 */
-    /* HSW Server */
-    {0x041A, 0x8c4e, 0x04}, /* HSWSVGT2, HSWD_w7 */
-    /* HSW SRVR */
-    {0x040A, 0x8c4e, 0x04}, /* HSWSVGT1, HSWD_w7 */
-    /* BSW */
-    {0x1606, 0x9cc3, 0x03}, /* BDWULTGT1, BDWM_w7 */
-    {0x1616, 0x9cc3, 0x03}, /* BDWULTGT2, BDWM_w7 */
-    {0x1626, 0x9cc3, 0x03}, /* BDWULTGT3, BDWM_w7 */
-    {0x160E, 0x9cc3, 0x03}, /* BDWULXGT1, BDWM_w7 */
-    {0x161E, 0x9cc3, 0x03}, /* BDWULXGT2, BDWM_w7 */
-    {0x1602, 0x9cc3, 0x03}, /* BDWHALOGT1, BDWM_w7 */
-    {0x1612, 0x9cc3, 0x03}, /* BDWHALOGT2, BDWM_w7 */
-    {0x1622, 0x9cc3, 0x03}, /* BDWHALOGT3, BDWM_w7 */
-    {0x162B, 0x9cc3, 0x03}, /* BDWHALO28W, BDWM_w7 */
-    {0x162A, 0x9cc3, 0x03}, /* BDWGT3WRKS, BDWM_w7 */
-    {0x162D, 0x9cc3, 0x03}, /* BDWGT3SRVR, BDWM_w7 */
-};
-
-static void isa_bridge_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    dc->desc        = "ISA bridge faked to support IGD PT";
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    k->vendor_id    = PCI_VENDOR_ID_INTEL;
-    k->class_id     = PCI_CLASS_BRIDGE_ISA;
-};
-
-static const TypeInfo isa_bridge_info = {
-    .name          = "igd-passthrough-isa-bridge",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
-    .class_init = isa_bridge_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void pt_graphics_register_types(void)
-{
-    type_register_static(&isa_bridge_info);
-}
-type_init(pt_graphics_register_types)
-
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
-{
-    struct PCIDevice *bridge_dev;
-    int i, num;
-    uint16_t pch_dev_id = 0xffff;
-    uint8_t pch_rev_id = 0;
-
-    num = ARRAY_SIZE(igd_combo_id_infos);
-    for (i = 0; i < num; i++) {
-        if (gpu_dev_id == igd_combo_id_infos[i].gpu_device_id) {
-            pch_dev_id = igd_combo_id_infos[i].pch_device_id;
-            pch_rev_id = igd_combo_id_infos[i].pch_revision_id;
-        }
-    }
-
-    if (pch_dev_id == 0xffff) {
-        return;
-    }
-
-    /* Currently IGD drivers always need to access PCH by 1f.0. */
-    bridge_dev = pci_create_simple(bus, PCI_DEVFN(0x1f, 0),
-                                   "igd-passthrough-isa-bridge");
-
-    /*
-     * Note that vendor id is always PCI_VENDOR_ID_INTEL.
-     */
-    if (!bridge_dev) {
-        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
-        return;
-    }
-    pci_config_set_device_id(bridge_dev->config, pch_dev_id);
-    pci_config_set_revision(bridge_dev->config, pch_rev_id);
-}
-
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 027190fa44..829ea9985f 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -60,7 +60,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/xen/xen.h"
-#include "hw/i386/pc.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "xen_pt.h"
 #include "qemu/range.h"
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 6b8e13cdee..806d832c94 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -43,6 +43,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
+void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
 
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index a3bc7e3921..f1fbb98912 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -289,3 +289,122 @@ void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val)
                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
                     (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT));
 }
+
+typedef struct {
+    uint16_t gpu_device_id;
+    uint16_t pch_device_id;
+    uint8_t pch_revision_id;
+} IGDDeviceIDInfo;
+
+/*
+ * In real world different GPU should have different PCH. But actually
+ * the different PCH DIDs likely map to different PCH SKUs. We do the
+ * same thing for the GPU. For PCH, the different SKUs are going to be
+ * all the same silicon design and implementation, just different
+ * features turn on and off with fuses. The SW interfaces should be
+ * consistent across all SKUs in a given family (eg LPT). But just same
+ * features may not be supported.
+ *
+ * Most of these different PCH features probably don't matter to the
+ * Gfx driver, but obviously any difference in display port connections
+ * will so it should be fine with any PCH in case of passthrough.
+ *
+ * So currently use one PCH version, 0x8c4e, to cover all HSW(Haswell)
+ * scenarios, 0x9cc3 for BDW(Broadwell).
+ */
+static const IGDDeviceIDInfo igd_combo_id_infos[] = {
+    /* HSW Classic */
+    {0x0402, 0x8c4e, 0x04}, /* HSWGT1D, HSWD_w7 */
+    {0x0406, 0x8c4e, 0x04}, /* HSWGT1M, HSWM_w7 */
+    {0x0412, 0x8c4e, 0x04}, /* HSWGT2D, HSWD_w7 */
+    {0x0416, 0x8c4e, 0x04}, /* HSWGT2M, HSWM_w7 */
+    {0x041E, 0x8c4e, 0x04}, /* HSWGT15D, HSWD_w7 */
+    /* HSW ULT */
+    {0x0A06, 0x8c4e, 0x04}, /* HSWGT1UT, HSWM_w7 */
+    {0x0A16, 0x8c4e, 0x04}, /* HSWGT2UT, HSWM_w7 */
+    {0x0A26, 0x8c4e, 0x06}, /* HSWGT3UT, HSWM_w7 */
+    {0x0A2E, 0x8c4e, 0x04}, /* HSWGT3UT28W, HSWM_w7 */
+    {0x0A1E, 0x8c4e, 0x04}, /* HSWGT2UX, HSWM_w7 */
+    {0x0A0E, 0x8c4e, 0x04}, /* HSWGT1ULX, HSWM_w7 */
+    /* HSW CRW */
+    {0x0D26, 0x8c4e, 0x04}, /* HSWGT3CW, HSWM_w7 */
+    {0x0D22, 0x8c4e, 0x04}, /* HSWGT3CWDT, HSWD_w7 */
+    /* HSW Server */
+    {0x041A, 0x8c4e, 0x04}, /* HSWSVGT2, HSWD_w7 */
+    /* HSW SRVR */
+    {0x040A, 0x8c4e, 0x04}, /* HSWSVGT1, HSWD_w7 */
+    /* BSW */
+    {0x1606, 0x9cc3, 0x03}, /* BDWULTGT1, BDWM_w7 */
+    {0x1616, 0x9cc3, 0x03}, /* BDWULTGT2, BDWM_w7 */
+    {0x1626, 0x9cc3, 0x03}, /* BDWULTGT3, BDWM_w7 */
+    {0x160E, 0x9cc3, 0x03}, /* BDWULXGT1, BDWM_w7 */
+    {0x161E, 0x9cc3, 0x03}, /* BDWULXGT2, BDWM_w7 */
+    {0x1602, 0x9cc3, 0x03}, /* BDWHALOGT1, BDWM_w7 */
+    {0x1612, 0x9cc3, 0x03}, /* BDWHALOGT2, BDWM_w7 */
+    {0x1622, 0x9cc3, 0x03}, /* BDWHALOGT3, BDWM_w7 */
+    {0x162B, 0x9cc3, 0x03}, /* BDWHALO28W, BDWM_w7 */
+    {0x162A, 0x9cc3, 0x03}, /* BDWGT3WRKS, BDWM_w7 */
+    {0x162D, 0x9cc3, 0x03}, /* BDWGT3SRVR, BDWM_w7 */
+};
+
+static void isa_bridge_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    dc->desc        = "ISA bridge faked to support IGD PT";
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    k->vendor_id    = PCI_VENDOR_ID_INTEL;
+    k->class_id     = PCI_CLASS_BRIDGE_ISA;
+};
+
+static const TypeInfo isa_bridge_info = {
+    .name          = "igd-passthrough-isa-bridge",
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PCIDevice),
+    .class_init = isa_bridge_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void pt_graphics_register_types(void)
+{
+    type_register_static(&isa_bridge_info);
+}
+type_init(pt_graphics_register_types)
+
+void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
+{
+    struct PCIDevice *bridge_dev;
+    int i, num;
+    uint16_t pch_dev_id = 0xffff;
+    uint8_t pch_rev_id = 0;
+
+    num = ARRAY_SIZE(igd_combo_id_infos);
+    for (i = 0; i < num; i++) {
+        if (gpu_dev_id == igd_combo_id_infos[i].gpu_device_id) {
+            pch_dev_id = igd_combo_id_infos[i].pch_device_id;
+            pch_rev_id = igd_combo_id_infos[i].pch_revision_id;
+        }
+    }
+
+    if (pch_dev_id == 0xffff) {
+        return;
+    }
+
+    /* Currently IGD drivers always need to access PCH by 1f.0. */
+    bridge_dev = pci_create_simple(bus, PCI_DEVFN(0x1f, 0),
+                                   "igd-passthrough-isa-bridge");
+
+    /*
+     * Note that vendor id is always PCI_VENDOR_ID_INTEL.
+     */
+    if (!bridge_dev) {
+        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
+        return;
+    }
+    pci_config_set_device_id(bridge_dev->config, pch_dev_id);
+    pci_config_set_revision(bridge_dev->config, pch_rev_id);
+}
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 637367dc5f..aff8add155 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -315,5 +315,4 @@ extern const size_t pc_compat_1_4_len;
     } \
     type_init(pc_machine_init_##suffix)
 
-extern void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
 #endif
-- 
2.36.0


