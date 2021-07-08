Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D73C173E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:44:01 +0200 (CEST)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X84-0006wf-O3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WFZ-0003uE-2G
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WFX-0000id-9C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb+PvLgZufLrzfqusdcOyVwf3nnT4JGkI6mhdNzNCfY=;
 b=N+qSOvBUjGLIA5OPwzRqpeH3M+Zswoxc9LasqJmglX/KKImQ8LFsLWpRyzMTnO7HVbi51y
 4aMpZQFQhNZGWONmDUSwRwNSbwE9R0IZtfuumLw+YpuzrNJA5xMGc571/OSlUPou3S9fDD
 3QaBJQoYLgP+QxwvoeD2Qga/pSYT9lY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108--4oQ1Ks0OXy6yEBAP-BRWA-1; Thu, 08 Jul 2021 11:47:33 -0400
X-MC-Unique: -4oQ1Ks0OXy6yEBAP-BRWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7146E802E61
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 15:47:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB39619C66;
 Thu,  8 Jul 2021 15:47:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/35] acpi: remove no longer used build_header()
Date: Thu,  8 Jul 2021 11:46:16 -0400
Message-Id: <20210708154617.1538485-35-imammedo@redhat.com>
In-Reply-To: <20210708154617.1538485-1-imammedo@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 25 -------------------------
 include/hw/acpi/aml-build.h |  4 ----
 hw/acpi/aml-build.c         | 23 -----------------------
 3 files changed, 52 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 1a0774edd6..ee733840aa 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -48,31 +48,6 @@ typedef struct AcpiRsdpData {
     unsigned *xsdt_tbl_offset;
 } AcpiRsdpData;
 
-/* Table structure from Linux kernel (the ACPI tables are under the
-   BSD license) */
-
-
-#define ACPI_TABLE_HEADER_DEF   /* ACPI common table header */ \
-    uint32_t signature;          /* ACPI signature (4 ASCII characters) */ \
-    uint32_t length;                 /* Length of table, in bytes, including header */ \
-    uint8_t  revision;               /* ACPI Specification minor version # */ \
-    uint8_t  checksum;               /* To make sum of entire table == 0 */ \
-    uint8_t  oem_id[6] \
-                 QEMU_NONSTRING;     /* OEM identification */ \
-    uint8_t  oem_table_id[8] \
-                 QEMU_NONSTRING;     /* OEM table identification */ \
-    uint32_t oem_revision;           /* OEM revision number */ \
-    uint8_t  asl_compiler_id[4] \
-                 QEMU_NONSTRING;     /* ASL compiler vendor ID */ \
-    uint32_t asl_compiler_revision;  /* ASL compiler revision number */
-
-
-/* ACPI common table header */
-struct AcpiTableHeader {
-    ACPI_TABLE_HEADER_DEF
-} QEMU_PACKED;
-typedef struct AcpiTableHeader AcpiTableHeader;
-
 struct AcpiGenericAddress {
     uint8_t space_id;        /* Address space where struct or register exists */
     uint8_t bit_width;       /* Size in bits of given register */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de7d50a5a0..c53e4b2988 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -428,10 +428,6 @@ typedef struct AcpiTable {
 void acpi_init_table(AcpiTable *desc, GArray *array);
 void acpi_table_composed(BIOSLinker *linker, AcpiTable *table);
 
-void
-build_header(BIOSLinker *linker, GArray *table_data,
-             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 91c30c32fc..3aec332790 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1750,29 +1750,6 @@ void acpi_table_composed(BIOSLinker *linker, AcpiTable *desc)
         desc->table_offset, table_len, desc->table_offset + checksum_offset);
 }
 
-void
-build_header(BIOSLinker *linker, GArray *table_data,
-             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id)
-{
-    unsigned tbl_offset = (char *)h - table_data->data;
-    unsigned checksum_offset = (char *)&h->checksum - table_data->data;
-    memcpy(&h->signature, sig, 4);
-    h->length = cpu_to_le32(len);
-    h->revision = rev;
-
-    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
-    strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
-              oem_table_id, ' ');
-
-    h->oem_revision = cpu_to_le32(1);
-    memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);
-    h->asl_compiler_revision = cpu_to_le32(1);
-    /* Checksum to be filled in by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
-        tbl_offset, len, checksum_offset);
-}
-
 void *acpi_data_push(GArray *table_data, unsigned size)
 {
     unsigned off = table_data->len;
-- 
2.27.0


