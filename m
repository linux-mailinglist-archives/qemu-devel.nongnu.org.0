Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1673422DE1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:24:44 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnFD-00007n-Rp
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmts-0001EG-7z
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtj-0005lo-7y
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RaPq5iLVSqv5CKFO6b2yRg6rjdJgidYZmZppuNmLLzA=;
 b=YMS3jd7DJoAOqvXZ+JH72bVdud+PPZkChwT1SPvF3Iq5puksWO8tmK/ztV+WxTDy2EvK0f
 rgWc64ZDefHNVRaicKB7qqHj95PPEdAJhAb+As8Go7tQpdwTrXHkHgqlmPMRfEM9l4lGmM
 +//O0Z/Q1L2tmKG4JjPhvEFc9eGPMSo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-qFQdpNvjMQqlxCTK7_Y8Gg-1; Tue, 05 Oct 2021 12:02:27 -0400
X-MC-Unique: qFQdpNvjMQqlxCTK7_Y8Gg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso5900651wrn.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RaPq5iLVSqv5CKFO6b2yRg6rjdJgidYZmZppuNmLLzA=;
 b=RKOIQ8JPZbMrpXMTO4clr8I0tUQ+mJsm+MhKW8WJwx4sagpQXEzce/LOgN7DF5ahP+
 ZF/G4C/jwKu6gHLD15owmboQ00Y5/bJsV0aG50TTiB83ApIz8psFCc6nOcK8xFpNgmf6
 rpu+6L8Ji+174okb0EREXJRRWXwuuUjKpzc9hufZffzc2lE51Oc4Ke8fbAeZSLX1VX+z
 ZmtePT+NqG353KwDFcod2gAwtkYXrovXhEpLfGJwXvd+ZG1FV8D2Yn0qS4Vp2g6d9jPd
 3jtn/Rn8VRquk1sehr2boZfTp94YwIsiiNokJluQxOoMa1TNEGz6X3vEYrwsa41hTluy
 UuuA==
X-Gm-Message-State: AOAM530990tLI6wE55MjEpsTuN/DH5WqfIn7sqTn0Dg1RRZcFhMfbR5S
 Mo7/yoP0v6kHreJc7Jy2g0ccia/wNcATING9/1L6BjwB+HvYOu2mLZKWDvZSrnjpZz/SV58mHg4
 72Z2q4nbZn+9gp5BHjRz88OeZ3kvfl/ILKG6voRR/WaaidmJbMLMarTS9w6FW
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr23168640wrs.295.1633449746017; 
 Tue, 05 Oct 2021 09:02:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEZvx3aGU6gmEznAo7QleslkEM42wt+CwTZFNy9r6S6ApZgasKsHBDM5Scqw/p18JeutjkpQ==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr23168607wrs.295.1633449745810; 
 Tue, 05 Oct 2021 09:02:25 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id n15sm18787269wrg.58.2021.10.05.09.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:24 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/57] acpi: nvdimm_build_ssdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-26-mst@redhat.com>
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-12-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/nvdimm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 15f6ca82ca..a7539cfe89 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1274,14 +1274,15 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                               NVDIMMState *nvdimm_state,
                               uint32_t ram_slots, const char *oem_id)
 {
+    int mem_addr_offset;
     Aml *ssdt, *sb_scope, *dev;
-    int mem_addr_offset, nvdimm_ssdt;
+    AcpiTable table = { .sig = "SSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = "NVDIMM" };
 
     acpi_add_table(table_offsets, table_data);
 
+    acpi_table_begin(&table, table_data);
     ssdt = init_aml_allocator();
-    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
-
     sb_scope = aml_scope("\\_SB");
 
     dev = aml_device("NVDR");
@@ -1310,8 +1311,6 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     aml_append(sb_scope, dev);
     aml_append(ssdt, sb_scope);
 
-    nvdimm_ssdt = table_data->len;
-
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
     mem_addr_offset = build_append_named_dword(table_data,
@@ -1323,10 +1322,13 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
         NVDIMM_DSM_MEM_FILE, 0);
-    build_header(linker, table_data,
-        (void *)(table_data->data + nvdimm_ssdt),
-                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
     free_aml_allocator();
+    /*
+     * must be executed as the last so that pointer patching command above
+     * would be executed by guest before it recalculated checksum which were
+     * scheduled by acpi_table_end()
+     */
+    acpi_table_end(linker, &table);
 }
 
 void nvdimm_build_srat(GArray *table_data)
-- 
MST


