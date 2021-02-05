Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA4310D0C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:14:53 +0100 (CET)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82ou-0007xx-OI
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82ee-0004ZE-I0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eZ-00035L-Rd
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bh4PfepQMwiw/wSFgTOMnBFeLQ5PPQtiiL9L9xscTQA=;
 b=XMbMmlyFVyI7pnEWN+R5QYdWFl0bd7YH0A/SwWA73fMJuBrr7JGmuCFu1oUaY8+GcPlIhX
 JNX3scwGafXWWj66N564wjjfcGDn+ZqwOavU9f6C36IetkihhN+Km+EcyJGbpNIVa6R245
 hH5kCSOqSdchML4y5PuOxhH350UAdMY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-Tae30Yz4NkG4BS2fJjA4vA-1; Fri, 05 Feb 2021 10:04:09 -0500
X-MC-Unique: Tae30Yz4NkG4BS2fJjA4vA-1
Received: by mail-ed1-f71.google.com with SMTP id b1so7112174edt.22
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Bh4PfepQMwiw/wSFgTOMnBFeLQ5PPQtiiL9L9xscTQA=;
 b=huvyDLmK+CFm2cOD6Ryrf0OPneVf+9+yoCms1yGl9HhbCKG++jJdguPCSKnZcBACsO
 T/fa0pPBUz0s/rxb2ZtY3ZGexEPh/Oa4SMnrKrKXzac9Qzp91SUdQqrfibyUcxtKMmyX
 u7gaYNiFqFRHVdl6HYGCnvrd6P/5FZ+5+mbYR/msk5OmU2ja66L+KNUam+zVeIozZaFo
 powwzjwFGzLdBD1VxVWubTArwC347var65+WOOAxOQoH1uKc8dkf8UDHzC4DJEpKAcNQ
 resPXSv9XWWqHRX05RF7hVFGzYNYjVKkRFQFZqCkhOTNrMEGXTWWjVVSPYj1JNThkYLI
 Z61g==
X-Gm-Message-State: AOAM532HPBZI2AIgFnR9hbrv87hMUJm52+dE/0lgTZYS+1+LBK4GKhLE
 wCBPxxCyTPmSFfOM4+/wqd+zthNsSKBEQV+OfNgxU8P+kGhcTRsb17r50kyZqIEbYN1tkXj9NUl
 wE9YnqR4wHTe3jpXAZt6Q4A1W58XkHbcfoybGUZco5v1NCZYvTd8ldBtcsBnO
X-Received: by 2002:a17:906:8591:: with SMTP id
 v17mr4354973ejx.30.1612537446821; 
 Fri, 05 Feb 2021 07:04:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7BNLUXQDNKF+xiZn/1dvNnhII+2dUbz9Fug+evKQbuyrS41XTz0psoyTFjudldFm0G4W0Kg==
X-Received: by 2002:a17:906:8591:: with SMTP id
 v17mr4354922ejx.30.1612537446371; 
 Fri, 05 Feb 2021 07:04:06 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id s12sm4117667edu.28.2021.02.05.07.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:04:05 -0800 (PST)
Date: Fri, 5 Feb 2021 10:04:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/16] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Message-ID: <20210205150135.94643-13-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marian Postevca <posteuca@mutex.one>

Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
table name.

Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
found, the game crashes(this may be an intentional detection
mechanism to prevent playing the game in a virtualized environment).

This patch allows you to override these default values.

The feature can be used in this manner:
qemu -machine oem-id=ABCDEF,oem-table-id=GHIJKLMN

The oem-id string can be up to 6 bytes in size, and the
oem-table-id string can be up to 8 bytes in size. If the string are
smaller than their respective sizes they will be padded with space.
If either of these parameters is not set, the current default values
will be used for the one missing.

Note that the the OEM Table ID field will not be extended with the
name of the table, but will use either the default name or the user
provided one.

