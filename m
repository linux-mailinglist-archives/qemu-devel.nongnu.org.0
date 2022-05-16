Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786EE528305
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:20:05 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYlg-0001kM-Cw
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5n-0006RK-2y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5k-0005JE-Cc
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpQuvyJLH+nQ64Jd2wTqiT7NLVxMdxuRmwjxSAFXTe0=;
 b=HruLHksH0XhRKVUS0ufm8XX1mpLsNlGmpBdPoF7iSlMZDqqbHj0GcUrwV699eoYbGCZM1B
 7atOqLUdIjYmlRw8RcC48TdYaDulpqbVbzsADnHgfXkqyG7eu3gKxSare7fWbjNWWiFGiH
 OKv3PRXdoXUMzADZT4z1LWzoOOnwov8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-DoCXZahyPBycEiMyCAFlxg-1; Mon, 16 May 2022 06:36:35 -0400
X-MC-Unique: DoCXZahyPBycEiMyCAFlxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6565600wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UpQuvyJLH+nQ64Jd2wTqiT7NLVxMdxuRmwjxSAFXTe0=;
 b=Ld2vEhXuvcWJDOkCmWYAvnjSU/k6N8TSzaHj4JifeqCqeaVeAH21uFj0Sfa1vAGghN
 g79tMuoqQTmRq4MyWb+w2Le9hpY9oTNiEGT6epO6X/7ZVO99OdxxRhozw8sGlagw0pAy
 7Js9NIClfju/OqIB3U/os0SNMWPYh0W/ncqOC8nNYzoxIGYgo7z25FdC81SUj7V2DrWb
 YlsDInfmTKY/BngLoAkqvS5F+xRbUVX/CX2UWCrFVPVFt7UC3Ph7bdwFU7tJOkSu59Gv
 hcX36NAr8tGP9iA7ITQnvy/vUSDpHNCNwmeKLSqU4AheDccX6F6HszSdRjU3vTZGbTDu
 xing==
X-Gm-Message-State: AOAM531tpf0s3YVVwD9mJ/8ArVLqStRks3IhYPdxUpHcnd177j/c9nmU
 Hz0KWF8EPRaQxXxBZiKj3h40Mc7KOh/et1pOkuuNiu3xzeXx98aO/orkxx090oNkszgNApqbvde
 v9nM4rZNSoaapgKcI1YLlXv1nDSyIMpGYEjazhx0S1B4s9W5x4q2MPw+qbzWm
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr16075283wms.137.1652697393694; 
 Mon, 16 May 2022 03:36:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy98uGfaUx38RhKJoVleVMRiF4YUkabFjnykJoLBeUktqj3I7bWlZYyhMvBodYr5HX5ytSlSQ==
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr16075258wms.137.1652697393311; 
 Mon, 16 May 2022 03:36:33 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c225500b00395b809dfd3sm10383747wmm.12.2022.05.16.03.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:32 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 "Jonathan . Cameron" <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 16/91] hw/pxb: Allow creation of a CXL PXB (host bridge)
Message-ID: <20220516095448.507876-17-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Ben Widawsky <ben.widawsky@intel.com>

This works like adding a typical pxb device, except the name is
'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
follows:
  -device pxb-cxl,id=cxl.0,bus="pcie.0",bus_nr=1

A CXL PXB is backward compatible with PCIe. What this means in practice
is that an operating system that is unaware of CXL should still be able
to enumerate this topology as if it were PCIe.

One can create multiple CXL PXB host bridges, but a host bridge can only
be connected to the main root bus. Host bridges cannot appear elsewhere
in the topology.

Note that as of this patch, the ACPI tables needed for the host bridge
(specifically, an ACPI object in _SB named ACPI0016 and the CEDT) aren't
created. So while this patch internally creates it, it cannot be
properly used by an operating system or other system software.

Also necessary is to add an exception to scripts/device-crash-test
similar to that for exiting pxb as both must created on a PCIexpress
host bus.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan.Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-15-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h                |  6 ++
 hw/pci-bridge/pci_expander_bridge.c | 86 ++++++++++++++++++++++++++++-
 hw/pci/pci.c                        |  7 +++
 scripts/device-crash-test           |  1 +
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 98f0d1b844..44dacfa224 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -408,6 +408,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 #define TYPE_PCI_BUS "PCI"
 OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
+#define TYPE_CXL_BUS "CXL"
 
 typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
 typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
@@ -770,6 +771,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
     pci_irq_deassert(pci_dev);
 }
 
+static inline int pci_is_cxl(const PCIDevice *d)
+{
+    return d->cap_present & QEMU_PCIE_CAP_CXL;
+}
+
 static inline int pci_is_express(const PCIDevice *d)
 {
     return d->cap_present & QEMU_PCI_CAP_EXPRESS;
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index a6caa1e7b5..f762eb4a6e 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -17,6 +17,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_bridge.h"
+#include "hw/cxl/cxl.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
@@ -56,6 +57,16 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
                          TYPE_PXB_PCIE_DEVICE)
 
