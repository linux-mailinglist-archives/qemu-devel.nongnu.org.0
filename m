Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F244E56F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:13:11 +0100 (CET)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUUX-0000p1-Uw
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:13:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlURx-00059S-Fw
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlURu-0006Pw-TN
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYSprXGtGmazCDJ3imnjjpHsI2IC8XJyBYBlKcffw9M=;
 b=Hhv8YuBM4mXPDeJhCS+Uk3IVjXfaGDziNxXccXrcRenwhogs3bMcI6pNJ3+BvAnNrKLOhC
 09MSJZRpiNtEEBMOUSiT+zPfi86RL5ClN1hUR0YLz/pNO3yoLe16+FRcU7Fm0XLohs7pTW
 rkDyOHKFkr4Q8cegkS2/7b+sPjAF86w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-okYxz4U6MzKOgqkVOyBa0A-1; Fri, 12 Nov 2021 06:10:23 -0500
X-MC-Unique: okYxz4U6MzKOgqkVOyBa0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A921023F57;
 Fri, 12 Nov 2021 11:10:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83C735C1D0;
 Fri, 12 Nov 2021 11:09:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v3 2/5] hw/acpi/ich9: Add compat prop to keep HPC bit
 set for 6.1 machine type
Date: Fri, 12 Nov 2021 06:08:54 -0500
Message-Id: <20211112110857.3116853-3-imammedo@redhat.com>
In-Reply-To: <20211112110857.3116853-1-imammedo@redhat.com>
References: <20211112110857.3116853-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: ani@anisinha.ca, mapfelba@redhat.com, jusual@redhat.com, kraxel@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
turned on, while the switch to ACPI Hot-plug will be done in the
DSDT table.

Introducing 'x-keep-native-hpc' property disables the HPC bit only
in 6.1 and as a result keeps the forced 'reserve-io' on
pcie-root-ports in 6.1 too.

[1] https://gitlab.com/qemu-project/qemu/-/issues/641
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
   * s/native-hpc-bit/x-native-hotplug/ to fix conflict
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
index fc34b905ee..e1e100316d 100644
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
         object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
                                    "false", true);
     }
-- 
2.27.0


