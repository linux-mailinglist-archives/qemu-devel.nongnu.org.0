Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7834CD63E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:22:05 +0100 (CET)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8om-00062p-49
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8B0-0003N4-8X
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Aw-00015e-8k
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fQd6WVFr9I1K2svJa1cXoPH2fq/JdR0GG570pqzR9U8=;
 b=ddShdPq6CyJX2X7n5ajQWh/t0Fajtt7H1JCyLF2LUAD5wMQ1lDjdhXIzYrZEalxJ35rWdP
 s7bBFSl4sC/NNugUhggGjms5hQCQHSt+Me7BV/lJo37jFOU3b1XTd4N2WG3SkPZnlzNDCg
 oZsAlqasgOhYizWGY0fwDigf3HHqDRk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-I1Xp7TnRNeuy46qKve50VA-1; Fri, 04 Mar 2022 08:40:52 -0500
X-MC-Unique: I1Xp7TnRNeuy46qKve50VA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n62-20020a1ca441000000b0038124c99ebcso2453911wme.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fQd6WVFr9I1K2svJa1cXoPH2fq/JdR0GG570pqzR9U8=;
 b=Pb2HGQ5s0RobYoR/7dmhDb1IO8u3RngaSKRN2Kv6gFTV61rG4zgZ8NCRXOTx1CzjDP
 dea6bk9Dpm3UFRu1qwCuueVDl832lMvd6kYJ2+j/5i4ebH8PqyOTTmcb+UrNFkBb27lA
 cLKFjwhI+0GnIvrVVqodH7KOnHy4Pvqm54m51Mg74QJgjGPQTDNhInEKbsUJxsx+cwf0
 rh0rjHCYbwBt6JlbyuUE6PDMAQqP3EvQb/JVv26WI1Bjk7Mv8BATvcxbnT2JRvB91lGX
 5C7F2UCc6h5E1jiAHjclRmw4bgt/ZvOsNlnFtU7x0uW6D+W2/xZkmKBmX49PyudYNnrZ
 TaPw==
X-Gm-Message-State: AOAM530kCXAHORZF7PePW4CXskccIOgHUvwq31HBoRxuXzL1poT7GKqn
 mDkg92w1jB506Yl3TwF3VAbtHPGu9DekPB49S0kVe8vI73DuIXgmq9O0k4xFki1Gz/vi03M7Qh/
 EM++FN/vAp/oS5PcPJycRFo4HPrK8Dqfv6KwZQeFMaKDI4lIYTKioYtL3nggG
X-Received: by 2002:a05:600c:22c9:b0:381:3b27:89be with SMTP id
 9-20020a05600c22c900b003813b2789bemr7745214wmg.83.1646401250166; 
 Fri, 04 Mar 2022 05:40:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykr4/fPy7e8bBdh3TJXMFel8b4/boHUrPOvrgTZkR/JSDkVJ1cgZdd2ZBEcJ8A1h5ZkLerTA==
X-Received: by 2002:a05:600c:22c9:b0:381:3b27:89be with SMTP id
 9-20020a05600c22c900b003813b2789bemr7745179wmg.83.1646401249577; 
 Fri, 04 Mar 2022 05:40:49 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b00386744cb31bsm6702670wmq.35.2022.03.04.05.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:46 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/45] pcie: Add support for Single Root I/O Virtualization
 (SR/IOV)
Message-ID: <20220304133556.233983-29-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Knut Omang <knut.omang@oracle.com>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Knut Omang <knut.omang@oracle.com>

This patch provides the building blocks for creating an SR/IOV
PCIe Extended Capability header and register/unregister
SR/IOV Virtual Functions.

Signed-off-by: Knut Omang <knuto@ifi.uio.no>
Message-Id: <20220217174504.1051716-2-lukasz.maniak@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h        |  12 +-
 include/hw/pci/pcie.h       |   6 +
 include/hw/pci/pcie_sriov.h |  71 +++++++++
 include/qemu/typedefs.h     |   2 +
 hw/pci/pci.c                | 100 +++++++++---
 hw/pci/pcie.c               |   5 +
 hw/pci/pcie_sriov.c         | 294 ++++++++++++++++++++++++++++++++++++
 hw/pci/meson.build          |   1 +
 hw/pci/trace-events         |   5 +
 9 files changed, 470 insertions(+), 26 deletions(-)
 create mode 100644 include/hw/pci/pcie_sriov.h
 create mode 100644 hw/pci/pcie_sriov.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c3f3c90473..3a32b8dd40 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -7,9 +7,6 @@
 /* PCI includes legacy ISA access.  */
 #include "hw/isa/isa.h"
 