+#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
+                         TYPE_PXB_CXL_DEVICE)
+
+typedef struct CXLHost {
+    PCIHostState parent_obj;
+
+    CXLComponentState cxl_cstate;
+} CXLHost;
+
 struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
@@ -68,6 +79,11 @@ struct PXBDev {
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
 {
+    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
+        return PXB_CXL_DEV(dev);
+    }
+
     return pci_bus_is_express(pci_get_bus(dev))
         ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
 }
@@ -112,11 +128,20 @@ static const TypeInfo pxb_pcie_bus_info = {
     .class_init    = pxb_bus_class_init,
 };
 
+static const TypeInfo pxb_cxl_bus_info = {
+    .name          = TYPE_PXB_CXL_BUS,
+    .parent        = TYPE_CXL_BUS,
+    .instance_size = sizeof(PXBBus),
+    .class_init    = pxb_bus_class_init,
+};
+
 static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
                                           PCIBus *rootbus)
 {
-    PXBBus *bus = pci_bus_is_express(rootbus) ?
-                  PXB_PCIE_BUS(rootbus) : PXB_BUS(rootbus);
+    PXBBus *bus = pci_bus_is_cxl(rootbus) ?
+                      PXB_CXL_BUS(rootbus) :
+                      pci_bus_is_express(rootbus) ? PXB_PCIE_BUS(rootbus) :
+                                                    PXB_BUS(rootbus);
 
     snprintf(bus->bus_path, 8, "0000:%02x", pxb_bus_num(rootbus));
     return bus->bus_path;
@@ -218,6 +243,10 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
     return pin - PCI_SLOT(pxb->devfn);
 }
 
+static void pxb_dev_reset(DeviceState *dev)
+{
+}
+
 static gint pxb_compare(gconstpointer a, gconstpointer b)
 {
     const PXBDev *pxb_a = a, *pxb_b = b;
@@ -389,13 +418,66 @@ static const TypeInfo pxb_pcie_dev_info = {
     },
 };
 
+static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /* A CXL PXB's parent bus is still PCIe */
+    if (!pci_bus_is_express(pci_get_bus(dev))) {
+        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
+        return;
+    }
+    if (!ms->cxl_devices_state->is_enabled) {
+        error_setg(errp, "Machine does not have cxl=on");
+        return;
+    }
+
+    pxb_dev_realize_common(dev, CXL, errp);
+    pxb_dev_reset(DEVICE(dev));
+}
+
+static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc   = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize             = pxb_cxl_dev_realize;
+    k->exit                = pxb_dev_exitfn;
+    /*
+     * XXX: These types of bridges don't actually show up in the hierarchy so
+     * vendor, device, class, etc. ids are intentionally left out.
+     */
+
+    dc->desc = "CXL Host Bridge";
+    device_class_set_props(dc, pxb_dev_properties);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+
+    /* Host bridges aren't hotpluggable. FIXME: spec reference */
+    dc->hotpluggable = false;
+    dc->reset = pxb_dev_reset;
+}
+
+static const TypeInfo pxb_cxl_dev_info = {
+    .name          = TYPE_PXB_CXL_DEVICE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PXBDev),
+    .class_init    = pxb_cxl_dev_class_init,
+    .interfaces =
+        (InterfaceInfo[]){
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            {},
+        },
+};
+
 static void pxb_register_types(void)
 {
     type_register_static(&pxb_bus_info);
     type_register_static(&pxb_pcie_bus_info);
+    type_register_static(&pxb_cxl_bus_info);
     type_register_static(&pxb_host_info);
     type_register_static(&pxb_dev_info);
     type_register_static(&pxb_pcie_dev_info);
+    type_register_static(&pxb_cxl_dev_info);
 }
 
 type_init(pxb_register_types)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index eb884adef9..6c0656f604 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -228,6 +228,12 @@ static const TypeInfo pcie_bus_info = {
     .class_init = pcie_bus_class_init,
 };
 
+static const TypeInfo cxl_bus_info = {
+    .name       = TYPE_CXL_BUS,
+    .parent     = TYPE_PCIE_BUS,
+    .class_init = pcie_bus_class_init,
+};
+
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
 static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
@@ -2946,6 +2952,7 @@ static void pci_register_types(void)
 {
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
+    type_register_static(&cxl_bus_info);
     type_register_static(&conventional_pci_interface_info);
     type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 4bfc68c008..a203b3fdea 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -93,6 +93,7 @@ ERROR_RULE_LIST = [
     {'device':'pci-bridge', 'expected':True},              # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
     {'device':'pci-bridge-seat', 'expected':True},         # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
     {'device':'pxb', 'expected':True},                     # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
+    {'device':'pxb-cxl', 'expected':True},                 # pxb-cxl devices cannot reside on a PCI bus.
     {'device':'scsi-block', 'expected':True},              # drive property not set
     {'device':'scsi-generic', 'expected':True},            # drive property not set
     {'device':'scsi-hd', 'expected':True},                 # drive property not set
-- 
MST


