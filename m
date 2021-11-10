Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871AD44BB42
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:34:00 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgFD-0004kD-K0
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:33:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgD4-0002kw-97
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgD2-00057u-FG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636522303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jeyrSjlTh7PJOE8PHp18svSs+DA9eqNM5KiL6njW2sg=;
 b=L9Bo/4sRU9WByhvoqjCjAUsumFj++69385sPrrMUytrvaGctUEnFbYOhFDs5FlaB3tOQuj
 B6UqPPAtR53nWtd9hlI/ob8sOktBT9fmTBBTAcSRsEPBTnxEidQRhGs9eYM56GcdxpJw+h
 YjgpFqdcq9pIoQ+W3tQ/NhEppqYTW3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-_23pxJSYMxaHGGbf85qBTA-1; Wed, 10 Nov 2021 00:31:40 -0500
X-MC-Unique: _23pxJSYMxaHGGbf85qBTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82002101AFA7;
 Wed, 10 Nov 2021 05:31:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F6815D9CA;
 Wed, 10 Nov 2021 05:31:37 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/acpi/ich9: Add compatibility option for
 'native-hpc-bit'
Date: Wed, 10 Nov 2021 06:30:11 +0100
Message-Id: <20211110053014.489591-3-jusual@redhat.com>
In-Reply-To: <20211110053014.489591-1-jusual@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
turned on, while the switch to ACPI Hot-plug will be done in the
DSDT table.

Introducing 'x-keep-native-hpc' option disables the HPC bit only
in 6.1 and as a result keeps the forced 'reserve-io' on
pcie-root-ports in 6.1 too.

[1] https://gitlab.com/qemu-project/qemu/-/issues/641
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 include/hw/acpi/ich9.h |  1 +
 hw/acpi/ich9.c         | 18 ++++++++++++++++++
 hw/i386/pc.c           |  2 ++
 hw/i386/pc_q35.c       |  7 ++++++-
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index f04f1791bd..7ca92843c6 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -56,6 +56,7 @@ typedef struct ICH9LPCPMRegs {
     AcpiCpuHotplug gpe_cpu;
     CPUHotplugState cpuhp_state;
 
+    bool keep_pci_slot_hpc;
     bool use_acpi_hotplug_bridge;
     AcpiPciHpState acpi_pci_hotplug;
     MemHotplugState acpi_memory_hotplug;
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 1ee2ba2c50..ebe08ed831 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -419,6 +419,20 @@ static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
     s->pm.use_acpi_hotplug_bridge = value;
 }
 
+static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    return s->pm.keep_pci_slot_hpc;
+}
+
+static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    s->pm.keep_pci_slot_hpc = value;
+}
+
 void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 {
     static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
@@ -428,6 +442,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s4 = 0;
     pm->s4_val = 2;
     pm->use_acpi_hotplug_bridge = true;
+    pm->keep_pci_slot_hpc = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
@@ -454,6 +469,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                              ich9_pm_get_acpi_pci_hotplug,
                              ich9_pm_set_acpi_pci_hotplug);
+    object_property_add_bool(obj, "x-keep-pci-slot-hpc",
+                             ich9_pm_get_keep_pci_slot_hpc,
+                             ich9_pm_set_keep_pci_slot_hpc);
 }
 
 void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2592a82148..a2ef40ecbc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_1[] = {
     { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
     { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
     { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
+    { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
 };
 const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
 
@@ -107,6 +108,7 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
     { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
     { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
+    { "ICH9-LPC", "x-keep-pci-slot-hpc", "true" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index ded61f8ef7..06f09dfcc6 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -137,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
     DriveInfo *hd[MAX_SATA_PORTS];
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool acpi_pcihp;
+    bool keep_pci_slot_hpc;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -242,7 +243,11 @@ static void pc_q35_init(MachineState *machine)
                                           ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                                           NULL);
 
-    if (acpi_pcihp) {
+    keep_pci_slot_hpc = object_property_get_bool(OBJECT(lpc),
+                                                 "x-keep-pci-slot-hpc",
+                                                 NULL);
+
+    if (!keep_pci_slot_hpc && acpi_pcihp) {
         object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
                                    "false", true);
     }
-- 
2.31.1


