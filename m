Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366143DA6D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:34:21 +0200 (CEST)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfx7M-0006Ec-3O
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx55-00047P-T1
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx54-0000TJ-0C
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8lDU7FEmiXvrdQWCCVGE+omVdmuTswIs2+DgDzt7Rc=;
 b=F/Gkbhoco4UjmleJhZHURI9fPwP3OQfdX6Q4iJ28KE6cUGZgCbGM6WG/3gAEhMulj9YFPm
 cY3oXXt3UmOQgqFAsGu2AHNAYfNclnBExGoE2kx2v8jG0mVE+VciO49svYqH+uH6qNE31U
 rZxvn8YKY8EMLhx7VFECn4mACkvflX8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-jqJvFVp6MXu585TT4_-Diw-1; Thu, 28 Oct 2021 00:31:56 -0400
X-MC-Unique: jqJvFVp6MXu585TT4_-Diw-1
Received: by mail-pj1-f69.google.com with SMTP id
 y22-20020a17090a6c9600b001a38db472c0so2522911pjj.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8lDU7FEmiXvrdQWCCVGE+omVdmuTswIs2+DgDzt7Rc=;
 b=sgr5OY1ZONP/vQo8wF/dX0GXzg8epwUrlwmUlLcMAOr0pyDn2QMRa6ZaB1O7ZYcNB3
 V0835aW2PM6kVW1ExiLHtvpkyolSCQ+6/36qwz9t6MZInhOVivpPj0x0qWFcQGqCJlGj
 p1PV1rY7qmpeFxvKG9ynkuAoc1pCZ5e1ijEHkW3uML7i0UkuUR+ZXT6vHAz1nEDA2sP1
 Y2SA3bXwT4NCQS0xCYPQ6gXsvTDP5i/oRbWDNi6DJmd5o6c/HY6JkLW5sdXduvFjOlZn
 wutTprqRnfKmnwHh8zqZL60AZa+AOxNnbjnj6ZlQzrgBJY8gnVlrLe043IoMI2YVN4kR
 /H4w==
X-Gm-Message-State: AOAM53090Z8k3fNPELl14Aon4/0ilWh/FOm7HKQJVBjATWpsi1VC1Mgo
 kbpq1szXUXZyMAR+3WDMbJd/5edl1q6Cy5C25vnCYNPHgwBgXVB4SDH3kMeuLj7lhJbyPOLSXlM
 Py0oy35UzCAAiOwYvv0q2eAq7fr2sgyIpif9xXPzSp/ndr7AnnLeMpFPU2FPs03IM
X-Received: by 2002:aa7:8111:0:b0:47b:e311:cdae with SMTP id
 b17-20020aa78111000000b0047be311cdaemr1768656pfi.71.1635395514725; 
 Wed, 27 Oct 2021 21:31:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzoZgeokAYahQc2nDjtEblSwziyI4PDuav4FpOHqbeBBic085ptrU93G/JiKkaQj9M7x4NDA==
X-Received: by 2002:aa7:8111:0:b0:47b:e311:cdae with SMTP id
 b17-20020aa78111000000b0047be311cdaemr1768611pfi.71.1635395514280; 
 Wed, 27 Oct 2021 21:31:54 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id k22sm1483074pfi.149.2021.10.27.21.31.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:31:53 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] pci: Export pci_for_each_device_under_bus*()
Date: Thu, 28 Oct 2021 12:31:26 +0800
Message-Id: <20211028043129.38871-3-peterx@redhat.com>
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

They're actually more commonly used than the helper without _under_bus, because
most callers do have the pci bus on hand.  After exporting we can switch a lot
of the call sites to use these two helpers.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/acpi-build.c       |  5 ++---
 hw/pci/pci.c               | 10 +++++-----
 hw/pci/pcie.c              |  4 +---
 hw/ppc/spapr_pci.c         | 12 +++++-------
 hw/ppc/spapr_pci_nvlink2.c |  7 +++----
 hw/ppc/spapr_pci_vfio.c    |  4 ++--
 hw/s390x/s390-pci-bus.c    |  5 ++---
 hw/xen/xen_pt.c            |  4 ++--
 include/hw/pci/pci.h       |  5 +++++
 9 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 81418b7911..a76b17ed92 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2132,8 +2132,7 @@ dmar_host_bridges(Object *obj, void *opaque)
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
         if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
-                                scope_blob);
+            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
         }
     }
 
@@ -2339,7 +2338,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
         if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
+            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
         }
     }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 17e59cb3a3..4a84e478ce 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1654,9 +1654,9 @@ static const pci_class_desc pci_class_descriptions[] =
     { 0, NULL}
 };
 
