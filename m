Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF661F7A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlMo-00047O-1k
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl3R-0001KU-7g
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:53:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33490
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl3L-0001eW-0R
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SkTpw3tlfOMxd2u5FlY1lVrn4tytemDjVdlXjNxP9Y=;
 b=C3S+bM+HC7A2bD2orvEWZtC5jM2VTLGkpVOgW0qE51Gj0/xUbEnCLJ/A8RqpZ944GbBBYf
 2WeISOeRrQAtoYsvRE8mm4R5Eoqrzvm5KoEF8jtspIa/SlG7K5JWPvUjiL4LlYs/Or2G30
 qkcClPTRRgI+wTMiwaJS/6r4B7Eg2tY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-9WwjXo6CMqOLgZOasYvqJQ-1; Fri, 12 Jun 2020 10:53:00 -0400
X-MC-Unique: 9WwjXo6CMqOLgZOasYvqJQ-1
Received: by mail-wr1-f69.google.com with SMTP id e1so4006669wrm.3
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4SkTpw3tlfOMxd2u5FlY1lVrn4tytemDjVdlXjNxP9Y=;
 b=d+GETSfS3fYOtdTyi/Ne3oWrUhOj4Xi2tycAOsie0SAIciWei751C3bTv1EXxT+xcF
 Y6ogY2/VCUzdBkIsE6FnFLHQYQzcat9jhA3dlXMbxzn4IeUgt95XSXCqmgC4elikXjGJ
 cnFJXQqYTVKguyZO4KFBHsHhJaE4HK+1GoTblbNRmZKlJ/GD3rdKP9fIG6MRyENR4tJo
 prImCljkgWTq1MhzWRTBE6BwVF6lRbU/bJ6sSrbB+wbEPYXEnCaq8kuTNTV9zsSA77T/
 5+B7v6y4n+1wbovO4rgT0cB+vLqjCJo1qOcvfDoWrGaEEBx8fFeOTcjowCgQD1jH9+x1
 0img==
X-Gm-Message-State: AOAM53022kiXMrOz7qpO1VQ0jLmD1QCK/ACsg6VvRBP7YGaxPclRQUoh
 FS58m6dhyyIIhxqU20jIH0o41GTOO4G3ub4YStR8eH8PbhTqoM2C8elYY4PbW0sGgmld7Xuqzbd
 qWe1FeKsoM5OpSUI=
X-Received: by 2002:a1c:b656:: with SMTP id g83mr13701372wmf.27.1591973578710; 
 Fri, 12 Jun 2020 07:52:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwCKRhLe6T7jjRlZIYZDglcFMcNekwHPE+pJ57R0duPA7GPXL4sAK4asnDbFZQyROGlLOQyQ==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr13701349wmf.27.1591973578337; 
 Fri, 12 Jun 2020 07:52:58 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id h15sm9920995wrt.73.2020.06.12.07.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:52:57 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:52:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 52/58] acpi: create acpi-common.c and move madt code
Message-ID: <20200612141917.9446-53-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:00:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

We'll need madt support for microvm.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200520132003.9492-7-kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-common.h |  14 ++++
 hw/i386/acpi-build.c  | 126 +---------------------------------
 hw/i386/acpi-common.c | 152 ++++++++++++++++++++++++++++++++++++++++++
 hw/i386/Makefile.objs |   1 +
 4 files changed, 170 insertions(+), 123 deletions(-)
 create mode 100644 hw/i386/acpi-common.h
 create mode 100644 hw/i386/acpi-common.c

diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
new file mode 100644
index 0000000000..c30e461f18
--- /dev/null
+++ b/hw/i386/acpi-common.h
@@ -0,0 +1,14 @@
+#ifndef HW_I386_ACPI_COMMON_H
+#define HW_I386_ACPI_COMMON_H
+#include "include/hw/acpi/acpi_dev_interface.h"
+
+#include "include/hw/acpi/bios-linker-loader.h"
+#include "include/hw/i386/x86.h"
+
+/* Default IOAPIC ID */
+#define ACPI_BUILD_IOAPIC_ID 0x0
+
+void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
+                     X86MachineState *x86ms, AcpiDeviceIf *adev);
+
+#endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d217fc1fe6..26c0c8aefa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -24,6 +24,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qnum.h"
 #include "acpi-build.h"
+#include "acpi-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 #include "hw/pci/pci.h"
@@ -89,9 +90,6 @@
 #define ACPI_BUILD_DPRINTF(fmt, ...)
 #endif
 
