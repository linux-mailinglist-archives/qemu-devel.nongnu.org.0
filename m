Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10D6531C1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:29:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yno-0006cM-G0; Wed, 21 Dec 2022 08:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynW-00067I-Ja
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynU-0004Ru-8T
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpXEbo6uQcn8hceJtxAy/nu8sf/FrJu+0EXN5cLTnks=;
 b=VSSmkDFshgA4apQbUB2BvxwEw887wrwixVKUtvIiFzbeqk81q0MDscSYYCQtkMKgTEwG7F
 4/AspJ5eKZAoJtqxJte5FLTAvqZC5zLgFjf5enJMcAxbmKZc+Lahq/U+u5btR/bPokH7/1
 XX50R0nNMKLKsDlag5nkjzV1kTo3Sr0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-ns1LFXkUPjmNxRh2UbvNrQ-1; Wed, 21 Dec 2022 08:06:10 -0500
X-MC-Unique: ns1LFXkUPjmNxRh2UbvNrQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso2913836wrc.22
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KpXEbo6uQcn8hceJtxAy/nu8sf/FrJu+0EXN5cLTnks=;
 b=V8DdPU39Qtjem50HpYEzO4I8QVDGxc2rC8TQb/PaehLyMHytiQ/49XH3X2w9Dd4rtF
 33d2P9HLmGslBLcLO/2LhYoksZEyFNkwWhaYglQCp0gDW03736LI3QChugvM5JLMp70S
 jY/jjBPezyFd5ZeDJ2q/5tpu8S0ekBiFuc6gVlcJ4IYTe3VBvC9iemXOiVwucXgK7gzY
 Pk903qng+rZRlPB1OnMFTivUTnD5FfKcjn6Y/RWalFxvAg4EQYrh+rFmeeIOcUVcRqYJ
 qlIIQkiidv0N0tvWFjn1rHn+rm4GVqxtb6SKpl4unSqfSEOTM7Ov0RSBdfldPMcObqyw
 zh6w==
X-Gm-Message-State: AFqh2kovhnUMkwzHOOKP2synxxZdgU7/vv3LVStippICjGDnrmyWSB2V
 TfXx9qloB86hwvWdK8nJih4wgaTN7ENn/wdCdnplkxbPY2bYcKxY6Tf2zVQ8FH9rXwS7/fTd1VR
 4VXnnWaE9Nf8+qwDg4RX8kjJMWbuyVnLVAi5WOxsq1XNwmxI3Yj5DYZnluVFp
X-Received: by 2002:adf:a3d8:0:b0:250:8ff5:6141 with SMTP id
 m24-20020adfa3d8000000b002508ff56141mr1296668wrb.6.1671627967932; 
 Wed, 21 Dec 2022 05:06:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1X0icA+64zaYF7KKMqZn/dic2LG9eAAUU40kWfdNLF71qsEdKR4llRbCWfSlfoGyVEUR//A==
X-Received: by 2002:adf:a3d8:0:b0:250:8ff5:6141 with SMTP id
 m24-20020adfa3d8000000b002508ff56141mr1296630wrb.6.1671627967530; 
 Wed, 21 Dec 2022 05:06:07 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 y14-20020adffa4e000000b00268aae5fb5bsm3049516wrr.3.2022.12.21.05.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:06 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PULL 29/41] pci: drop redundant PCIDeviceClass::is_bridge field
Message-ID: <20221221130339.1234592-30-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