This does not affect the -acpitable option (for user-defined ACPI
tables), which has precedence over -machine option.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
Message-Id: <20210119003216.17637-3-posteuca@mutex.one>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/hmat.h              |  3 +-
 hw/i386/acpi-common.h       |  3 +-
 include/hw/acpi/acpi-defs.h |  2 +-
 include/hw/acpi/aml-build.h |  8 ++--
 include/hw/acpi/ghes.h      |  3 +-
 include/hw/acpi/pci.h       |  3 +-
 include/hw/acpi/vmgenid.h   |  2 +-
 include/hw/arm/virt.h       |  2 +
 include/hw/i386/microvm.h   |  4 ++
 include/hw/i386/pc.h        |  5 ++-
 include/hw/mem/nvdimm.h     |  3 +-
 hw/acpi/aml-build.c         | 29 ++++++-------
 hw/acpi/ghes.c              |  5 ++-
 hw/acpi/hmat.c              |  5 ++-
 hw/acpi/nvdimm.c            | 18 +++++---
 hw/acpi/pci.c               |  5 ++-
 hw/acpi/vmgenid.c           |  4 +-
 hw/arm/virt-acpi-build.c    | 40 +++++++++++------
 hw/arm/virt.c               | 63 +++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 86 +++++++++++++++++++++++++------------
 hw/i386/acpi-common.c       |  5 ++-
 hw/i386/acpi-microvm.c      | 13 +++---
 hw/i386/microvm.c           | 66 ++++++++++++++++++++++++++++
 hw/i386/pc.c                | 64 +++++++++++++++++++++++++++
 24 files changed, 349 insertions(+), 92 deletions(-)

diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index e9031cac01..b57f0e7e80 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -37,6 +37,7 @@
  */
 #define HMAT_PROXIMITY_INITIATOR_VALID  0x1
 
-void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state);
+void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
+                const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index c30e461f18..b12cd73ea5 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -9,6 +9,7 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev);
+                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 38a42f409a..cf9f44299c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -41,7 +41,7 @@ enum {
 };
 
 typedef struct AcpiRsdpData {
-    uint8_t oem_id[6] QEMU_NONSTRING; /* OEM identification */
+    char *oem_id;                     /* OEM identification */
     uint8_t revision;                 /* Must be 0 for 1.0, 2 for 2.0 */
 
     unsigned *rsdt_tbl_offset;
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 54a5aec4d7..380d3e3924 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -8,7 +8,7 @@
 #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
 
 #define ACPI_BUILD_APPNAME6 "BOCHS "
-#define ACPI_BUILD_APPNAME4 "BXPC"
+#define ACPI_BUILD_APPNAME8 "BXPC    "
 
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
@@ -459,10 +459,12 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
+void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
-void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog);
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
+                const char *oem_id, const char *oem_table_id);
 #endif
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 4ad025e09a..2ae8bc1ded 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -67,7 +67,8 @@ typedef struct AcpiGhesState {
 } AcpiGhesState;
 
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
-void acpi_build_hest(GArray *table_data, BIOSLinker *linker);
+void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
+                     const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
 int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index bf2a3ed0ba..e514f179d8 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -33,5 +33,6 @@ typedef struct AcpiMcfgInfo {
     uint32_t size;
 } AcpiMcfgInfo;
 