-#include "hw/pci/pcie.h"
-#include "qom/object.h"
-
 extern bool pci_available;
 
 /* PCI bus */
@@ -157,6 +154,7 @@ enum {
 #define QEMU_PCI_VGA_IO_HI_SIZE 0x20
 
 #include "hw/pci/pci_regs.h"
+#include "hw/pci/pcie.h"
 
 /* PCI HEADER_TYPE */
 #define  PCI_HEADER_TYPE_MULTI_FUNCTION 0x80
@@ -499,6 +497,9 @@ typedef AddressSpace *(*PCIIOMMUFunc)(PCIBus *, void *, int);
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
 void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 
+pcibus_t pci_bar_address(PCIDevice *d,
+                         int reg, uint8_t type, pcibus_t size);
+
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
 {
@@ -779,6 +780,11 @@ static inline int pci_is_express_downstream_port(const PCIDevice *d)
     return type == PCI_EXP_TYPE_DOWNSTREAM || type == PCI_EXP_TYPE_ROOT_PORT;
 }
 
+static inline int pci_is_vf(const PCIDevice *d)
+{
+    return d->exp.sriov_vf.pf != NULL;
+}
+
 static inline uint32_t pci_config_size(const PCIDevice *d)
 {
     return pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE : PCI_CONFIG_SPACE_SIZE;
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 6063bee0ec..168950a83b 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -24,6 +24,7 @@
 #include "hw/pci/pci_regs.h"
 #include "hw/pci/pcie_regs.h"
 #include "hw/pci/pcie_aer.h"
+#include "hw/pci/pcie_sriov.h"
 #include "hw/hotplug.h"
 
 typedef enum {
@@ -81,6 +82,11 @@ struct PCIExpressDevice {
 
     /* ACS */
     uint16_t acs_cap;
+
+    /* SR/IOV */
+    uint16_t sriov_cap;
+    PCIESriovPF sriov_pf;
+    PCIESriovVF sriov_vf;
 };
 
 #define COMPAT_PROP_PCP "power_controller_present"
diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
new file mode 100644
index 0000000000..990cff0a1c
--- /dev/null
+++ b/include/hw/pci/pcie_sriov.h
@@ -0,0 +1,71 @@
+/*
+ * pcie_sriov.h:
+ *
+ * Implementation of SR/IOV emulation support.
+ *
+ * Copyright (c) 2015 Knut Omang <knut.omang@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_PCIE_SRIOV_H
+#define QEMU_PCIE_SRIOV_H
+
+struct PCIESriovPF {
+    uint16_t num_vfs;   /* Number of virtual functions created */
+    uint8_t vf_bar_type[PCI_NUM_REGIONS];   /* Store type for each VF bar */
+    const char *vfname; /* Reference to the device type used for the VFs */
+    PCIDevice **vf;     /* Pointer to an array of num_vfs VF devices */
+};
+
+struct PCIESriovVF {
+    PCIDevice *pf;      /* Pointer back to owner physical function */
+    uint16_t vf_number; /* Logical VF number of this function */
+};
+
+void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
+                        const char *vfname, uint16_t vf_dev_id,
+                        uint16_t init_vfs, uint16_t total_vfs,
+                        uint16_t vf_offset, uint16_t vf_stride);
+void pcie_sriov_pf_exit(PCIDevice *dev);
+
+/* Set up a VF bar in the SR/IOV bar area */
+void pcie_sriov_pf_init_vf_bar(PCIDevice *dev, int region_num,
+                               uint8_t type, dma_addr_t size);
+
+/* Instantiate a bar for a VF */
+void pcie_sriov_vf_register_bar(PCIDevice *dev, int region_num,
+                                MemoryRegion *memory);
+
+/*
+ * Default (minimal) page size support values
+ * as required by the SR/IOV standard:
+ * 0x553 << 12 = 0x553000 = 4K + 8K + 64K + 256K + 1M + 4M
+ */
+#define SRIOV_SUP_PGSIZE_MINREQ 0x553
+
+/*
+ * Optionally add supported page sizes to the mask of supported page sizes
+ * Page size values are interpreted as opt_sup_pgsize << 12.
+ */
+void pcie_sriov_pf_add_sup_pgsize(PCIDevice *dev, uint16_t opt_sup_pgsize);
+
+/* SR/IOV capability config write handler */
+void pcie_sriov_config_write(PCIDevice *dev, uint32_t address,
+                             uint32_t val, int len);
+
+/* Reset SR/IOV VF Enable bit to unregister all VFs */
+void pcie_sriov_pf_disable_vfs(PCIDevice *dev);
+
+/* Get logical VF number of a VF - only valid for VFs */
+uint16_t pcie_sriov_vf_number(PCIDevice *dev);
+
+/*
+ * Get the physical function that owns this VF.
+ * Returns NULL if dev is not a virtual function
+ */
+PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
+
+#endif /* QEMU_PCIE_SRIOV_H */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index ee60eb3de4..5b302cb214 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -86,6 +86,8 @@ typedef struct PCIDevice PCIDevice;
 typedef struct PCIEAERErr PCIEAERErr;
 typedef struct PCIEAERLog PCIEAERLog;
 typedef struct PCIEAERMsg PCIEAERMsg;
+typedef struct PCIESriovPF PCIESriovPF;
+typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIEPort PCIEPort;
 typedef struct PCIESlot PCIESlot;
 typedef struct PCIExpressDevice PCIExpressDevice;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5d30f9ca60..ba8fb92efc 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -239,6 +239,9 @@ int pci_bar(PCIDevice *d, int reg)
 {
     uint8_t type;
 
+    /* PCIe virtual functions do not have their own BARs */
+    assert(!pci_is_vf(d));
+
     if (reg != PCI_ROM_SLOT)
         return PCI_BASE_ADDRESS_0 + reg * 4;
 
@@ -304,10 +307,30 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
-static void pci_do_device_reset(PCIDevice *dev)
+static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
+    if (pci_is_vf(dev)) {
+        return;
+    }
 
+    for (r = 0; r < PCI_NUM_REGIONS; ++r) {
+        PCIIORegion *region = &dev->io_regions[r];
+        if (!region->size) {
+            continue;
+        }
+
+        if (!(region->type & PCI_BASE_ADDRESS_SPACE_IO) &&
+            region->type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
+            pci_set_quad(dev->config + pci_bar(dev, r), region->type);
+        } else {
+            pci_set_long(dev->config + pci_bar(dev, r), region->type);
+        }
+    }
+}
+
+static void pci_do_device_reset(PCIDevice *dev)
+{
     pci_device_deassert_intx(dev);
     assert(dev->irq_state == 0);
 
@@ -323,19 +346,7 @@ static void pci_do_device_reset(PCIDevice *dev)
                               pci_get_word(dev->wmask + PCI_INTERRUPT_LINE) |
                               pci_get_word(dev->w1cmask + PCI_INTERRUPT_LINE));
     dev->config[PCI_CACHE_LINE_SIZE] = 0x0;
-    for (r = 0; r < PCI_NUM_REGIONS; ++r) {
-        PCIIORegion *region = &dev->io_regions[r];
-        if (!region->size) {
-            continue;
-        }
-
-        if (!(region->type & PCI_BASE_ADDRESS_SPACE_IO) &&
-            region->type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
-            pci_set_quad(dev->config + pci_bar(dev, r), region->type);
-        } else {
-            pci_set_long(dev->config + pci_bar(dev, r), region->type);
-        }
-    }
+    pci_reset_regions(dev);
     pci_update_mappings(dev);
 
     msi_reset(dev);
@@ -884,6 +895,16 @@ static void pci_init_multifunction(PCIBus *bus, PCIDevice *dev, Error **errp)
         dev->config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
     }
 
