Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD263C7972
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:12:56 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qe7-0001gH-4H
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QbY-0006TP-DZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QbU-0007X5-8b
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3i4DyvYX94w5eyf6eVKq7jHnyEBcb4z6P2pthb6TVgs=;
 b=J+nS/rai8MMQyoB/c5/GIv2CgS+Qvx0yKQfLwmMmosVZX2zt46xPabREyLPOLoHBOFAAgi
 3XH4AMbQlN1o7BVElBAcsoMvl78qGF3YBvIjeui4cXBaIhfm3fL9McW1b1vh6LK41zMdOx
 8ZpLXHUbQWOZ53ErpogtZgdo2mZtMBM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-DNJ4NA3INuGNSg3l8Lxyow-1; Tue, 13 Jul 2021 18:10:10 -0400
X-MC-Unique: DNJ4NA3INuGNSg3l8Lxyow-1
Received: by mail-wr1-f71.google.com with SMTP id
 g9-20020adff3c90000b0290140a25efc6dso339914wrp.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3i4DyvYX94w5eyf6eVKq7jHnyEBcb4z6P2pthb6TVgs=;
 b=jNTXgdm+mDdnEDd+TUXLuAP+HeV7T+XmJA03kFwe3ePC7uJAbPZmuZIxBaye5N5MT1
 u582IIRO9FsBeGCX7abFyTPLdUcfg7WXaVXb9LnP1AL2SkOm9/LwsjJy69353DBxMCuS
 vOVUv/k9rt2obzfNfvs9qhoDt2y3BiwIJlo7O1cSutiAFkCNiEc4yX5NAddt978nltdo
 hkaQvZ7ZXwigvlRMrpIQGGgY3WbFrW3ZEOz41nMNGYlHQDnTsUsqTu7Zr648DI6XEIgz
 sMp+fZScPk5mi6F0vbuy1q2Sf89F8OdAHZ1SZAWQE1QJ8p4HlaIDLkUxqbpfSugMU975
 +OLg==
X-Gm-Message-State: AOAM5317RqkocLLMQcQMOZWrdmy82PU1yWPIf6aZLd/tLTXfF2AW14A/
 sMhE2GIrhQCgO2vUQ+ZaMK2p+HlIlNOu5Z0UR5H3Bcmiy06aCCKtvQ0hmMo+o6Tcj3l3NEvd7z/
 8/pPPzIotBpJllJOd6PLvKr2iGes8/SOs5KxHhmSm0brEHu+u1FtXJqKoBdjU
X-Received: by 2002:a5d:5403:: with SMTP id g3mr8352637wrv.403.1626214208906; 
 Tue, 13 Jul 2021 15:10:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvhNfx7P79vA5XzpPELzCRYI2jwMw25Uzq3Mecly5j2/kKgkcLLhgz/dngbUZYK5yVB8QcnQ==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr8352598wrv.403.1626214208626; 
 Tue, 13 Jul 2021 15:10:08 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id c12sm127554wrr.90.2021.07.13.15.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:08 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
Message-ID: <20210713220946.212562-2-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Implement notifications and gpe to support q35 ACPI PCI hot-plug.
Use 0xcc4 - 0xcd7 range for 'acpi-pci-hotplug' io ports.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20210713004205.775386-2-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/i386/acpi-build.h    |  4 ++++
 include/hw/acpi/ich9.h  |  2 ++
 include/hw/acpi/pcihp.h |  3 ++-
 hw/acpi/pcihp.c         |  6 +++---
 hw/acpi/piix4.c         |  4 +++-
 hw/i386/acpi-build.c    | 30 +++++++++++++++++++-----------
 6 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 74df5fc612..487ec7710f 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -5,6 +5,10 @@
 
 extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 
+/* PCI Hot-plug registers bases. See docs/spec/acpi_pci_hotplug.txt */
+#define ACPI_PCIHP_SEJ_BASE 0x8
+#define ACPI_PCIHP_BNMR_BASE 0x10
+
 void acpi_setup(void);
 
 #endif
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index df519e40b5..596120d97f 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -28,6 +28,8 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
 