-void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
+                const char *oem_id, const char *oem_table_id);
 #endif
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index cb4ad37fc5..dc8bb3433e 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -31,7 +31,7 @@ static inline Object *find_vmgenid_dev(void)
 }
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
-                        BIOSLinker *linker);
+                        BIOSLinker *linker, const char *oem_id);
 void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid);
 
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 36fcb29641..ee9a93101e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -165,6 +165,8 @@ struct VirtMachineState {
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
     PCIBus *bus;
+    char *oem_id;
+    char *oem_table_id;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index f25f837441..372b05774e 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -76,6 +76,8 @@
 #define MICROVM_MACHINE_ISA_SERIAL          "isa-serial"
 #define MICROVM_MACHINE_OPTION_ROMS         "x-option-roms"
 #define MICROVM_MACHINE_AUTO_KERNEL_CMDLINE "auto-kernel-cmdline"
+#define MICROVM_MACHINE_OEM_ID              "oem-id"
+#define MICROVM_MACHINE_OEM_TABLE_ID        "oem-table-id"
 
 struct MicrovmMachineClass {
     X86MachineClass parent;
@@ -104,6 +106,8 @@ struct MicrovmMachineState {
     Notifier machine_done;
     Notifier powerdown_req;
     struct GPEXConfig gpex;
+    char *oem_id;
+    char *oem_table_id;
 };
 
 #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2aa8797c6e..5f93540a43 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,8 @@ typedef struct PCMachineState {
     bool pit_enabled;
     bool hpet_enabled;
     uint64_t max_fw_size;
+    char *oem_id;
+    char *oem_table_id;
 
     /* NUMA information: */
     uint64_t numa_nodes;
@@ -62,7 +64,8 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
-
+#define PC_MACHINE_OEM_ID           "oem-id"
+#define PC_MACHINE_OEM_TABLE_ID     "oem-table-id"
 /**
  * PCMachineClass:
  *
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c699842dd0..bcf62f825c 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -154,7 +154,8 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 void nvdimm_build_srat(GArray *table_data);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
-                       uint32_t ram_slots);
+                       uint32_t ram_slots, const char *oem_id,
+                       const char *oem_table_id);
 void nvdimm_plug(NVDIMMState *state);
 void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 7b6ebb0cc8..a2cd7a5830 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -30,6 +30,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
+#include "qemu/cutils.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -1674,21 +1675,12 @@ build_header(BIOSLinker *linker, GArray *table_data,
     h->length = cpu_to_le32(len);
     h->revision = rev;
 
-    if (oem_id) {
-        strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);
-    } else {
-        memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);
-    }
-
-    if (oem_table_id) {
-        strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
-    } else {
-        memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);
-        memcpy(h->oem_table_id + 4, sig, 4);
-    }
+    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
+    strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
+              oem_table_id, ' ');
 
     h->oem_revision = cpu_to_le32(1);
-    memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME4, 4);
+    memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);
     h->asl_compiler_revision = cpu_to_le32(1);
     /* Checksum to be filled in by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
@@ -1871,7 +1863,8 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
  * ACPI spec 5.2.17 System Locality Distance Information Table
  * (Revision 2.0 or later)
  */
-void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
+void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id)
 {
     int slit_start, i, j;
     slit_start = table_data->len;
@@ -1892,7 +1885,7 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
     build_header(linker, table_data,
                  (void *)(table_data->data + slit_start),
                  "SLIT",
-                 table_data->len - slit_start, 1, NULL, NULL);
+                 table_data->len - slit_start, 1, oem_id, oem_table_id);
 }
 
 /* build rev1/rev3/rev5.1 FADT */
@@ -2024,7 +2017,8 @@ build_hdr:
  * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
  * of TCG ACPI Specification, Family “1.2” and “2.0”, Version 1.2, Rev 8
  */
-void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
+                const char *oem_id, const char *oem_table_id)
 {
     uint8_t start_method_params[12] = {};
     unsigned log_addr_offset, tpm2_start;
@@ -2073,7 +2067,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
     build_header(linker, table_data,
-                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
+                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, oem_id,
+                 oem_table_id);
 }
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f0ee9f51ca..a4dac6bf15 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,7 +359,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 }
 
 /* Build Hardware Error Source Table */
-void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
+void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
+                     const char *oem_id, const char *oem_table_id)
 {
     uint64_t hest_start = table_data->len;
 
@@ -372,7 +373,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
     build_header(linker, table_data, (void *)(table_data->data + hest_start),
-        "HEST", table_data->len - hest_start, 1, NULL, NULL);
+                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 37806f7a06..edb3fd91b2 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -253,7 +253,8 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
     }
 }
 
-void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state)
+void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
+                const char *oem_id, const char *oem_table_id)
 {
     int hmat_start = table_data->len;
 
@@ -264,5 +265,5 @@ void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + hmat_start),
-                 "HMAT", table_data->len - hmat_start, 2, NULL, NULL);
+                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index aa95b0cbaf..e3d5fe1939 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -402,7 +402,8 @@ void nvdimm_plug(NVDIMMState *state)
 }
 
 static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
-                              GArray *table_data, BIOSLinker *linker)
+                              GArray *table_data, BIOSLinker *linker,
+                              const char *oem_id, const char *oem_table_id)
 {
     NvdimmFitBuffer *fit_buf = &state->fit_buf;
     unsigned int header;
@@ -417,7 +418,8 @@ static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + header), "NFIT",
-                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, NULL, NULL);
+                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
+                 oem_table_id);
 }
 
 #define NVDIMM_DSM_MEMORY_SIZE      4096
@@ -1278,7 +1280,7 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                               BIOSLinker *linker,
                               NVDIMMState *nvdimm_state,