-/* Default IOAPIC ID */
-#define ACPI_BUILD_IOAPIC_ID 0x0
-
 typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
@@ -327,124 +325,6 @@ build_facs(GArray *table_data)
     facs->length = cpu_to_le32(sizeof(*facs));
 }
 
-void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
-                       const CPUArchIdList *apic_ids, GArray *entry)
-{
-    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
-
-    /* ACPI spec says that LAPIC entry for non present
-     * CPU may be omitted from MADT or it must be marked
-     * as disabled. However omitting non present CPU from
-     * MADT breaks hotplug on linux. So possible CPUs
-     * should be put in MADT but kept disabled.
-     */
-    if (apic_id < 255) {
-        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
-
-        apic->type = ACPI_APIC_PROCESSOR;
-        apic->length = sizeof(*apic);
-        apic->processor_id = uid;
-        apic->local_apic_id = apic_id;
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
-    } else {
-        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
-
-        apic->type = ACPI_APIC_LOCAL_X2APIC;
-        apic->length = sizeof(*apic);
-        apic->uid = cpu_to_le32(uid);
-        apic->x2apic_id = cpu_to_le32(apic_id);
-        if (apic_ids->cpus[uid].cpu != NULL) {
-            apic->flags = cpu_to_le32(1);
-        } else {
-            apic->flags = cpu_to_le32(0);
-        }
-    }
-}
-
-static void
-build_madt(GArray *table_data, BIOSLinker *linker,
-           X86MachineState *x86ms, AcpiDeviceIf *adev)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
-    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
-    int madt_start = table_data->len;
-    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
-    bool x2apic_mode = false;
-
-    AcpiMultipleApicTable *madt;
-    AcpiMadtIoApic *io_apic;
-    AcpiMadtIntsrcovr *intsrcovr;
-    int i;
-
-    madt = acpi_data_push(table_data, sizeof *madt);
-    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
-    madt->flags = cpu_to_le32(1);
-
-    for (i = 0; i < apic_ids->len; i++) {
-        adevc->madt_cpu(adev, i, apic_ids, table_data);
-        if (apic_ids->cpus[i].arch_id > 254) {
-            x2apic_mode = true;
-        }
-    }
-
-    io_apic = acpi_data_push(table_data, sizeof *io_apic);
-    io_apic->type = ACPI_APIC_IO;
-    io_apic->length = sizeof(*io_apic);
-    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
-    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
-    io_apic->interrupt = cpu_to_le32(0);
-
-    if (x86ms->apic_xrupt_override) {
-        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-        intsrcovr->length = sizeof(*intsrcovr);
-        intsrcovr->source = 0;
-        intsrcovr->gsi    = cpu_to_le32(2);
-        intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
-    }
-    for (i = 1; i < 16; i++) {
-#define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
-        if (!(ACPI_BUILD_PCI_IRQS & (1 << i))) {
-            /* No need for a INT source override structure. */
-            continue;
-        }
-        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-        intsrcovr->length = sizeof(*intsrcovr);
-        intsrcovr->source = i;
-        intsrcovr->gsi    = cpu_to_le32(i);
-        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
-    }
-
-    if (x2apic_mode) {
-        AcpiMadtLocalX2ApicNmi *local_nmi;
-
-        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
-        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
-        local_nmi->length = sizeof(*local_nmi);
-        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
-        local_nmi->flags  = cpu_to_le16(0);
-        local_nmi->lint   = 1; /* ACPI_LINT1 */
-    } else {
-        AcpiMadtLocalNmi *local_nmi;
-
-        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
-        local_nmi->type         = ACPI_APIC_LOCAL_NMI;
-        local_nmi->length       = sizeof(*local_nmi);
-        local_nmi->processor_id = 0xff; /* all processors */
-        local_nmi->flags        = cpu_to_le16(0);
-        local_nmi->lint         = 1; /* ACPI_LINT1 */
-    }
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, NULL, NULL);
-}
-
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
     Aml *if_ctx;
