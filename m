Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68573422DC7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:21:21 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnBw-0001yc-ET
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmt5-0000TO-5P
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmt2-0005F3-2i
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GewG1EB37GBDRhgQ1Kl9yzLGlVVtEVSTzhe6jW3BaLE=;
 b=WteKGAvS3LscAfhovCTbndd7VhvXEAMahtOiZyfl8RBEgJuHU1Ctt7aHP/qu4xscyzf44O
 uevbF9crdjetZpeW7YsFMJHO11HGykdxPYEfbMujAPTirQ/+Co3TFXaYq6tSV5ejYHS9Nl
 qyozhyD9tcmJ7w+TiTbhYPZm0sqNfVU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-4YcHcSEDNiG8-HQXjN7tlw-1; Tue, 05 Oct 2021 12:01:41 -0400
X-MC-Unique: 4YcHcSEDNiG8-HQXjN7tlw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n18-20020adff092000000b001609d9081d4so2919538wro.18
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GewG1EB37GBDRhgQ1Kl9yzLGlVVtEVSTzhe6jW3BaLE=;
 b=ernQmdOhROb9Dqtljm5Tz0nM1f4jnkVkj0tcxiYRhj0cd00+OKiFKFkE6N1+NnnrZR
 +5FjNwU7VXAORbwyogouW4r4OOpjVEm0TwlB67beiRHTSTgrA/FKxNHJg709lxdF3DJ9
 SXtFBSyh0jICBFUrTo68q3mXK415K/dUiV82HG57dMTKxgnU328N+vJ+gmXMpytkoBHp
 m3JeoTP8bPNrSq3iWE3mIPxQQfmvTa98jUvKlvLY2lV9kNcANwg38uJuAGBOeotRAGBM
 A32u4JfxB/AuFRxfzJ6yzvO3zYJXhEslplTPGn99BIbmWlbY55OVDpZsS9A4mH7SnicT
 iUmA==
X-Gm-Message-State: AOAM532h5dB7VzjRVvF/0K8Wra+nRZiDDh3OSLeVmByt4Cwvf/Be5Jq4
 SSjzYw1BMMBSvf/w4UoGdDcpY66AvnX/IWKmn/Pp8113vtp2qilv/Z/hF3Pz36VmxAfCjVUCg+C
 ISKii9BNjaNa5O6lP2OcQR7OdEm7miKbbvcySZ4Fxv8xVX+9VnVVh9meEpW6A
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr22571106wrm.181.1633449699118; 
 Tue, 05 Oct 2021 09:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/d6sl5bo0zuNf0CKoWSQNUFhGEtor1u2LVmVB8619MzHeYpmpkkxvEfmzYVFB9czCYHZ5JQ==
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr22571054wrm.181.1633449698837; 
 Tue, 05 Oct 2021 09:01:38 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id d129sm2670136wmd.23.2021.10.05.09.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:38 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/57] acpi: add helper routines to initialize ACPI tables
Message-ID: <20211005155946.513818-16-mst@redhat.com>
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
 Yanan Wang <wangyanan55@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Patch introduces acpi_table_begin()/ acpi_table_end() API
that hides pointer/offset arithmetic from user as opposed
to build_header(), to prevent errors caused by it [1].

 acpi_table_begin():
     initializes table header and keeps track of
     table data/offsets
 acpi_table_end():
     sets actual table length and tells bios loader
     where table is for the later initialization on
     guest side.

1) commits
   bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
   4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
---
 include/hw/acpi/aml-build.h | 31 +++++++++++++++++++
 hw/acpi/aml-build.c         | 62 +++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 471266d739..4242382399 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -413,6 +413,37 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
 Aml *aml_object_type(Aml *object);
 
 void build_append_int_noprefix(GArray *table, uint64_t value, int size);
+
+typedef struct AcpiTable {
+    const char *sig;
+    const uint8_t rev;
+    const char *oem_id;
+    const char *oem_table_id;
+    /* private vars tracking table state */
+    GArray *array;
+    unsigned table_offset;
+} AcpiTable;
+
+/**
+ * acpi_table_begin:
+ * initializes table header and keeps track of
+ * table data/offsets
+ * @desc: ACPI table descriptor
+ * @array: blob where the ACPI table will be composed/stored.
+ */
+void acpi_table_begin(AcpiTable *desc, GArray *array);
+
+/**
+ * acpi_table_end:
+ * sets actual table length and tells bios loader
+ * where table is for the later initialization on
+ * guest side.
+ * @linker: reference to BIOSLinker object to use for the table
+ * @table: ACPI table descriptor that was used with @acpi_table_begin
+ * counterpart
+ */
+void acpi_table_end(BIOSLinker *linker, AcpiTable *table);
+
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d5103e6d7b..229a3eb654 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
     g_array_append_val(array, val);
 }
 
+static void build_append_padded_str(GArray *array, const char *str,
+                                    size_t maxlen, char pad)
+{
+    size_t i;
+    size_t len = strlen(str);
+
+    g_assert(len <= maxlen);
+    g_array_append_vals(array, str, len);
+    for (i = maxlen - len; i > 0; i--) {
+        g_array_append_val(array, pad);
+    }
+}
+
 static void build_append_array(GArray *array, GArray *val)
 {
     g_array_append_vals(array, val->data, val->len);
@@ -1692,6 +1705,55 @@ Aml *aml_object_type(Aml *object)
     return var;
 }
 
+void acpi_table_begin(AcpiTable *desc, GArray *array)
+{
+
+    desc->array = array;
+    desc->table_offset = array->len;
+
+    /*
+     * ACPI spec 1.0b
+     * 5.2.3 System Description Table Header
+     */
+    g_assert(strlen(desc->sig) == 4);
+    g_array_append_vals(array, desc->sig, 4); /* Signature */
+    /*
+     * reserve space for Length field, which will be patched by
+     * acpi_table_end() when the table creation is finished.
+     */
+    build_append_int_noprefix(array, 0, 4); /* Length */
+    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
+    build_append_int_noprefix(array, 0, 1); /* Checksum */
+    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
+    /* OEM Table ID */
+    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
+    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
+    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
+    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
+}
+
+void acpi_table_end(BIOSLinker *linker, AcpiTable *desc)
+{
+    /*
+     * ACPI spec 1.0b
+     * 5.2.3 System Description Table Header
+     * Table 5-2 DESCRIPTION_HEADER Fields
+     */
+    const unsigned checksum_offset = 9;
+    uint32_t table_len = desc->array->len - desc->table_offset;
+    uint32_t table_len_le = cpu_to_le32(table_len);
+    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
+
+    /* patch "Length" field that has been reserved by acpi_table_begin()
+     * to the actual length, i.e. accumulated table length from
+     * acpi_table_begin() till acpi_table_end()
+     */
+    memcpy(len_ptr, &table_len_le, sizeof table_len_le);
+
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
+        desc->table_offset, table_len, desc->table_offset + checksum_offset);
+}
+
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-- 
MST


