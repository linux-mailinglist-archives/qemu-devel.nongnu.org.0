Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45F380E56
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:41:54 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhasr-00068Q-6u
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaLS-0003Zt-C8
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaLO-0007PL-Eg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAhi6mSwd1RX4WD+1Zv1SP4t5UQUzTU38vJXZ1UaeGQ=;
 b=R73fdu31k8QEKyJ3MArTjy5+THaHPprLy4tVwTXSjhX88cQfWpIqJs3rFe9OBB3GBBifkw
 3tMSkrrOjgnZWClU/u2KKwLWAkp3Vl/8ctT8D6SvVuyWIpcL1Pkmc2Z7eT4WNA/CyG7k/m
 3M7yonhZ8r5NM6mHeSnddgqCKEp2YD0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-nWPEpX2ANymz4gZN0wDuJA-1; Fri, 14 May 2021 12:04:15 -0400
X-MC-Unique: nWPEpX2ANymz4gZN0wDuJA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so8599567wre.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rAhi6mSwd1RX4WD+1Zv1SP4t5UQUzTU38vJXZ1UaeGQ=;
 b=E0jmORNlesEW6pkStllZOy462b4gVYc/W67GzUv0PvdxRWUr2R8D63tNFKO1dFdXpM
 eGOBGHLy2Mj6fOGBqhQrTv+qf2CszJ99pAcUP1OoIoQKptukKcMZee4ud8VqoBxmx+tK
 OWFKa/zB74LpAFdrOq3ufheK1ilH3JkZrlroFmfJTDRTqLZtvAuQLcWXP6lKzRkS2DHH
 seQFSGUFEg1idCn8f73yik34ADdOobrrvS20O4CyttWfe1DDRcC11kb7uh3T7MKrtQkw
 seVHesN3Blg8M10Dpisbv/CQD7rJj6YgS+SCfNE7sykayZkNN7Sqb51gC7uetnCdwwga
 7KgQ==
X-Gm-Message-State: AOAM531uJb7fmX7CwqDq/CN19y3y/iLBRMXYoezAhTSp9nDbqdb0o5mh
 uAUUZ9Smf7RXx61Jil5MAun30rPA9Wy/bCc/Vc+8pGa5AyXc+zUNmD0H6BXCfpb02FD1yBHbiyN
 V7UPMT99Bq5uEJfnLiXCtyC6qbHm2akxfXwsTC2cDnofYn/sJqsQeTg/KLKkP
X-Received: by 2002:adf:a212:: with SMTP id p18mr59844559wra.353.1621008253921; 
 Fri, 14 May 2021 09:04:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAQonu0gl3F5sCwMsVuOcoxWuVE5mtYBNyV4kgPqMAI25ur19qWzJ8bJztNY4xlE+R6yevtA==
X-Received: by 2002:adf:a212:: with SMTP id p18mr59844516wra.353.1621008253627; 
 Fri, 14 May 2021 09:04:13 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id f13sm3319918wrt.86.2021.05.14.09.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:13 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] x86: acpi: use offset instead of pointer when using
 build_header()
Message-ID: <20210514160245.91918-3-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Eduardo Habkost <ehabkost@redhat.com>, mst@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Do the same as in commit
 (4d027afeb3a97 Virt: ACPI: fix qemu assert due to re-assigned table data address)
for remaining tables that happen to use saved at
the beginning pointer to build header to avoid assert
when table_data is relocated due to implicit re-size.

In this case user is trying to start Windows 10 and getting assert at
 hw/acpi/bios-linker-loader.c:239:
  bios_linker_loader_add_checksum: Assertion `start_offset < file->blob->len' failed.

Fixes: https://bugs.launchpad.net/bugs/1923497
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210414084356.3792113-1-imammedo@redhat.com>
Cc: mst@redhat.com, qemu-stable@nongnu.org
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/aml-build.c  | 15 +++++++++------
 hw/i386/acpi-build.c |  8 ++++++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d33ce8954a..f0035d2b4a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1830,6 +1830,7 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     int i;
     unsigned rsdt_entries_offset;
     AcpiRsdtDescriptorRev1 *rsdt;
+    int rsdt_start = table_data->len;
     const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
     const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
     const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
@@ -1846,7 +1847,8 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
-                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
+                 (void *)(table_data->data + rsdt_start),
+                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
 }
 
 /* Build xsdt table */
@@ -1857,6 +1859,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     int i;
     unsigned xsdt_entries_offset;
     AcpiXsdtDescriptorRev2 *xsdt;
+    int xsdt_start = table_data->len;
     const unsigned table_data_len = (sizeof(uint64_t) * table_offsets->len);
     const unsigned xsdt_entry_size = sizeof(xsdt->table_offset_entry[0]);
     const size_t xsdt_len = sizeof(*xsdt) + table_data_len;
@@ -1873,7 +1876,8 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
-                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
+                 (void *)(table_data->data + xsdt_start),
+                 "XSDT", xsdt_len, 1, oem_id, oem_table_id);
 }
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
@@ -2053,10 +2057,9 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
     uint64_t control_area_start_address;
     TPMIf *tpmif = tpm_find();
     uint32_t start_method;
-    void *tpm2_ptr;
 
     tpm2_start = table_data->len;
-    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
 
     /* Platform Class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
@@ -2095,8 +2098,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
     build_header(linker, table_data,
-                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, oem_id,
-                 oem_table_id);
+                 (void *)(table_data->data + tpm2_start),
+                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
 }
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750aef..daaf8f473e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1816,6 +1816,7 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
            const char *oem_table_id)
 {
     Acpi20Hpet *hpet;
+    int hpet_start = table_data->len;
 
     hpet = acpi_data_push(table_data, sizeof(*hpet));
     /* Note timer_block_id value must be kept in sync with value advertised by
@@ -1824,13 +1825,15 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     hpet->timer_block_id = cpu_to_le32(0x8086a201);
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
-                 (void *)hpet, "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
+                 (void *)(table_data->data + hpet_start),
+                 "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
 }
 
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                const char *oem_id, const char *oem_table_id)
 {
+    int tcpa_start = table_data->len;
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
     unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
     unsigned log_addr_offset =
@@ -1849,7 +1852,8 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
         ACPI_BUILD_TPMLOG_FILE, 0);
 
     build_header(linker, table_data,
-                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
+                 (void *)(table_data->data + tcpa_start),
+                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
 }
 
 #define HOLE_640K_START  (640 * KiB)
-- 
MST