-                              uint32_t ram_slots)
+                              uint32_t ram_slots, const char *oem_id)
 {
     Aml *ssdt, *sb_scope, *dev;
     int mem_addr_offset, nvdimm_ssdt;
@@ -1331,7 +1333,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
         NVDIMM_DSM_MEM_FILE, 0);
     build_header(linker, table_data,
         (void *)(table_data->data + nvdimm_ssdt),
-        "SSDT", table_data->len - nvdimm_ssdt, 1, NULL, "NVDIMM");
+                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
     free_aml_allocator();
 }
 
@@ -1359,7 +1361,8 @@ void nvdimm_build_srat(GArray *table_data)
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
-                       uint32_t ram_slots)
+                       uint32_t ram_slots, const char *oem_id,
+                       const char *oem_table_id)
 {
     GSList *device_list;
 
@@ -1369,7 +1372,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
     }
 
     nvdimm_build_ssdt(table_offsets, table_data, linker, state,
-                      ram_slots);
+                      ram_slots, oem_id);
 
     device_list = nvdimm_get_device_list();
     /* no NVDIMM device is plugged. */
@@ -1377,6 +1380,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
         return;
     }
 
-    nvdimm_build_nfit(state, table_offsets, table_data, linker);
+    nvdimm_build_nfit(state, table_offsets, table_data, linker,
+                      oem_id, oem_table_id);
     g_slist_free(device_list);
 }
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 9510597a19..ec455c3b25 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -28,7 +28,8 @@
 #include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
 
-void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
+                const char *oem_id, const char *oem_table_id)
 {
     int mcfg_start = table_data->len;
 
@@ -56,6 +57,6 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     build_append_int_noprefix(table_data, 0, 4);
 
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
+                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
 }
 
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 6c92fdae49..4f41a13ea0 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -24,7 +24,7 @@
 #include "sysemu/reset.h"
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
-                        BIOSLinker *linker)
+                        BIOSLinker *linker, const char *oem_id)
 {
     Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
     uint32_t vgia_offset;
@@ -118,7 +118,7 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
 
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, NULL, "VMGENID");
+        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
     free_aml_allocator();
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9d9ee24053..f9c9df916c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -341,7 +341,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     iort->length = cpu_to_le32(iort_length);
 
     build_header(linker, table_data, (void *)(table_data->data + iort_start),
-                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
+                 "IORT", table_data->len - iort_start, 0, vms->oem_id,
+                 vms->oem_table_id);
 }
 
 static void
@@ -375,7 +376,8 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
 
     build_header(linker, table_data, (void *)(table_data->data + spcr_start),
-                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
+                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
+                 vms->oem_table_id);
 }
 
 static void
@@ -427,7 +429,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
-                 "SRAT", table_data->len - srat_start, 3, NULL, NULL);
+                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
+                 vms->oem_table_id);
 }
 
 /* GTDT */
@@ -462,7 +465,8 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2, NULL, NULL);
+                 table_data->len - gtdt_start, 2, vms->oem_id,
+                 vms->oem_table_id);
 }
 
 /* MADT */
@@ -551,7 +555,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, NULL, NULL);
+                 table_data->len - madt_start, 3, vms->oem_id,
+                 vms->oem_table_id);
 }
 
 /* FADT */
@@ -581,7 +586,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
         g_assert_not_reached();
     }
 
-    build_fadt(table_data, linker, &fadt, NULL, NULL);
+    build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
 }
 
 /* DSDT */
@@ -645,7 +650,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 2, NULL, NULL);
+                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
+                 vms->oem_table_id);
     free_aml_allocator();
 }
 
@@ -704,7 +710,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
            .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
            .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
         };
-        build_mcfg(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg, vms->oem_id,
+                   vms->oem_table_id);
     }
 
     acpi_add_table(table_offsets, tables_blob);
@@ -713,7 +720,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->linker);
+        acpi_build_hest(tables_blob, tables->linker, vms->oem_id,
+                        vms->oem_table_id);
     }
 
     if (ms->numa_state->num_nodes > 0) {
@@ -721,13 +729,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_srat(tables_blob, tables->linker, vms);
         if (ms->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker, ms);
+            build_slit(tables_blob, tables->linker, ms, vms->oem_id,
+                       vms->oem_table_id);
         }
     }
 
     if (ms->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          ms->nvdimms_state, ms->ram_slots);
