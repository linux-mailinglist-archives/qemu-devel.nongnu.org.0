Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62878422E63
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:50:05 +0200 (CEST)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXndk-0006HU-Bv
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvY-0002HX-O8
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvV-0007GI-Gw
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V0izss/WrIaICyHQd8e5VrOUHntowQ9kw1uV7gNZ/NQ=;
 b=KW7pS12apofR3gbE8DpYT7olhnQrRzozuQlHy1TH221R6GqoDF4adMddgRgGfhJS+0SQ+7
 mdR58kOF6h6DHuAKxCnJWT1u5cbTY+AP0u/bTDUc1awFvYNY15oTAuTFylTxNh2wOnjIzc
 bWwNKZJ4kfCG/C/g3sF4OJUbHITQyRs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-2reFsZ1BOPu3H7tbVG5HZw-1; Tue, 05 Oct 2021 12:04:19 -0400
X-MC-Unique: 2reFsZ1BOPu3H7tbVG5HZw-1
Received: by mail-wm1-f72.google.com with SMTP id
 13-20020a05600c230d00b0030d762b5832so960641wmo.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V0izss/WrIaICyHQd8e5VrOUHntowQ9kw1uV7gNZ/NQ=;
 b=UrdY6V+TZMrq6LXo0GwLdV7pdiwVL1kGoXnHDadq30MF4TqAX24RF3crRdtOeghXnJ
 fl57SwaUMOkq1hH5XUzJSwkMy08QVrw5gKTQmq3FGfUwIxha5SrwcYUTFSqnsx9RYwQE
 Y4q9arqU0ePWKxbnceN2u7E6j1AljP3xp3BQQWq2VOhQtyKfG2rXz81oH3mzYlLojH8+
 IhlM7Pqf6e53Dm5KISwHwTxlGq8m5yDcRP8jzmYxA9UkJeIIEmBBXto0+ofFchrLJn+i
 j6Ig1o1Qlx4kN9qqoCL3uSgoWb6Ois0K5Kz5USdPVlhEuBNPy2Yjaqs9K0kJJz/eePGZ
 +MTA==
X-Gm-Message-State: AOAM533fkKeCPIG/J61iy/OGEYNZ0kMIGbMftWvm++180+6MM0c2ecS9
 XhI7rqGgdgI4k/GVEsXBLjPI93ILj1GKwySYad3kSQNsFTovZZ2xzq48XSTTHGPoCE/Rb/FggIQ
 J4HCqZVFc2K/m96ia08DjiXa7UFw00MuUgj5luRLrzKemCt/wKvmE5YiYLxKy
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2414287wmg.162.1633449857934; 
 Tue, 05 Oct 2021 09:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxhWOfRJzlI5eT02zEFPNCR/StX2cdFhLmBzBChMMheznb6DO0tUzCELNTrL7qU1vWsgqFYQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2414250wmg.162.1633449857654; 
 Tue, 05 Oct 2021 09:04:17 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t15sm8837659wru.6.2021.10.05.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:17 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/57] acpi: remove no longer used build_header()
Message-ID: <20211005155946.513818-49-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-35-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 6e1f42e119..3cf6f2c1b9 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -444,10 +444,6 @@ void acpi_table_begin(AcpiTable *desc, GArray *array);
  */
 void acpi_table_end(BIOSLinker *linker, AcpiTable *table);
 
-void
-build_header(BIOSLinker *linker, GArray *table_data,
-             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index c0f339847a..76af0ebaf9 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1754,29 +1754,6 @@ void acpi_table_end(BIOSLinker *linker, AcpiTable *desc)
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
MST


