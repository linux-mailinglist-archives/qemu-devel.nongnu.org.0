Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782D422E96
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:58:39 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnm2-00045H-2n
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmux-0001yR-OE
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmui-0006cO-Mv
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJsGrjG7v7nwRM18b6PA9SOYSO3Rcoy2CdAVeRcpvfA=;
 b=YClobf1i2mh1f1937xQzCrHzMVhUkGVqOmQJbL78IoET3LOc2aj/HSHUpLHhfSy4t0PjS+
 DUvpcYNpR9EDLnyvMJmicv3A0Zg9Q18+KEEYWGYbsBNJpgBLSP1HKZ7EmFFLNxSB+hkf6C
 HkdhQVGboLLKTIDk7FS1jEDP4IAwt8Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-5rhBfpNiOjq95gHkS2vN1A-1; Tue, 05 Oct 2021 12:03:30 -0400
X-MC-Unique: 5rhBfpNiOjq95gHkS2vN1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 3-20020a05600c22c300b0030d6a6a28f8so1218578wmg.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IJsGrjG7v7nwRM18b6PA9SOYSO3Rcoy2CdAVeRcpvfA=;
 b=4ssrNvEN57hiKIQzPiiZ770VR/VaImSgTJPsY/+568LI/UJVSckDnz7HZVPicGL1dC
 m3ywqOzpuf1CCNlvkNMtqo3LLBqP/AwDPbblQ8cYw8wWUOAEhRfKWlYzCeTd64092Ao1
 eL9eGTD1admeIOuksyMkl5o1OwSXHAVWcpArzJO5tMS5CmppIllOJBCj/K1wRjQspnZg
 d4FtZTXO/9KccaM996ZiKPUn2QebNzC0KTabltfMTDMksQPiIUb+1SF3shzTFiPxsuTL
 hFdNjVpjUYkJGBNpjoCh/igNl50HsMbyuAqUhHLcbNwMdQGTCHN20ISVO3CvZImKi7B0
 853w==
X-Gm-Message-State: AOAM532NCeA4zfX9COfS8C+gmQDGkWBcJBClb4sHFt0ZQn0gqF28Vhz9
 miehMKdznYvsWvUZkBPIAwgS22nhwi5m0XXQDn8XSOjjVVfpjZX/0J5juZPWpNjQlZxmA5QHyXU
 ElMUiGPPZpNTnwESvQX3PIhjXlZotRUNacicS3KsWwM4/D+KqNeECDu1oXceB
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr4268779wri.64.1633449808586; 
 Tue, 05 Oct 2021 09:03:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZd9+AfV/NDIjRawoYdtaXgs2c6oLnfJ+aWdNNCuajUgJ7yARLj5Vk8+uouB+BxpIjVAJDSQ==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr4268720wri.64.1633449808303; 
 Tue, 05 Oct 2021 09:03:28 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id l16sm2502701wmj.33.2021.10.05.09.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:27 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/57] acpi: madt: arm/x86: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-36-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-22-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h |  9 ---------
 hw/arm/virt-acpi-build.c    | 19 +++++++++++--------
 hw/i386/acpi-common.c       | 19 +++++++++++--------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c4f0a202e8..c7fa5caa06 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -176,15 +176,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 #define ACPI_DUAL_PIC                0
 #define ACPI_MULTIPLE_APIC           1
 
-/* Master MADT */
-
-struct AcpiMultipleApicTable {
-    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
-    uint32_t local_apic_address;     /* Physical address of local APIC */
-    uint32_t flags;
-} QEMU_PACKED;
-typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
-
 /* Values for Type in APIC sub-headers */
 
 #define ACPI_APIC_PROCESSOR          0
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ba02cf281..e3bdcd44e8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -567,19 +567,26 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
-/* MADT */
+/*
+ * ACPI spec, Revision 5.0
+ * 5.2.12 Multiple APIC Description Table (MADT)
+ */
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    int madt_start = table_data->len;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
     int i;
+    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
+    acpi_table_begin(&table, table_data);
+    /* Local Interrupt Controller Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
 
     gicd = acpi_data_push(table_data, sizeof *gicd);
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
@@ -650,11 +657,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gic_msi->spi_count = cpu_to_le16(NUM_GICV2M_SPIS);
         gic_msi->spi_base = cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE);
     }
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /* FADT */
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf9..a0cde1d874 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -71,24 +71,29 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
     }
 }
 
+/*
+ * ACPI spec, Revision 1.0b
+ * 5.2.8 Multiple APIC Description Table
+ */
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
                      const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
-    int madt_start = table_data->len;
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
     bool x2apic_mode = false;
 
-    AcpiMultipleApicTable *madt;
     AcpiMadtIoApic *io_apic;
     AcpiMadtIntsrcovr *intsrcovr;
     int i;
+    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
 
-    madt = acpi_data_push(table_data, sizeof *madt);
-    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
-    madt->flags = cpu_to_le32(1);
+    acpi_table_begin(&table, table_data);
+    /* Local APIC Address */
+    build_append_int_noprefix(table_data, APIC_DEFAULT_ADDRESS, 4);
+    build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
         adevc->madt_cpu(adev, i, apic_ids, table_data);
@@ -156,8 +161,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
         local_nmi->lint         = 1; /* ACPI_LINT1 */
     }
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
-- 
MST