+                          ms->nvdimms_state, ms->ram_slots, vms->oem_id,
+                          vms->oem_table_id);
     }
 
     if (its_class_name() && !vmc->no_its) {
@@ -737,18 +747,20 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
         acpi_add_table(table_offsets, tables_blob);
-        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
+        build_tpm2(tables_blob, tables->linker, tables->tcpalog, vms->oem_id,
+                   vms->oem_table_id);
     }
 
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
-    build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
+    build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
+               vms->oem_table_id);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             .revision = 2,
-            .oem_id = ACPI_BUILD_APPNAME6,
+            .oem_id = vms->oem_id,
             .xsdt_tbl_offset = &xsdt,
             .rsdt_tbl_offset = NULL,
         };
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 399da73454..0c65fe38a0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2155,6 +2155,49 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static char *virt_get_oem_id(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return g_strdup(vms->oem_id);
+}
+
+static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    size_t len = strlen(value);
+
+    if (len > 6) {
+        error_setg(errp,
+                   "User specified oem-id value is bigger than 6 bytes in size");
+        return;
+    }
+
+    strncpy(vms->oem_id, value, len + 1);
+}
+
+static char *virt_get_oem_table_id(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return g_strdup(vms->oem_table_id);
+}
+
+static void virt_set_oem_table_id(Object *obj, const char *value,
+                                  Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    size_t len = strlen(value);
+
+    if (len > 8) {
+        error_setg(errp,
+                   "User specified oem-table-id value is bigger than 8 bytes in size");
+        return;
+    }
+    strncpy(vms->oem_table_id, value, len + 1);
+}
+
+
 bool virt_is_acpi_enabled(VirtMachineState *vms)
 {
     if (vms->acpi == ON_OFF_AUTO_OFF) {
@@ -2604,6 +2647,23 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
+    object_class_property_add_str(oc, "oem-id",
+                                  virt_get_oem_id,
+                                  virt_set_oem_id);
+    object_class_property_set_description(oc, "oem-id",
+                                          "Override the default value of field OEMID "
+                                          "in ACPI table header."
+                                          "The string may be up to 6 bytes in size");
+
+
+    object_class_property_add_str(oc, "oem-table-id",
+                                  virt_get_oem_table_id,
+                                  virt_set_oem_table_id);
+    object_class_property_set_description(oc, "oem-table-id",
+                                          "Override the default value of field OEM Table ID "
+                                          "in ACPI table header."
+                                          "The string may be up to 8 bytes in size");
+
 }
 
 static void virt_instance_init(Object *obj)
@@ -2645,6 +2705,9 @@ static void virt_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
+
+    vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f56d699c7f..b9190b924a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1637,12 +1637,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 1, NULL, NULL);
+                 "DSDT", dsdt->buf->len, 1, pcms->oem_id, pcms->oem_table_id);
     free_aml_allocator();
 }
 
 static void
-build_hpet(GArray *table_data, BIOSLinker *linker)
+build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+           const char *oem_table_id)
 {
     Acpi20Hpet *hpet;
 
@@ -1653,11 +1654,12 @@ build_hpet(GArray *table_data, BIOSLinker *linker)
     hpet->timer_block_id = cpu_to_le32(0x8086a201);
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
-                 (void *)hpet, "HPET", sizeof(*hpet), 1, NULL, NULL);
+                 (void *)hpet, "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
 }
 
 static void
-build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
+               const char *oem_id, const char *oem_table_id)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
     unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
@@ -1677,7 +1679,7 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
         ACPI_BUILD_TPMLOG_FILE, 0);
 
     build_header(linker, table_data,
-                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
+                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
 }
 
 #define HOLE_640K_START  (640 * KiB)
@@ -1812,7 +1814,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_header(linker, table_data,
                  (void *)(table_data->data + srat_start),
                  "SRAT",
-                 table_data->len - srat_start, 1, NULL, NULL);
+                 table_data->len - srat_start, 1, pcms->oem_id,
+                 pcms->oem_table_id);
 }
 
 /*
@@ -1820,7 +1823,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
  * (version Oct. 2014 or later)
  */
 static void