-static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
-                                                  pci_bus_dev_fn fn,
-                                                  void *opaque)
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque)
 {
     PCIDevice *d;
     int devfn;
@@ -1679,8 +1679,8 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
     }
 }
 
-static void pci_for_each_device_under_bus(PCIBus *bus,
-                                          pci_bus_dev_fn fn, void *opaque)
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque)
 {
     PCIDevice *d;
     int devfn;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 6e95d82903..914a9bf3d1 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -694,9 +694,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
         PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                            pcie_unplug_device, NULL);
-
+        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
         pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
                                      PCI_EXP_SLTSTA_PDS);
         if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd6314..5bfd4aa9e5 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1317,8 +1317,7 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
                           RESOURCE_CELLS_SIZE));
 
     assert(bus);
-    pci_for_each_device_reverse(bus, pci_bus_num(bus),
-                                spapr_dt_pci_device_cb, &cbinfo);
+    pci_for_each_device_under_bus_reverse(bus, spapr_dt_pci_device_cb, &cbinfo);
     if (cbinfo.err) {
         return cbinfo.err;
     }
@@ -2306,8 +2305,8 @@ static void spapr_phb_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
         return;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        spapr_phb_pci_enumerate_bridge, bus_no);
+    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_enumerate_bridge,
+                                  bus_no);
     pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, *bus_no, 1);
 }
 
@@ -2316,9 +2315,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *phb)
     PCIBus *bus = PCI_HOST_BRIDGE(phb)->bus;
     unsigned int bus_no = 0;
 
-    pci_for_each_device(bus, pci_bus_num(bus),
-                        spapr_phb_pci_enumerate_bridge,
-                        &bus_no);
+    pci_for_each_device_under_bus(bus, spapr_phb_pci_enumerate_bridge,
+                                  &bus_no);
 
 }
 
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 8ef9b40a18..7fb0cf4d04 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -164,8 +164,7 @@ static void spapr_phb_pci_collect_nvgpu(PCIBus *bus, PCIDevice *pdev,
         return;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        spapr_phb_pci_collect_nvgpu, opaque);
+    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_collect_nvgpu, opaque);
 }
 
 void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
@@ -183,8 +182,8 @@ void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
     sphb->nvgpus->nv2_atsd_current = sphb->nv2_atsd_win_addr;
 
     bus = PCI_HOST_BRIDGE(sphb)->bus;
-    pci_for_each_device(bus, pci_bus_num(bus),
-                        spapr_phb_pci_collect_nvgpu, sphb->nvgpus);
+    pci_for_each_device_under_bus(bus, spapr_phb_pci_collect_nvgpu,
+                                  sphb->nvgpus);
 
     if (sphb->nvgpus->err) {
         error_propagate(errp, sphb->nvgpus->err);
diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index f3b37df8ea..2a76b4e0b5 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -164,8 +164,8 @@ static void spapr_phb_vfio_eeh_clear_dev_msix(PCIBus *bus,
 
 static void spapr_phb_vfio_eeh_clear_bus_msix(PCIBus *bus, void *opaque)
 {
-       pci_for_each_device(bus, pci_bus_num(bus),
-                           spapr_phb_vfio_eeh_clear_dev_msix, NULL);
+       pci_for_each_device_under_bus(bus, spapr_phb_vfio_eeh_clear_dev_msix,
+                                     NULL);
 }
 
 static void spapr_phb_vfio_eeh_pre_reset(SpaprPhbState *sphb)
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 6fafffb029..1b51a72838 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1163,8 +1163,7 @@ static void s390_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
     }
 
     /* Assign numbers to all child bridges. The last is the highest number. */
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        s390_pci_enumerate_bridge, s);
+    pci_for_each_device_under_bus(sec_bus, s390_pci_enumerate_bridge, s);
     pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, s->bus_no, 1);
 }
 
@@ -1193,7 +1192,7 @@ static void s390_pcihost_reset(DeviceState *dev)
      * on every system reset, we also have to reassign numbers.
      */
     s->bus_no = 0;
-    pci_for_each_device(bus, pci_bus_num(bus), s390_pci_enumerate_bridge, s);
+    pci_for_each_device_under_bus(bus, s390_pci_enumerate_bridge, s);
 }
 
 static void s390_pcihost_class_init(ObjectClass *klass, void *data)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index ca0a98187e..027190fa44 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -615,8 +615,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
     }
 
     args.type = d->io_regions[bar].type;
-    pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
-                        xen_pt_check_bar_overlap, &args);
+    pci_for_each_device_under_bus(pci_get_bus(d),
+                                  xen_pt_check_bar_overlap, &args);
     if (args.rc) {
         XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
                     ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4a8740b76b..5c4016b995 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -467,6 +467,11 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
                                  pci_bus_dev_fn fn,
                                  void *opaque);
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque);
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
-- 
2.32.0