+    /*
+     * With SR/IOV and ARI, a device at function 0 need not be a multifunction
+     * device, as it may just be a VF that ended up with function 0 in
+     * the legacy PCI interpretation. Avoid failing in such cases:
+     */
+    if (pci_is_vf(dev) &&
+        dev->exp.sriov_vf.pf->cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
+        return;
+    }
+
     /*
      * multifunction bit is interpreted in two ways as follows.
      *   - all functions must set the bit to 1.
@@ -1083,6 +1104,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                    bus->devices[devfn]->name);
         return NULL;
     } else if (dev->hotplugged &&
+               !pci_is_vf(pci_dev) &&
                pci_get_function_0(pci_dev)) {
         error_setg(errp, "PCI: slot %d function 0 already occupied by %s,"
                    " new func %s cannot be exposed to guest.",
@@ -1191,6 +1213,7 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
     pcibus_t size = memory_region_size(memory);
     uint8_t hdr_type;
 
+    assert(!pci_is_vf(pci_dev)); /* VFs must use pcie_sriov_vf_register_bar */
     assert(region_num >= 0);
     assert(region_num < PCI_NUM_REGIONS);
     assert(is_power_of_2(size));
@@ -1294,11 +1317,45 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num)
     return pci_dev->io_regions[region_num].addr;
 }
 