-build_dmar_q35(GArray *table_data, BIOSLinker *linker)
+build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+               const char *oem_table_id)
 {
     int dmar_start = table_data->len;
 
@@ -1870,7 +1874,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + dmar_start),
-                 "DMAR", table_data->len - dmar_start, 1, NULL, NULL);
+                 "DMAR", table_data->len - dmar_start, 1, oem_id, oem_table_id);
 }
 
 /*
@@ -1881,7 +1885,8 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker)
  * Helpful to speedup Windows guests and ignored by others.
  */
 static void
-build_waet(GArray *table_data, BIOSLinker *linker)
+build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+           const char *oem_table_id)
 {
     int waet_start = table_data->len;
 
@@ -1897,7 +1902,7 @@ build_waet(GArray *table_data, BIOSLinker *linker)
     build_append_int_noprefix(table_data, 1 << 1 /* ACPI PM timer good */, 4);
 
     build_header(linker, table_data, (void *)(table_data->data + waet_start),
-                 "WAET", table_data->len - waet_start, 1, NULL, NULL);
+                 "WAET", table_data->len - waet_start, 1, oem_id, oem_table_id);
 }
 
 /*
@@ -1999,7 +2004,8 @@ ivrs_host_bridges(Object *obj, void *opaque)
 }
 
 static void
-build_amd_iommu(GArray *table_data, BIOSLinker *linker)
+build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+                const char *oem_table_id)
 {
     int ivhd_table_len = 24;
     int iommu_start = table_data->len;
@@ -2094,7 +2100,8 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + iommu_start),
-                 "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
+                 "IVRS", table_data->len - iommu_start, 1, oem_id,
+                 oem_table_id);
 }
 
 typedef
@@ -2150,12 +2157,26 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    char *oem_id;
+    char *oem_table_id;
 
     acpi_get_pm_info(machine, &pm);
     acpi_get_misc_info(&misc);
     acpi_get_pci_holes(&pci_hole, &pci_hole64);
     acpi_get_slic_oem(&slic_oem);
 
+    if (slic_oem.id) {
+        oem_id = slic_oem.id;
+    } else {
+        oem_id = pcms->oem_id;
+    }
+
+    if (slic_oem.table_id) {
+        oem_table_id = slic_oem.table_id;
+    } else {
+        oem_table_id = pcms->oem_table_id;
+    }
+
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
     ACPI_BUILD_DPRINTF("init ACPI tables\n");
@@ -2189,32 +2210,35 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     pm.fadt.facs_tbl_offset = &facs;
     pm.fadt.dsdt_tbl_offset = &dsdt;
     pm.fadt.xdsdt_tbl_offset = &dsdt;
-    build_fadt(tables_blob, tables->linker, &pm.fadt,
-               slic_oem.id, slic_oem.table_id);
+    build_fadt(tables_blob, tables->linker, &pm.fadt, oem_id, oem_table_id);
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(x86ms->acpi_dev));
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), pcms->oem_id,
+                    pcms->oem_table_id);
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
         vmgenid_build_acpi(VMGENID(vmgenid_dev), tables_blob,
-                           tables->vmgenid, tables->linker);
+                           tables->vmgenid, tables->linker, pcms->oem_id);
     }
 
     if (misc.has_hpet) {
         acpi_add_table(table_offsets, tables_blob);
-        build_hpet(tables_blob, tables->linker);
+        build_hpet(tables_blob, tables->linker, pcms->oem_id,
+                   pcms->oem_table_id);
     }
     if (misc.tpm_version != TPM_VERSION_UNSPEC) {
         if (misc.tpm_version == TPM_VERSION_1_2) {
             acpi_add_table(table_offsets, tables_blob);
-            build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog);
+            build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog,
+                           pcms->oem_id, pcms->oem_table_id);
         } else { /* TPM_VERSION_2_0 */
             acpi_add_table(table_offsets, tables_blob);
