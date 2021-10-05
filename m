Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F19422E1A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:37:27 +0200 (CEST)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnRW-0001Ti-L9
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuP-0001Zl-Dv
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuG-00069D-UB
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZ0kMDIZcaXR+/0+/mgU2Zp3J1xHpo24a4ipyZEtxio=;
 b=Ze/rLz5DW70eLbf0buRA8meQWlphJpT+NF0hJQyW5BsjdrkwVyGWSBmKL0GTkbkm0blkfY
 wzMNreOJpSHPiS4rffte2nZgOSdOs2aKU9A4n5prUeBt8lUArZQSxuswA0cZ4qofB+0NAi
 olPnGv1X///e1irGhIm1Rw43CinQJ2k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-BDm8XrtJNG6fPeMj2uqolg-1; Tue, 05 Oct 2021 12:02:55 -0400
X-MC-Unique: BDm8XrtJNG6fPeMj2uqolg-1
Received: by mail-wm1-f70.google.com with SMTP id
 s10-20020a1cf20a000000b0030d66991388so1490053wmc.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nZ0kMDIZcaXR+/0+/mgU2Zp3J1xHpo24a4ipyZEtxio=;
 b=23osnVHg1nMq3VdMq4Ttsjd+eAOsCXra/dji9RvE5no7YWEnC9lADAKO+zgC2mqusY
 rALCJ9MdEqNKG6id5zHKE5GxD2QZIgqVQFeWM3kSnKTmixYcYSsaH+Q8weNZ6HCzjtz3
 v1DxnI6QQ/mroIj9rmqzxSvzvOSoud4MfJyj44i3OTiok5PRyDx7I2/qBl+8XaKN2LB/
 XGs3zwk2QMABaIwk7UqJejzLDmGMe1/zZTOzak4rT1fnercqOj3qVGVUNZB9ylxU8+KH
 4ncRLk1Xb8vIdJ+uJ4kKMIJAsHdrCCzvdLUYbs7dwk59oxVpJYKK8t8Jlon5HE4tpbtq
 /CDw==
X-Gm-Message-State: AOAM5302vAW9aJd0K1xGLTLl/YUZpGGXfTu3K0uofMl6oPRVacdigTSK
 8Y4MDVoa/qwHGpc80l4+I1uzcX1T0uvG7YLWc4CrG9Nil3XDTkmqZScyR6GDU9s8zx0kL+645HT
 g33q3fzQ49NBPhpRUI//x3wc//EkrNcmlymLz+7mseZfSyCjhuHukLiHBDbrY
X-Received: by 2002:adf:8b47:: with SMTP id v7mr22322706wra.321.1633449773441; 
 Tue, 05 Oct 2021 09:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS8mT7JWUA5srwQjljC0SIJb57tsZ3SwNLQ+/gdObk9+ynYYEDdMcxer+8WhKlZeb9TZVxmg==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr22322556wra.321.1633449772362; 
 Tue, 05 Oct 2021 09:02:52 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id l11sm3101143wms.45.2021.10.05.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:51 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/57] acpi: build_tpm_tcpa: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-30-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
table entries (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-16-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 14 --------------
 hw/i386/acpi-build.c        | 38 ++++++++++++++++++++++---------------
 2 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 4d8f8b34b0..3b42b138f0 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -418,20 +418,6 @@ struct AcpiSratProcessorGiccAffinity {
 
 typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
 
-/*
- * TCPA Description Table
- *
- * Following Level 00, Rev 00.37 of specs:
- * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
- */
-struct Acpi20Tcpa {
-    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
-    uint16_t platform_class;
-    uint32_t log_area_minimum_length;
-    uint64_t log_area_start_address;
-} QEMU_PACKED;
-typedef struct Acpi20Tcpa Acpi20Tcpa;
-
 /* DMAR - DMA Remapping table r2.2 */
 struct AcpiTableDmar {
     ACPI_TABLE_HEADER_DEF
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 12d743d529..3310a3efc3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1900,31 +1900,39 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
 }
 
 #ifdef CONFIG_TPM
+/*
+ * TCPA Description Table
+ *
+ * Following Level 00, Rev 00.37 of specs:
+ * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
+ * 7.1.2 ACPI Table Layout
+ */
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                const char *oem_id, const char *oem_table_id)
 {
-    int tcpa_start = table_data->len;
-    Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
-    unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
-    unsigned log_addr_offset =
-        (char *)&tcpa->log_area_start_address - table_data->data;
+    unsigned log_addr_offset;
+    AcpiTable table = { .sig = "TCPA", .rev = 2,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
-    tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
-    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length));
+    acpi_table_begin(&table, table_data);
+    /* Platform Class */
+    build_append_int_noprefix(table_data, TPM_TCPA_ACPI_CLASS_CLIENT, 2);
+    /* Log Area Minimum Length (LAML) */
+    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
+    /* Log Area Start Address (LASA) */
+    log_addr_offset = table_data->len;
+    build_append_int_noprefix(table_data, 0, 8);
 
+    /* allocate/reserve space for TPM log area */
+    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
     bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false /* high memory */);
-
     /* log area start address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
-        ACPI_BUILD_TPMLOG_FILE, 0);
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+        log_addr_offset, 8, ACPI_BUILD_TPMLOG_FILE, 0);
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + tcpa_start),
-                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 #endif
 
-- 
MST


