Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E484843DA77
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:39:41 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxCX-0005Xb-2G
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx5H-0004Xg-9R
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx5F-0000UB-Dp
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07LHrb6kZNzZ4/fu3Eq9r55HxFAxKolf5VDQaKGM4hU=;
 b=KJn7NR0TrZC+YJSxkbBSAM0DRiFUopWeeuEi59DmOprQtP6ZnpCjI8AhZw8o+SeK4v/3FN
 V6BaGLwG6fDnm2HhEEHjOGttLhLC9a/fixZe5jHh7TOYXgthaIxt23vOl7H0vz4qvARhwW
 Vrlm1J9Ln2ew4RVdzwuz14w6l7Moq3I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-D4MxLVtRPoiAeyswa8_qNA-1; Thu, 28 Oct 2021 00:32:07 -0400
X-MC-Unique: D4MxLVtRPoiAeyswa8_qNA-1
Received: by mail-pj1-f71.google.com with SMTP id
 r13-20020a17090a1bcd00b001a1b1747cd2so2807077pjr.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07LHrb6kZNzZ4/fu3Eq9r55HxFAxKolf5VDQaKGM4hU=;
 b=GNQ0H/umB079U/EI89Ips029yqcu9vY9SiN3ul5F+qGqMNrl+/66/6TT0aIdcu9TmR
 Qq/YupuGqXExchVmiYYt9UincWCoJkDfOWWVxZnF41TevD5bLk+n9G2P3RD2Pa9sS6vb
 RBVwCMRlJzMow8Pm48+d25Z7wil7HH49zWuiEUOvcuUMTe/WEKAJk8dPvPenh/RCA8tR
 g93xgE0TzJlZl6nPC1zHIydb+Cn6oHbHt6DK8YltEVGKVEqSDsNUMA2jC3NMsXNYG9Tq
 btywB97MA/Oe7K27+M0yQzjW0zg2LD6JOBLcOXK2EAhUdH1uImmbxhnUyA+5tKCdvUXE
 Gwjg==
X-Gm-Message-State: AOAM533qrHg8vWLuT3LDzuTtBhLM1ktkGIByLbxD4whiLR4+Jn2QsLE7
 H4D9Dbh7wrbRCbo284sXi9/lm/S0rSONBDpzgP9Omc7ufVrUei8M1rM8oNaYIk9U3N49RJexc/U
 iYDe0uCWz0XIInXiTtVWJhQOu1bTHaupRi9+oPeYpS5vmX8nh5CFNpeD0/L1cnU4b
X-Received: by 2002:a05:6a00:2ab:b0:47b:ee2c:62fb with SMTP id
 q11-20020a056a0002ab00b0047bee2c62fbmr1953569pfs.82.1635395526183; 
 Wed, 27 Oct 2021 21:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg1Wr3goSq54D+NmwpIw1kzEVekW2zuwTplXT2875a32II6O+BqTyp1pIeEBEoU60E6nSSMg==
X-Received: by 2002:a05:6a00:2ab:b0:47b:ee2c:62fb with SMTP id
 q11-20020a056a0002ab00b0047bee2c62fbmr1953523pfs.82.1635395525669; 
 Wed, 27 Oct 2021 21:32:05 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id k22sm1483074pfi.149.2021.10.27.21.32.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:32:05 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] pci: Add pci_for_each_root_bus()
Date: Thu, 28 Oct 2021 12:31:28 +0800
Message-Id: <20211028043129.38871-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028043129.38871-1-peterx@redhat.com>
References: <20211028043129.38871-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper to loop over each root bus of the system, either the default root
bus or extended buses like pxb-pcie.

