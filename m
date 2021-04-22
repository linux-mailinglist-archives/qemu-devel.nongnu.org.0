Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A7F3688FF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 00:27:00 +0200 (CEST)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZhml-0004yO-U6
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 18:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lZhkv-0003R9-D7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lZhkt-0003Ob-1L
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619130302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAhi6mSwd1RX4WD+1Zv1SP4t5UQUzTU38vJXZ1UaeGQ=;
 b=SEJTcXACNME4cfrW2x1c11Bx9mVl3gJZmNh3a3nC463GJRYh8A+K25VcFxIlMzZI4eDL+x
 1MdLNZZ9jZG02m28O+ddiCMbXb6UwXUuKmzFM18OM1tvwmWHs+7I+CKlPimtCCPSY3zpIc
 Nch7aSEimvkcC2OELGuPgQlwThjvua8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-tofJlhdcOZqGfXq5kQNJxw-1; Thu, 22 Apr 2021 18:24:58 -0400
X-MC-Unique: tofJlhdcOZqGfXq5kQNJxw-1
Received: by mail-ed1-f70.google.com with SMTP id
 m18-20020a0564025112b0290378d2a266ebso17504273edd.15
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 15:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rAhi6mSwd1RX4WD+1Zv1SP4t5UQUzTU38vJXZ1UaeGQ=;
 b=nJ3lw9jg1S5AIdUiPkQXy5VoKggycU9vN++DxThFagV3ni6iOZtGxQYzB8kS6ABpEZ
 /SsRV5/hvKMqgmP5/P4hbpH7sbPjkm6eojw6weXCSY+GZ1IRRaQc+UcQFw/TYvVjxKPn
 gQHd8lxgILOAjSmU9+zgD8vUTa4xe5kUuSwPxh7ACySNxaVQzW1gHx+NiX2j9WLQJjuX
 70hpPBW1F0eJMToLQQTxGkIYPC8Jat2FdvuiAxOwSkH9cGNX9kr/+qhkPpkUJEm7kwqr
 U2RVzUdA0arzA2Iy+yebyx0NfkdzMZV5MBUSSuryZODOPsbzBFJa6v7tY7TAZeYj/x5m
 rCbA==
X-Gm-Message-State: AOAM533fSE0FWQIVsOgE7rehkrgpjFFOEyHlcMBtO5dX8ctHguYbVoqx
 lPZXw1vHixgV2m6/77zgV5yoPw84WaEasFFZpfM9/70NNjvahnLkw/tOFbtmVbACgbQdJHZJo3F
 s2AZaOCBt5vw+5R0XA312GT80+UuMmoGAC/fcPC5J+IxeQceMblp7MPfxz144
X-Received: by 2002:aa7:dd4d:: with SMTP id o13mr795943edw.53.1619130296855;
 Thu, 22 Apr 2021 15:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAI1vuU2m3KbBRuuL4ivrDq6eVeYQuHQFCg+5CfuAQGnx6W3RkPoSd8Dhuziu9sfuf91psWg==
X-Received: by 2002:aa7:dd4d:: with SMTP id o13mr795918edw.53.1619130296602;
 Thu, 22 Apr 2021 15:24:56 -0700 (PDT)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id b22sm3127760edv.96.2021.04.22.15.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 15:24:56 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:24:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] x86: acpi: use offset instead of pointer when using
 build_header()
Message-ID: <20210422222429.183108-3-mst@redhat.com>
References: <20210422222429.183108-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422222429.183108-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