+#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
+
 typedef struct ICH9LPCPMRegs {
     /*
      * In ich9 spec says that pm1_cnt register is 32bit width and
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 2dd90aea30..af1a169fc3 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -55,7 +55,8 @@ typedef struct AcpiPciHpState {
 } AcpiPciHpState;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
-                     MemoryRegion *address_space_io, bool bridges_enabled);
+                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     uint16_t io_base);
 
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 4999277d57..d98a284b7a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -37,7 +37,6 @@
 #include "qom/qom-qobject.h"
 #include "trace.h"
 
-#define ACPI_PCIHP_ADDR 0xae00
 #define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
 #define PCI_DOWN_BASE 0x0004
@@ -488,10 +487,11 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
 };
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io, bool bridges_enabled)
+                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     uint16_t io_base)
 {
     s->io_len = ACPI_PCIHP_SIZE;
-    s->io_base = ACPI_PCIHP_ADDR;
+    s->io_base = io_base;
 
     s->root = root_bus;
     s->legacy_piix = !bridges_enabled;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0bd23d74e2..48f7a1edbc 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -49,6 +49,8 @@
 #define GPE_BASE 0xafe0
 #define GPE_LEN 4
 
+#define ACPI_PCIHP_ADDR_PIIX4 0xae00
+
 struct pci_status {
     uint32_t up; /* deprecated, maintained for migration compatibility */
     uint32_t down;
@@ -607,7 +609,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
 
     if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                        s->use_acpi_hotplug_bridge);
+                        s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
     }
 
     s->cpu_hotplug_legacy = true;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 357437ff1d..e1c246d6e8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -219,10 +219,6 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
         /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
         pm->fadt.rev = 1;
         pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
-        pm->pcihp_io_base =
-            object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
-        pm->pcihp_io_len =
-            object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
     }
     if (lpc) {
         uint64_t smi_features = object_property_get_uint(lpc,
@@ -238,6 +234,10 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
         pm->smi_on_cpu_unplug =
             !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
     }
+    pm->pcihp_io_base =
+        object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
+    pm->pcihp_io_len =
+        object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
 
     /* The above need not be conditional on machine type because the reset port
      * happens to be the same on PIIX (pc) and ICH9 (q35). */
@@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
         if (!pdev) {
             if (bsel) { /* add hotplug slots for non present devices */
+                if (pci_bus_is_express(bus) && slot > 0) {
+                    break;
+                }
                 dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
@@ -521,7 +524,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             QLIST_FOREACH(sec, &bus->child, sibling) {
                 int32_t devfn = sec->parent_dev->devfn;
 
-                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
+                if (pci_bus_is_root(sec)) {
                     continue;
                 }
 
@@ -1251,7 +1254,7 @@ static void build_piix4_isa_bridge(Aml *table)
     aml_append(table, scope);
 }
 
-static void build_piix4_pci_hotplug(Aml *table)
+static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
 {
     Aml *scope;
     Aml *field;
@@ -1260,20 +1263,22 @@ static void build_piix4_pci_hotplug(Aml *table)
     scope =  aml_scope("_SB.PCI0");
 
     aml_append(scope,
-        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(0xae00), 0x08));
+        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
     field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("PCIU", 32));
     aml_append(field, aml_named_field("PCID", 32));
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("SEJ", AML_SYSTEM_IO, aml_int(0xae08), 0x04));
+        aml_operation_region("SEJ", AML_SYSTEM_IO,
+                             aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
     field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("B0EJ", 32));
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x08));
+        aml_operation_region("BNMR", AML_SYSTEM_IO,
+                             aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
     field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("BNUM", 32));
     aml_append(field, aml_named_field("PIDX", 32));
@@ -1407,7 +1412,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
-            build_piix4_pci_hotplug(dsdt);
+            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
     } else {
@@ -1455,6 +1460,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
         build_q35_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
+        if (pm->pcihp_bridge_en) {
+            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
+        }
         build_q35_pci0_int(dsdt);
         if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
             build_smb0(dsdt, pcms->smbus, ICH9_SMB_DEV, ICH9_SMB_FUNC);
@@ -1489,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     {
         aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
 
-        if (misc->is_piix4 && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
+        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
-- 
MST