There're three places that can be rewritten with the pci_for_each_root_bus()
helper that we just introduced.  De-dup the code.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/virt-acpi-build.c | 31 +++++++++++--------------------
 hw/i386/acpi-build.c     | 38 ++++++++++----------------------------
 hw/pci/pci.c             | 26 ++++++++++++++++++++++++++
 include/hw/pci/pci.h     |  2 ++
 4 files changed, 49 insertions(+), 48 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f902652..adba51f35a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -264,28 +264,20 @@ struct AcpiIortIdMapping {
 typedef struct AcpiIortIdMapping AcpiIortIdMapping;
 
 /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
-static int
-iort_host_bridges(Object *obj, void *opaque)
+static void
+iort_host_bridges(PCIBus *bus, void *opaque)
 {
-    GArray *idmap_blob = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
-        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
-
-        if (bus && !pci_bus_bypass_iommu(bus)) {
-            int min_bus, max_bus;
+    if (!pci_bus_bypass_iommu(bus)) {
+        int min_bus, max_bus;
 
-            pci_bus_range(bus, &min_bus, &max_bus);
+        pci_bus_range(bus, &min_bus, &max_bus);
 
-            AcpiIortIdMapping idmap = {
-                .input_base = min_bus << 8,
-                .id_count = (max_bus - min_bus + 1) << 8,
-            };
-            g_array_append_val(idmap_blob, idmap);
-        }
+        AcpiIortIdMapping idmap = {
+            .input_base = min_bus << 8,
+            .id_count = (max_bus - min_bus + 1) << 8,
+        };
+        g_array_append_val((GArray *)opaque, idmap);
     }
-
-    return 0;
 }
 
 static int iort_idmap_compare(gconstpointer a, gconstpointer b)
@@ -320,8 +312,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping next_range = {0};
 
-        object_child_foreach_recursive(object_get_root(),
-                                       iort_host_bridges, smmu_idmaps);
+        pci_for_each_root_bus(iort_host_bridges, smmu_idmaps);
 
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a76b17ed92..3e50acfe35 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2123,20 +2123,12 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
 }
 
 /* For a given PCI host bridge, walk and insert DMAR scope */
-static int
-dmar_host_bridges(Object *obj, void *opaque)
+static void
+dmar_host_bridges(PCIBus *bus, void *opaque)
 {
-    GArray *scope_blob = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
-        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
-
-        if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
-        }
+    if (!pci_bus_bypass_iommu(bus)) {
+        pci_for_each_device_under_bus(bus, insert_scope, opaque);
     }
-
-    return 0;
 }
 
 /*
@@ -2165,8 +2157,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
      * Insert scope for each PCI bridge and endpoint device which
      * is attached to a bus with iommu enabled.
      */
-    object_child_foreach_recursive(object_get_root(),
-                                   dmar_host_bridges, scope_blob);
+    pci_for_each_root_bus(dmar_host_bridges, scope_blob);
 
     assert(iommu);
     if (x86_iommu_ir_supported(iommu)) {
@@ -2329,20 +2320,12 @@ insert_ivhd(PCIBus *bus, PCIDevice *dev, void *opaque)
 }
 
 /* For all PCI host bridges, walk and insert IVHD entries */
-static int
-ivrs_host_bridges(Object *obj, void *opaque)
+static void
+ivrs_host_bridges(PCIBus *bus, void *opaque)
 {
-    GArray *ivhd_blob = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
-        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
-
-        if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
-        }
+    if (!pci_bus_bypass_iommu(bus)) {
+        pci_for_each_device_under_bus(bus, insert_ivhd, opaque);
     }
-
-    return 0;
 }
 
 static void
@@ -2380,8 +2363,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
      * blob further below.  Fall back to an entry covering all devices, which
      * is sufficient when no aliases are present.
      */
-    object_child_foreach_recursive(object_get_root(),
-                                   ivrs_host_bridges, ivhd_blob);
+    pci_for_each_root_bus(ivrs_host_bridges, ivhd_blob);
 
     if (!ivhd_blob->len) {
         /*
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a84e478ce..258290f4eb 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2097,6 +2097,32 @@ void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
     }
 }
 
+typedef struct {
+    pci_bus_fn fn;
+    void *opaque;
+} PCIRootBusArgs;
+
+static int pci_find_root_bus(Object *obj, void *opaque)
+{
+    PCIRootBusArgs *args = opaque;
+    PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+    if (bus) {
+        args->fn(bus, args->opaque);
+    }
+
+    return 0;
+}
+
+void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
+{
+    PCIRootBusArgs args = { .fn = fn, .opaque = opaque };
+
+    object_child_foreach_recursive_type(object_get_root(),
+                                        TYPE_PCI_HOST_BRIDGE,
+                                        pci_find_root_bus,
+                                        &args);
+}
 
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
 {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5c4016b995..6813f128e0 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -474,6 +474,8 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
                                            void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
+/* Call `fn' for each pci root bus on the system */
+void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
 
 /* Use this wrapper when specific scan order is not required. */
-- 
2.32.0