and use cast to TYPE_PCI_BRIDGE instead.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221129101341.185621-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 include/hw/pci/pci.h               | 10 +---------
 include/hw/pci/pci_bridge.h        |  1 +
 hw/acpi/pcihp.c                    |  3 +--
 hw/i386/acpi-build.c               |  5 ++---
 hw/pci-bridge/cxl_downstream.c     |  1 -
 hw/pci-bridge/cxl_upstream.c       |  1 -
 hw/pci-bridge/i82801b11.c          |  1 -
 hw/pci-bridge/pci_bridge_dev.c     |  1 -
 hw/pci-bridge/pcie_pci_bridge.c    |  1 -
 hw/pci-bridge/pcie_root_port.c     |  1 -
 hw/pci-bridge/simba.c              |  1 -
 hw/pci-bridge/xio3130_downstream.c |  1 -
 hw/pci-bridge/xio3130_upstream.c   |  1 -
 hw/pci-host/designware.c           |  1 -
 hw/pci-host/xilinx-pcie.c          |  1 -
 hw/pci/pci.c                       | 20 +++++++++-----------
 hw/ppc/spapr_pci.c                 | 15 +++++----------
 17 files changed, 19 insertions(+), 46 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 06e2d5f889..954f260f84 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -251,15 +251,7 @@ struct PCIDeviceClass {
     uint16_t subsystem_vendor_id;       /* only for header type = 0 */
     uint16_t subsystem_id;              /* only for header type = 0 */
 
-    /*
-     * pci-to-pci bridge or normal device.
-     * This doesn't mean pci host switch.
-     * When card bus bridge is supported, this would be enhanced.
-     */
-    bool is_bridge;
-
-    /* rom bar */
-    const char *romfile;
+    const char *romfile;                /* rom bar */
 };
 
 typedef void (*PCIINTxRoutingNotifier)(PCIDevice *dev);
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba4bafac7c..ca6caf487e 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -53,6 +53,7 @@ struct PCIBridgeWindows {
 
 #define TYPE_PCI_BRIDGE "base-pci-bridge"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIBridge, PCI_BRIDGE)
+#define IS_PCI_BRIDGE(dev) object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)
 
 struct PCIBridge {
     /*< private >*/
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 84d75e6b84..99a898d9ae 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -186,7 +186,6 @@ static PCIBus *acpi_pcihp_find_hotplug_bus(AcpiPciHpState *s, int bsel)
 
 static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
 {
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
     /*
      * ACPI doesn't allow hotplug of bridge devices.  Don't allow
@@ -196,7 +195,7 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
      * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
      * will be removed implicitly, when Physical Function is unplugged.
      */
-    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable ||
+    return (IS_PCI_BRIDGE(dev) && !dev->qdev.hotplugged) || !dc->hotpluggable ||
            pci_is_vf(dev);
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d9eaa5fc4d..aa15b11cde 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -403,7 +403,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         DeviceClass *dc;
-        PCIDeviceClass *pc;
         PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
         int func = PCI_FUNC(devfn);
@@ -414,14 +413,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         bool cold_plugged_bridge = false;
 
         if (pdev) {
-            pc = PCI_DEVICE_GET_CLASS(pdev);
             dc = DEVICE_GET_CLASS(pdev);
 
             /*
              * Cold plugged bridges aren't themselves hot-pluggable.
              * Hotplugged bridges *are* hot-pluggable.
              */
-            cold_plugged_bridge = pc->is_bridge && !DEVICE(pdev)->hotplugged;
+            cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
+                                  !DEVICE(pdev)->hotplugged;
             bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
 
             hotpluggbale_slot = bsel && dc->hotpluggable &&
diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
index a361e519d0..3d4e6b59cd 100644
--- a/hw/pci-bridge/cxl_downstream.c
+++ b/hw/pci-bridge/cxl_downstream.c
@@ -217,7 +217,6 @@ static void cxl_dsp_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(oc);
 
-    k->is_bridge = true;
     k->config_write = cxl_dsp_config_write;
     k->realize = cxl_dsp_realize;
     k->exit = cxl_dsp_exitfn;
diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index 9b8b57df9d..9df436cb73 100644
--- a/hw/pci-bridge/cxl_upstream.c
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -375,7 +375,6 @@ static void cxl_upstream_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(oc);
 
-    k->is_bridge = true;
     k->config_write = cxl_usp_write_config;
     k->config_read = cxl_usp_read_config;
     k->realize = cxl_usp_realize;
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f28181e210..d9f224818b 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -92,7 +92,6 @@ static void i82801b11_bridge_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->is_bridge = true;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82801BA_11;
     k->revision = ICH9_D2P_A2_REVISION;
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 657a06ddbe..3435df8d73 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -254,7 +254,6 @@ static void pci_bridge_dev_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_REDHAT;
     k->device_id = PCI_DEVICE_ID_REDHAT_BRIDGE;
     k->class_id = PCI_CLASS_BRIDGE_PCI;
-    k->is_bridge = true;
     dc->desc = "Standard PCI Bridge";
     dc->reset = qdev_pci_bridge_dev_reset;
     device_class_set_props(dc, pci_bridge_dev_properties);
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 1cd917a459..2301b2ca0b 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -145,7 +145,6 @@ static void pcie_pci_bridge_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
 
-    k->is_bridge = true;
     k->vendor_id = PCI_VENDOR_ID_REDHAT;
     k->device_id = PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE;
     k->realize = pcie_pci_bridge_realize;
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 36bc0bafa7..efd96bf174 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -174,7 +174,6 @@ static void rp_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    k->is_bridge = true;
     k->config_write = rp_write_config;
     k->realize = rp_realize;
     k->exit = rp_exit;
diff --git a/hw/pci-bridge/simba.c b/hw/pci-bridge/simba.c
index ba55ab1939..17aa0d7b21 100644
--- a/hw/pci-bridge/simba.c
+++ b/hw/pci-bridge/simba.c
@@ -77,7 +77,6 @@ static void simba_pci_bridge_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_SUN_SIMBA;
     k->revision = 0x11;
     k->config_write = pci_bridge_write_config;
-    k->is_bridge = true;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->reset = pci_bridge_reset;
     dc->vmsd = &vmstate_pci_device;
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 05e2b06c0c..38a2361fa2 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -159,7 +159,6 @@ static void xio3130_downstream_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->is_bridge = true;
     k->config_write = xio3130_downstream_write_config;
     k->realize = xio3130_downstream_realize;
     k->exit = xio3130_downstream_exitfn;
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5ff46ef050..a48bfe3bc5 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -128,7 +128,6 @@ static void xio3130_upstream_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->is_bridge = true;
     k->config_write = xio3130_upstream_write_config;
     k->realize = xio3130_upstream_realize;
     k->exit = xio3130_upstream_exitfn;
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index bde3a343a2..9e183caa48 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -600,7 +600,6 @@ static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
     k->device_id = 0xABCD;
     k->revision = 0;
     k->class_id = PCI_CLASS_BRIDGE_PCI;
-    k->is_bridge = true;
     k->exit = pci_bridge_exitfn;
     k->realize = designware_pcie_root_realize;
     k->config_read = designware_pcie_root_config_read;
diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
index 38d5901a45..c9ab7052f4 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -298,7 +298,6 @@ static void xilinx_pcie_root_class_init(ObjectClass *klass, void *data)
     k->device_id = 0x7021;
     k->revision = 0;
     k->class_id = PCI_CLASS_BRIDGE_HOST;
-    k->is_bridge = true;
     k->realize = xilinx_pcie_root_realize;
     k->exit = pci_bridge_exitfn;
     dc->reset = pci_bridge_reset;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c61348dca0..c55eb694fd 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -576,7 +576,7 @@ void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
     for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
         PCIDevice *dev = bus->devices[i];
 
-        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
+        if (dev && IS_PCI_BRIDGE(dev)) {
             *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
             *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
         }
@@ -592,7 +592,6 @@ static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
                                  const VMStateField *field)
 {
     PCIDevice *s = container_of(pv, PCIDevice, config);
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(s);
     uint8_t *config;
     int i;
 
@@ -614,9 +613,8 @@ static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
     memcpy(s->config, config, size);
 
     pci_update_mappings(s);
-    if (pc->is_bridge) {
-        PCIBridge *b = PCI_BRIDGE(s);
-        pci_bridge_update_mappings(b);
+    if (IS_PCI_BRIDGE(s)) {
+        pci_bridge_update_mappings(PCI_BRIDGE(s));
     }
 
     memory_region_set_enabled(&s->bus_master_enable_region,
@@ -1090,9 +1088,10 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
     Error *local_err = NULL;
     DeviceState *dev = DEVICE(pci_dev);
     PCIBus *bus = pci_get_bus(pci_dev);
+    bool is_bridge = IS_PCI_BRIDGE(pci_dev);
 
     /* Only pci bridges can be attached to extra PCI root buses */
-    if (pci_bus_is_root(bus) && bus->parent_dev && !pc->is_bridge) {
+    if (pci_bus_is_root(bus) && bus->parent_dev && !is_bridge) {
         error_setg(errp,
                    "PCI: Only PCI/PCIe bridges can be plugged into %s",
                     bus->parent_dev->name);
@@ -1154,7 +1153,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
     pci_config_set_revision(pci_dev->config, pc->revision);
     pci_config_set_class(pci_dev->config, pc->class_id);
 
-    if (!pc->is_bridge) {
+    if (!is_bridge) {
         if (pc->subsystem_vendor_id || pc->subsystem_id) {
             pci_set_word(pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID,
                          pc->subsystem_vendor_id);
@@ -1171,7 +1170,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
     pci_init_cmask(pci_dev);
     pci_init_wmask(pci_dev);
     pci_init_w1cmask(pci_dev);
-    if (pc->is_bridge) {
+    if (is_bridge) {
         pci_init_mask_bridge(pci_dev);
     }
     pci_init_multifunction(bus, pci_dev, &local_err);
@@ -2094,7 +2093,7 @@ static bool pci_root_bus_in_range(PCIBus *bus, int bus_num)
     for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
         PCIDevice *dev = bus->devices[i];
 
-        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
+        if (dev && IS_PCI_BRIDGE(dev)) {
             if (pci_secondary_bus_in_range(dev, bus_num)) {
                 return true;
             }
@@ -2839,7 +2838,6 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque)
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
     uint16_t cmd = pci_get_word(dev->config + PCI_COMMAND);
     int i;
 
@@ -2847,7 +2845,7 @@ static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
         return;
     }
 
-    if (pc->is_bridge) {
+    if (IS_PCI_BRIDGE(dev)) {
         pcibus_t base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
         pcibus_t limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7b7618d5da..75aacda65a 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1361,7 +1361,6 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
 {
     int offset;
     g_autofree gchar *nodename = spapr_pci_fw_dev_name(dev);
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
     ResourceProps rp;
     SpaprDrc *drc = drc_from_dev(sphb, dev);
     uint32_t vendor_id = pci_default_read_config(dev, PCI_VENDOR_ID, 2);
@@ -1446,7 +1445,7 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
 
     spapr_phb_nvgpu_populate_pcidev_dt(dev, fdt, offset, sphb);
 
-    if (!pc->is_bridge) {
+    if (!IS_PCI_BRIDGE(dev)) {
         /* Properties only for non-bridges */
         uint32_t min_grant = pci_default_read_config(dev, PCI_MIN_GNT, 1);
         uint32_t max_latency = pci_default_read_config(dev, PCI_MAX_LAT, 1);
@@ -1544,7 +1543,6 @@ static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
 {
     SpaprPhbState *phb = SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev = PCI_DEVICE(plugged_dev);
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(plugged_dev);
     SpaprDrc *drc = drc_from_dev(phb, pdev);
     PCIBus *bus = PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
     uint32_t slotnr = PCI_SLOT(pdev->devfn);
@@ -1560,7 +1558,7 @@ static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
         }
     }
 
-    if (pc->is_bridge) {
+    if (IS_PCI_BRIDGE(plugged_dev)) {
         if (!bridge_has_valid_chassis_nr(OBJECT(plugged_dev), errp)) {
             return;
         }
@@ -1589,7 +1587,6 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
 {
     SpaprPhbState *phb = SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev = PCI_DEVICE(plugged_dev);
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(plugged_dev);
     SpaprDrc *drc = drc_from_dev(phb, pdev);
     uint32_t slotnr = PCI_SLOT(pdev->devfn);
 
@@ -1603,7 +1600,7 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
 
     g_assert(drc);
 
-    if (pc->is_bridge) {
+    if (IS_PCI_BRIDGE(plugged_dev)) {
         spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
     }
 
@@ -1646,7 +1643,6 @@ static void spapr_pci_bridge_unplug(SpaprPhbState *phb,
 static void spapr_pci_unplug(HotplugHandler *plug_handler,
                              DeviceState *plugged_dev, Error **errp)
 {
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(plugged_dev);
     SpaprPhbState *phb = SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
 
     /* some version guests do not wait for completion of a device
@@ -1661,7 +1657,7 @@ static void spapr_pci_unplug(HotplugHandler *plug_handler,
      */
     pci_device_reset(PCI_DEVICE(plugged_dev));
 
-    if (pc->is_bridge) {
+    if (IS_PCI_BRIDGE(plugged_dev)) {
         spapr_pci_bridge_unplug(phb, PCI_BRIDGE(plugged_dev));
         return;
     }
@@ -1686,7 +1682,6 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
     g_assert(drc->dev == plugged_dev);
 
     if (!spapr_drc_unplug_requested(drc)) {
-        PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(plugged_dev);
         uint32_t slotnr = PCI_SLOT(pdev->devfn);
         SpaprDrc *func_drc;
         SpaprDrcClass *func_drck;
@@ -1694,7 +1689,7 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
         int i;
         uint8_t chassis = chassis_from_bus(pci_get_bus(pdev));
 
-        if (pc->is_bridge) {
+        if (IS_PCI_BRIDGE(plugged_dev)) {
             error_setg(errp, "PCI: Hot unplug of PCI bridges not supported");
             return;
         }
-- 
MST