-static pcibus_t pci_bar_address(PCIDevice *d,
-                                int reg, uint8_t type, pcibus_t size)
+static pcibus_t pci_config_get_bar_addr(PCIDevice *d, int reg,
+                                        uint8_t type, pcibus_t size)
+{
+    pcibus_t new_addr;
+    if (!pci_is_vf(d)) {
+        int bar = pci_bar(d, reg);
+        if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
+            new_addr = pci_get_quad(d->config + bar);
+        } else {
+            new_addr = pci_get_long(d->config + bar);
+        }
+    } else {
+        PCIDevice *pf = d->exp.sriov_vf.pf;
+        uint16_t sriov_cap = pf->exp.sriov_cap;
+        int bar = sriov_cap + PCI_SRIOV_BAR + reg * 4;
+        uint16_t vf_offset =
+            pci_get_word(pf->config + sriov_cap + PCI_SRIOV_VF_OFFSET);
+        uint16_t vf_stride =
+            pci_get_word(pf->config + sriov_cap + PCI_SRIOV_VF_STRIDE);
+        uint32_t vf_num = (d->devfn - (pf->devfn + vf_offset)) / vf_stride;
+
+        if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
+            new_addr = pci_get_quad(pf->config + bar);
+        } else {
+            new_addr = pci_get_long(pf->config + bar);
+        }
+        new_addr += vf_num * size;
+    }
+    /* The ROM slot has a specific enable bit, keep it intact */
+    if (reg != PCI_ROM_SLOT) {
+        new_addr &= ~(size - 1);
+    }
+    return new_addr;
+}
+
+pcibus_t pci_bar_address(PCIDevice *d,
+                         int reg, uint8_t type, pcibus_t size)
 {
     pcibus_t new_addr, last_addr;
-    int bar = pci_bar(d, reg);
     uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
     Object *machine = qdev_get_machine();
     ObjectClass *oc = object_get_class(machine);
@@ -1309,7 +1366,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
         if (!(cmd & PCI_COMMAND_IO)) {
             return PCI_BAR_UNMAPPED;
         }
-        new_addr = pci_get_long(d->config + bar) & ~(size - 1);
+        new_addr = pci_config_get_bar_addr(d, reg, type, size);
         last_addr = new_addr + size - 1;
         /* Check if 32 bit BAR wraps around explicitly.
          * TODO: make priorities correct and remove this work around.
@@ -1324,11 +1381,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
     if (!(cmd & PCI_COMMAND_MEMORY)) {
         return PCI_BAR_UNMAPPED;
     }
-    if (type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
-        new_addr = pci_get_quad(d->config + bar);
-    } else {
-        new_addr = pci_get_long(d->config + bar);
-    }
+    new_addr = pci_config_get_bar_addr(d, reg, type, size);
     /* the ROM slot has a specific enable bit */
     if (reg == PCI_ROM_SLOT && !(new_addr & PCI_ROM_ADDRESS_ENABLE)) {
         return PCI_BAR_UNMAPPED;
@@ -1473,6 +1526,7 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
 
     msi_write_config(d, addr, val_in, l);
     msix_write_config(d, addr, val_in, l);
+    pcie_sriov_config_write(d, addr, val_in, l);
 }
 
 /***********************************************************/
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index d7d73a31e4..3c44204cf3 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -446,6 +446,11 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     PCIDevice *pci_dev = PCI_DEVICE(dev);
     uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
 
+    if (pci_is_vf(pci_dev)) {
+        /* Virtual function cannot be physically disconnected */
+        return;
+    }
+
     /* Don't send event when device is enabled during qemu machine creation:
      * it is present on boot, no hotplug event is necessary. We do send an
      * event when the device is disabled later. */
diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
new file mode 100644
index 0000000000..3f256d483f
--- /dev/null
+++ b/hw/pci/pcie_sriov.c
@@ -0,0 +1,294 @@
+/*
+ * pcie_sriov.c:
+ *
+ * Implementation of SR/IOV emulation support.
+ *
+ * Copyright (c) 2015-2017 Knut Omang <knut.omang@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/qdev-properties.h"
+#include "qemu/error-report.h"
+#include "qemu/range.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+static PCIDevice *register_vf(PCIDevice *pf, int devfn,
+                              const char *name, uint16_t vf_num);
+static void unregister_vfs(PCIDevice *dev);
+
+void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
+                        const char *vfname, uint16_t vf_dev_id,
+                        uint16_t init_vfs, uint16_t total_vfs,
+                        uint16_t vf_offset, uint16_t vf_stride)
+{
+    uint8_t *cfg = dev->config + offset;
+    uint8_t *wmask;
+
+    pcie_add_capability(dev, PCI_EXT_CAP_ID_SRIOV, 1,
+                        offset, PCI_EXT_CAP_SRIOV_SIZEOF);
+    dev->exp.sriov_cap = offset;
+    dev->exp.sriov_pf.num_vfs = 0;
+    dev->exp.sriov_pf.vfname = g_strdup(vfname);
+    dev->exp.sriov_pf.vf = NULL;
+
+    pci_set_word(cfg + PCI_SRIOV_VF_OFFSET, vf_offset);
+    pci_set_word(cfg + PCI_SRIOV_VF_STRIDE, vf_stride);
+
+    /*
+     * Mandatory page sizes to support.
+     * Device implementations can call pcie_sriov_pf_add_sup_pgsize()
+     * to set more bits:
+     */
+    pci_set_word(cfg + PCI_SRIOV_SUP_PGSIZE, SRIOV_SUP_PGSIZE_MINREQ);
+
+    /*
+     * Default is to use 4K pages, software can modify it
+     * to any of the supported bits
+     */
+    pci_set_word(cfg + PCI_SRIOV_SYS_PGSIZE, 0x1);
+
+    /* Set up device ID and initial/total number of VFs available */
+    pci_set_word(cfg + PCI_SRIOV_VF_DID, vf_dev_id);
+    pci_set_word(cfg + PCI_SRIOV_INITIAL_VF, init_vfs);
+    pci_set_word(cfg + PCI_SRIOV_TOTAL_VF, total_vfs);
+    pci_set_word(cfg + PCI_SRIOV_NUM_VF, 0);
+
+    /* Write enable control bits */
+    wmask = dev->wmask + offset;
+    pci_set_word(wmask + PCI_SRIOV_CTRL,
+                 PCI_SRIOV_CTRL_VFE | PCI_SRIOV_CTRL_MSE | PCI_SRIOV_CTRL_ARI);
+    pci_set_word(wmask + PCI_SRIOV_NUM_VF, 0xffff);
+    pci_set_word(wmask + PCI_SRIOV_SYS_PGSIZE, 0x553);
+
+    qdev_prop_set_bit(&dev->qdev, "multifunction", true);
+}
+
+void pcie_sriov_pf_exit(PCIDevice *dev)
+{
+    unregister_vfs(dev);
+    g_free((char *)dev->exp.sriov_pf.vfname);
+    dev->exp.sriov_pf.vfname = NULL;
+}
+
+void pcie_sriov_pf_init_vf_bar(PCIDevice *dev, int region_num,
+                               uint8_t type, dma_addr_t size)
+{
+    uint32_t addr;
+    uint64_t wmask;
+    uint16_t sriov_cap = dev->exp.sriov_cap;
+
+    assert(sriov_cap > 0);
+    assert(region_num >= 0);
+    assert(region_num < PCI_NUM_REGIONS);
+    assert(region_num != PCI_ROM_SLOT);
+
+    wmask = ~(size - 1);
+    addr = sriov_cap + PCI_SRIOV_BAR + region_num * 4;
+
+    pci_set_long(dev->config + addr, type);
+    if (!(type & PCI_BASE_ADDRESS_SPACE_IO) &&
+        type & PCI_BASE_ADDRESS_MEM_TYPE_64) {
+        pci_set_quad(dev->wmask + addr, wmask);
+        pci_set_quad(dev->cmask + addr, ~0ULL);
+    } else {
+        pci_set_long(dev->wmask + addr, wmask & 0xffffffff);
+        pci_set_long(dev->cmask + addr, 0xffffffff);
+    }
+    dev->exp.sriov_pf.vf_bar_type[region_num] = type;
+}
+
+void pcie_sriov_vf_register_bar(PCIDevice *dev, int region_num,
+                                MemoryRegion *memory)
+{
+    PCIIORegion *r;
+    PCIBus *bus = pci_get_bus(dev);
+    uint8_t type;
+    pcibus_t size = memory_region_size(memory);
+
+    assert(pci_is_vf(dev)); /* PFs must use pci_register_bar */
+    assert(region_num >= 0);
+    assert(region_num < PCI_NUM_REGIONS);
+    type = dev->exp.sriov_vf.pf->exp.sriov_pf.vf_bar_type[region_num];
+
+    if (!is_power_of_2(size)) {
+        error_report("%s: PCI region size must be a power"
+                     " of two - type=0x%x, size=0x%"FMT_PCIBUS,
+                     __func__, type, size);
+        exit(1);
+    }
+
+    r = &dev->io_regions[region_num];
+    r->memory = memory;
+    r->address_space =
+        type & PCI_BASE_ADDRESS_SPACE_IO
+        ? bus->address_space_io
+        : bus->address_space_mem;
+    r->size = size;
+    r->type = type;
+
+    r->addr = pci_bar_address(dev, region_num, r->type, r->size);
+    if (r->addr != PCI_BAR_UNMAPPED) {
+        memory_region_add_subregion_overlap(r->address_space,
+                                            r->addr, r->memory, 1);
+    }
+}
+
+static PCIDevice *register_vf(PCIDevice *pf, int devfn, const char *name,
+                              uint16_t vf_num)
+{
+    PCIDevice *dev = pci_new(devfn, name);
+    dev->exp.sriov_vf.pf = pf;
+    dev->exp.sriov_vf.vf_number = vf_num;
+    PCIBus *bus = pci_get_bus(pf);
+    Error *local_err = NULL;
+
+    qdev_realize(&dev->qdev, &bus->qbus, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return NULL;
+    }
+
+    /* set vid/did according to sr/iov spec - they are not used */
+    pci_config_set_vendor_id(dev->config, 0xffff);
+    pci_config_set_device_id(dev->config, 0xffff);
+
+    return dev;
+}
+
+static void register_vfs(PCIDevice *dev)
+{
+    uint16_t num_vfs;
+    uint16_t i;
+    uint16_t sriov_cap = dev->exp.sriov_cap;
+    uint16_t vf_offset =
+        pci_get_word(dev->config + sriov_cap + PCI_SRIOV_VF_OFFSET);
+    uint16_t vf_stride =
+        pci_get_word(dev->config + sriov_cap + PCI_SRIOV_VF_STRIDE);
+    int32_t devfn = dev->devfn + vf_offset;
+
+    assert(sriov_cap > 0);
+    num_vfs = pci_get_word(dev->config + sriov_cap + PCI_SRIOV_NUM_VF);
+
+    dev->exp.sriov_pf.vf = g_malloc(sizeof(PCIDevice *) * num_vfs);
+    assert(dev->exp.sriov_pf.vf);
+
+    trace_sriov_register_vfs(dev->name, PCI_SLOT(dev->devfn),
+                             PCI_FUNC(dev->devfn), num_vfs);
+    for (i = 0; i < num_vfs; i++) {
+        dev->exp.sriov_pf.vf[i] = register_vf(dev, devfn,
+                                              dev->exp.sriov_pf.vfname, i);
+        if (!dev->exp.sriov_pf.vf[i]) {
+            num_vfs = i;
+            break;
+        }
+        devfn += vf_stride;
+    }
+    dev->exp.sriov_pf.num_vfs = num_vfs;
+}
+
+static void unregister_vfs(PCIDevice *dev)
+{
+    Error *local_err = NULL;
+    uint16_t num_vfs = dev->exp.sriov_pf.num_vfs;
+    uint16_t i;
+
+    trace_sriov_unregister_vfs(dev->name, PCI_SLOT(dev->devfn),
+                               PCI_FUNC(dev->devfn), num_vfs);
+    for (i = 0; i < num_vfs; i++) {
+        PCIDevice *vf = dev->exp.sriov_pf.vf[i];
+        object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
+        if (local_err) {
+            fprintf(stderr, "Failed to unplug: %s\n",
+                    error_get_pretty(local_err));
+            error_free(local_err);
+        }
+        object_unparent(OBJECT(vf));
+    }
+    g_free(dev->exp.sriov_pf.vf);
+    dev->exp.sriov_pf.vf = NULL;
+    dev->exp.sriov_pf.num_vfs = 0;
+    pci_set_word(dev->config + dev->exp.sriov_cap + PCI_SRIOV_NUM_VF, 0);
+}
+
+void pcie_sriov_config_write(PCIDevice *dev, uint32_t address,
+                             uint32_t val, int len)
+{
+    uint32_t off;
+    uint16_t sriov_cap = dev->exp.sriov_cap;
+
+    if (!sriov_cap || address < sriov_cap) {
+        return;
+    }
+    off = address - sriov_cap;
+    if (off >= PCI_EXT_CAP_SRIOV_SIZEOF) {
+        return;
+    }
+
+    trace_sriov_config_write(dev->name, PCI_SLOT(dev->devfn),
+                             PCI_FUNC(dev->devfn), off, val, len);
+
+    if (range_covers_byte(off, len, PCI_SRIOV_CTRL)) {
+        if (dev->exp.sriov_pf.num_vfs) {
+            if (!(val & PCI_SRIOV_CTRL_VFE)) {
+                unregister_vfs(dev);
+            }
+        } else {
+            if (val & PCI_SRIOV_CTRL_VFE) {
+                register_vfs(dev);
+            }
+        }
+    }
+}
+
+
+/* Reset SR/IOV VF Enable bit to trigger an unregister of all VFs */
+void pcie_sriov_pf_disable_vfs(PCIDevice *dev)
+{
+    uint16_t sriov_cap = dev->exp.sriov_cap;
+    if (sriov_cap) {
+        uint32_t val = pci_get_byte(dev->config + sriov_cap + PCI_SRIOV_CTRL);
+        if (val & PCI_SRIOV_CTRL_VFE) {
+            val &= ~PCI_SRIOV_CTRL_VFE;
+            pcie_sriov_config_write(dev, sriov_cap + PCI_SRIOV_CTRL, val, 1);
+        }
+    }
+}
+
+/* Add optional supported page sizes to the mask of supported page sizes */
+void pcie_sriov_pf_add_sup_pgsize(PCIDevice *dev, uint16_t opt_sup_pgsize)
+{
+    uint8_t *cfg = dev->config + dev->exp.sriov_cap;
+    uint8_t *wmask = dev->wmask + dev->exp.sriov_cap;
+
+    uint16_t sup_pgsize = pci_get_word(cfg + PCI_SRIOV_SUP_PGSIZE);
+
+    sup_pgsize |= opt_sup_pgsize;
+
+    /*
+     * Make sure the new bits are set, and that system page size
+     * also can be set to any of the new values according to spec:
+     */
+    pci_set_word(cfg + PCI_SRIOV_SUP_PGSIZE, sup_pgsize);
+    pci_set_word(wmask + PCI_SRIOV_SYS_PGSIZE, sup_pgsize);
+}
+
+
+uint16_t pcie_sriov_vf_number(PCIDevice *dev)
+{
+    assert(pci_is_vf(dev));
+    return dev->exp.sriov_vf.vf_number;
+}
+
+
+PCIDevice *pcie_sriov_get_pf(PCIDevice *dev)
+{
+    return dev->exp.sriov_vf.pf;
+}
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 5c4bbac817..bcc9c75919 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -5,6 +5,7 @@ pci_ss.add(files(
   'pci.c',
   'pci_bridge.c',
   'pci_host.c',
+  'pcie_sriov.c',
   'shpc.c',
   'slotid_cap.c'
 ))
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index 7570752c40..aaf46bc92d 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -10,3 +10,8 @@ pci_cfg_write(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsig
 
 # msix.c
 msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d masked %d"
+
+# hw/pci/pcie_sriov.c
+sriov_register_vfs(const char *name, int slot, int function, int num_vfs) "%s %02x:%x: creating %d vf devs"
+sriov_unregister_vfs(const char *name, int slot, int function, int num_vfs) "%s %02x:%x: Unregistering %d vf devs"
+sriov_config_write(const char *name, int slot, int fun, uint32_t offset, uint32_t val, uint32_t len) "%s %02x:%x: sriov offset 0x%x val 0x%x len %d"
-- 
MST