-            build_tpm2(tables_blob, tables->linker, tables->tcpalog);
+            build_tpm2(tables_blob, tables->linker, tables->tcpalog,
+                       pcms->oem_id, pcms->oem_table_id);
         }
     }
     if (pcms->numa_nodes) {
@@ -2222,34 +2246,40 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_srat(tables_blob, tables->linker, machine);
         if (machine->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker, machine);
+            build_slit(tables_blob, tables->linker, machine, pcms->oem_id,
+                       pcms->oem_table_id);
         }
         if (machine->numa_state->hmat_enabled) {
             acpi_add_table(table_offsets, tables_blob);
-            build_hmat(tables_blob, tables->linker, machine->numa_state);
+            build_hmat(tables_blob, tables->linker, machine->numa_state,
+                       pcms->oem_id, pcms->oem_table_id);
         }
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg, pcms->oem_id,
+                   pcms->oem_table_id);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
         if (IOMMUType == TYPE_AMD) {
             acpi_add_table(table_offsets, tables_blob);
-            build_amd_iommu(tables_blob, tables->linker);
+            build_amd_iommu(tables_blob, tables->linker, pcms->oem_id,
+                            pcms->oem_table_id);
         } else if (IOMMUType == TYPE_INTEL) {
             acpi_add_table(table_offsets, tables_blob);
-            build_dmar_q35(tables_blob, tables->linker);
+            build_dmar_q35(tables_blob, tables->linker, pcms->oem_id,
+                           pcms->oem_table_id);
         }
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          machine->nvdimms_state, machine->ram_slots);
+                          machine->nvdimms_state, machine->ram_slots,
+                          pcms->oem_id, pcms->oem_table_id);
     }
 
     acpi_add_table(table_offsets, tables_blob);
-    build_waet(tables_blob, tables->linker);
+    build_waet(tables_blob, tables->linker, pcms->oem_id, pcms->oem_table_id);
 
     /* Add tables supplied by user (if any) */
     for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
@@ -2262,13 +2292,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets,
-               slic_oem.id, slic_oem.table_id);
+               oem_id, oem_table_id);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             .revision = 0,
-            .oem_id = ACPI_BUILD_APPNAME6,
+            .oem_id = pcms->oem_id,
             .xsdt_tbl_offset = NULL,
             .rsdt_tbl_offset = &rsdt,
         };
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index a6a30e8363..1f5947fcf9 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -72,7 +72,8 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 }
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev)
+                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
@@ -157,6 +158,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, NULL, NULL);
+                 table_data->len - madt_start, 1, oem_id, oem_table_id);
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index d34a301b84..54b3af478a 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -149,7 +149,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 2, NULL, NULL);
+                 "DSDT", dsdt->buf->len, 2, mms->oem_id, mms->oem_table_id);
     free_aml_allocator();
 }
 
@@ -201,21 +201,24 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     pmfadt.dsdt_tbl_offset = &dsdt;
     pmfadt.xdsdt_tbl_offset = &dsdt;
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt(tables_blob, tables->linker, &pmfadt, NULL, NULL);
+    build_fadt(tables_blob, tables->linker, &pmfadt, mms->oem_id,
+               mms->oem_table_id);
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
-                    ACPI_DEVICE_IF(x86ms->acpi_dev));
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), mms->oem_id,
+                    mms->oem_table_id);
 
     xsdt = tables_blob->len;
-    build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
+    build_xsdt(tables_blob, tables->linker, table_offsets, mms->oem_id,
+               mms->oem_table_id);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             /* ACPI 2.0: 5.2.4.3 RSDP Structure */
             .revision = 2, /* xsdt needs v2 */
-            .oem_id = ACPI_BUILD_APPNAME6,
+            .oem_id = mms->oem_id,
             .xsdt_tbl_offset = &xsdt,
             .rsdt_tbl_offset = NULL,
         };
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index edf2b0f061..1dc2956e72 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -648,6 +648,51 @@ static void microvm_powerdown_req(Notifier *notifier, void *data)
     }
 }
 