@@ -2707,8 +2587,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, x86ms,
-               ACPI_DEVICE_IF(pcms->acpi_dev));
+    acpi_build_madt(tables_blob, tables->linker, x86ms,
+                    ACPI_DEVICE_IF(pcms->acpi_dev));
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
new file mode 100644
index 0000000000..5caca16a0b
--- /dev/null
+++ b/hw/i386/acpi-common.c
@@ -0,0 +1,152 @@
+/* Support for generating ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
+ * Copyright (C) 2006 Fabrice Bellard
+ * Copyright (C) 2013 Red Hat Inc
+ *
+ * Author: Michael S. Tsirkin <mst@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+
+#include "exec/memory.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/utils.h"
+#include "hw/i386/pc.h"
+#include "target/i386/cpu.h"
+
+#include "acpi-build.h"
+#include "acpi-common.h"
+
+void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
+                       const CPUArchIdList *apic_ids, GArray *entry)
+{
+    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
+
+    /* ACPI spec says that LAPIC entry for non present
+     * CPU may be omitted from MADT or it must be marked
+     * as disabled. However omitting non present CPU from
+     * MADT breaks hotplug on linux. So possible CPUs
+     * should be put in MADT but kept disabled.
+     */
+    if (apic_id < 255) {
+        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
+
+        apic->type = ACPI_APIC_PROCESSOR;
+        apic->length = sizeof(*apic);
+        apic->processor_id = uid;
+        apic->local_apic_id = apic_id;
+        if (apic_ids->cpus[uid].cpu != NULL) {
+            apic->flags = cpu_to_le32(1);
+        } else {
+            apic->flags = cpu_to_le32(0);
+        }
+    } else {
+        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
+
+        apic->type = ACPI_APIC_LOCAL_X2APIC;
+        apic->length = sizeof(*apic);
+        apic->uid = cpu_to_le32(uid);
+        apic->x2apic_id = cpu_to_le32(apic_id);
+        if (apic_ids->cpus[uid].cpu != NULL) {
+            apic->flags = cpu_to_le32(1);
+        } else {
+            apic->flags = cpu_to_le32(0);
+        }
+    }
+}
+
+void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
+                     X86MachineState *x86ms, AcpiDeviceIf *adev)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
+    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
+    int madt_start = table_data->len;
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
+    bool x2apic_mode = false;
+
+    AcpiMultipleApicTable *madt;
+    AcpiMadtIoApic *io_apic;
+    AcpiMadtIntsrcovr *intsrcovr;
+    int i;
+
+    madt = acpi_data_push(table_data, sizeof *madt);
+    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
+    madt->flags = cpu_to_le32(1);
+
+    for (i = 0; i < apic_ids->len; i++) {
+        adevc->madt_cpu(adev, i, apic_ids, table_data);
+        if (apic_ids->cpus[i].arch_id > 254) {
+            x2apic_mode = true;
+        }
+    }
+
+    io_apic = acpi_data_push(table_data, sizeof *io_apic);
+    io_apic->type = ACPI_APIC_IO;
+    io_apic->length = sizeof(*io_apic);
+    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
+    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
+    io_apic->interrupt = cpu_to_le32(0);
+
+    if (x86ms->apic_xrupt_override) {
+        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
+        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
+        intsrcovr->length = sizeof(*intsrcovr);
+        intsrcovr->source = 0;
+        intsrcovr->gsi    = cpu_to_le32(2);
+        intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
+    }
+    for (i = 1; i < 16; i++) {
+#define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
+        if (!(ACPI_BUILD_PCI_IRQS & (1 << i))) {
+            /* No need for a INT source override structure. */
+            continue;
+        }
+        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
+        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
+        intsrcovr->length = sizeof(*intsrcovr);
+        intsrcovr->source = i;
+        intsrcovr->gsi    = cpu_to_le32(i);
+        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
+    }
+
+    if (x2apic_mode) {
+        AcpiMadtLocalX2ApicNmi *local_nmi;
+
+        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
+        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
+        local_nmi->length = sizeof(*local_nmi);
+        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
+        local_nmi->flags  = cpu_to_le16(0);
+        local_nmi->lint   = 1; /* ACPI_LINT1 */
+    } else {
+        AcpiMadtLocalNmi *local_nmi;
+
+        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
+        local_nmi->type         = ACPI_APIC_LOCAL_NMI;
+        local_nmi->length       = sizeof(*local_nmi);
+        local_nmi->processor_id = 0xff; /* all processors */
+        local_nmi->flags        = cpu_to_le16(0);
+        local_nmi->lint         = 1; /* ACPI_LINT1 */
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + madt_start), "APIC",
+                 table_data->len - madt_start, 1, NULL, NULL);
+}
+
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 8ce1b26533..6abc74551a 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -16,4 +16,5 @@ obj-$(CONFIG_VMMOUSE) += vmmouse.o
 obj-$(CONFIG_PC) += port92.o
 
 obj-y += kvmvapic.o
+obj-$(CONFIG_ACPI) += acpi-common.o
 obj-$(CONFIG_PC) += acpi-build.o
-- 
MST