+static char *microvm_machine_get_oem_id(Object *obj, Error **errp)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
+
+    return g_strdup(mms->oem_id);
+}
+
+static void microvm_machine_set_oem_id(Object *obj, const char *value,
+                                       Error **errp)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
+    size_t len = strlen(value);
+
+    if (len > 6) {
+        error_setg(errp,
+          "User specified "MICROVM_MACHINE_OEM_ID" value is bigger than "
+          "6 bytes in size");
+        return;
+    }
+
+    strncpy(mms->oem_id, value, len + 1);
+}
+
+static char *microvm_machine_get_oem_table_id(Object *obj, Error **errp)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
+
+    return g_strdup(mms->oem_table_id);
+}
+
+static void microvm_machine_set_oem_table_id(Object *obj, const char *value,
+                                             Error **errp)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
+    size_t len = strlen(value);
+
+    if (len > 8) {
+        error_setg(errp,
+          "User specified "MICROVM_MACHINE_OEM_TABLE_ID" value is bigger than "
+          "8 bytes in size");
+        return;
+    }
+    strncpy(mms->oem_table_id, value, len + 1);
+}
+
 static void microvm_machine_initfn(Object *obj)
 {
     MicrovmMachineState *mms = MICROVM_MACHINE(obj);
@@ -669,6 +714,9 @@ static void microvm_machine_initfn(Object *obj)
     qemu_add_machine_init_done_notifier(&mms->machine_done);
     mms->powerdown_req.notify = microvm_powerdown_req;
     qemu_register_powerdown_notifier(&mms->powerdown_req);
+
+    mms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    mms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
 static void microvm_class_init(ObjectClass *oc, void *data)
@@ -757,6 +805,24 @@ static void microvm_class_init(ObjectClass *oc, void *data)
         MICROVM_MACHINE_AUTO_KERNEL_CMDLINE,
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
 
+    object_class_property_add_str(oc, MICROVM_MACHINE_OEM_ID,
+                                  microvm_machine_get_oem_id,
+                                  microvm_machine_set_oem_id);
+    object_class_property_set_description(oc, MICROVM_MACHINE_OEM_ID,
+                                          "Override the default value of field OEMID "
+                                          "in ACPI table header."
+                                          "The string may be up to 6 bytes in size");
+
+
+    object_class_property_add_str(oc, MICROVM_MACHINE_OEM_TABLE_ID,
+                                  microvm_machine_get_oem_table_id,
+                                  microvm_machine_set_oem_table_id);
+    object_class_property_set_description(oc, MICROVM_MACHINE_OEM_TABLE_ID,
+                                          "Override the default value of field OEM Table ID "
+                                          "in ACPI table header."
+                                          "The string may be up to 8 bytes in size");
+
+
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5458f61d10..437977c49e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1611,6 +1611,50 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
     pcms->max_fw_size = value;
 }
 
+static char *pc_machine_get_oem_id(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return g_strdup(pcms->oem_id);
+}
+
+static void pc_machine_set_oem_id(Object *obj, const char *value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    size_t len = strlen(value);
+
+    if (len > 6) {
+        error_setg(errp,
+          "User specified "PC_MACHINE_OEM_ID" value is bigger than "
+          "6 bytes in size");
+        return;
+    }
+
+    strncpy(pcms->oem_id, value, len + 1);
+}
+
+static char *pc_machine_get_oem_table_id(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return g_strdup(pcms->oem_table_id);
+}
+
+static void pc_machine_set_oem_table_id(Object *obj, const char *value,
+                                        Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    size_t len = strlen(value);
+
+    if (len > 8) {
+        error_setg(errp,
+          "User specified "PC_MACHINE_OEM_TABLE_ID" value is bigger than "
+          "8 bytes in size");
+        return;
+    }
+    strncpy(pcms->oem_table_id, value, len + 1);
+}
+
 static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1623,6 +1667,8 @@ static void pc_machine_initfn(Object *obj)
     pcms->max_ram_below_4g = 0; /* use default */
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
+    pcms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    pcms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
@@ -1759,6 +1805,24 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
         "Maximum combined firmware size");
+
+    object_class_property_add_str(oc, PC_MACHINE_OEM_ID,
+                                  pc_machine_get_oem_id,
+                                  pc_machine_set_oem_id);
+    object_class_property_set_description(oc, PC_MACHINE_OEM_ID,
+                                          "Override the default value of field OEMID "
+                                          "in ACPI table header."
+                                          "The string may be up to 6 bytes in size");
+
+
+    object_class_property_add_str(oc, PC_MACHINE_OEM_TABLE_ID,
+                                  pc_machine_get_oem_table_id,
+                                  pc_machine_set_oem_table_id);
+    object_class_property_set_description(oc, PC_MACHINE_OEM_TABLE_ID,
+                                          "Override the default value of field OEM Table ID "
+                                          "in ACPI table header."
+                                          "The string may be up to 8 bytes in size");
+
 }
 
 static const TypeInfo pc_machine_info = {
-- 
MST


