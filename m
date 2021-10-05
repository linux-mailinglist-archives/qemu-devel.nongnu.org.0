Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465BF422E30
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:42:42 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnWb-0002lI-AM
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvB-00022y-Hb
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv7-0006vb-Qc
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kCUnt/5lnjXWXncziu2KeMM1suaM9LHoeUo+n9gijko=;
 b=S5GXS3561cCpOkgeuKl9UKWaBOQzKvl3pXf1f4IpglTUklS6y85K6bqs/pf/LFwgBt5Buo
 Y4nzM6MSZYCvW/FFd3HPgZxccrZsw0lLkfAP9qbgbJ+OKYYdjDU7MfhUnh7rdbOD380PP6
 k23f3shMtyYWmN5weYcAgbmAtjuxkIg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-LKr6Yp09MPWdY2CreUL-AQ-1; Tue, 05 Oct 2021 12:03:56 -0400
X-MC-Unique: LKr6Yp09MPWdY2CreUL-AQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n3-20020a7bcbc3000000b0030b68c4de38so1216831wmi.8
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kCUnt/5lnjXWXncziu2KeMM1suaM9LHoeUo+n9gijko=;
 b=Y+fPXVzFDzh5acXl4XOhFUMi7o7BlWFQWJtKE4a/tuCKgiVMn2BhaOQlt8SEhJ+6pn
 GxmoKc0pVp+UncKDU5DjSGwF6P93pEXy4EiBQ97W43xeY2SaYMwKSs9u3dDoM3n83mCl
 ZzEOHhbniELENE/bFxzVqAXwM+kucNjk/7dUFOkPgDkgQm7o4UnwCXTeWHFEbs75+VoT
 UHJLDdiQQ8vPmVyx89SBpPv2m5mwJuCbwGAfGagzF7IreebApxs74rvLcoEz+TloR/cI
 h6eKsw5Dkj1a+nWEgkP7/Dt8M1vmRUuHJUwqJaWJ64wizx50xcIaBolPJ3gD/SRUHe/K
 dEpA==
X-Gm-Message-State: AOAM532E52K8Okj6BwjWba0rwxGj15adTVQoIVBlFXZ2Yij3ap3plY1f
 yKIJaeJUJOup6F/n7njZ/UxermsI39dtgfDrWlw7rdpDUGL3tsKZw1JJbOIcHUsmVoz26/zb+av
 urweB45G0jvBj+qEpOnFK3ctCqEm0pmBD+XaAX36epNRVE5J3iXWzhqUlI3DV
X-Received: by 2002:adf:bb52:: with SMTP id x18mr16266614wrg.169.1633449834360; 
 Tue, 05 Oct 2021 09:03:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG8g3hY/MoT6x6Zf7OH3VIa6+b/cg/8jJNKyuaV1pCsGF2LYza9WX/EN/WzD51937FhBTq5g==
X-Received: by 2002:adf:bb52:: with SMTP id x18mr16266570wrg.169.1633449834085; 
 Tue, 05 Oct 2021 09:03:54 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id c14sm17876664wrd.50.2021.10.05.09.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:53 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/57] acpi: arm: virt: build_iort: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-43-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-29-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 14 ------------
 hw/arm/virt-acpi-build.c    | 44 +++++++++++++++----------------------
 2 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index bcada37601..195f90caf6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -188,20 +188,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-/*
- * Input Output Remapping Table (IORT)
- * Conforms to "IO Remapping Table System Software on ARM Platforms",
- * Document number: ARM DEN 0049B, October 2015
- */
-
-struct AcpiIortTable {
-    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
-    uint32_t node_count;
-    uint32_t node_offset;
-    uint32_t reserved;
-} QEMU_PACKED;
-typedef struct AcpiIortTable AcpiIortTable;
-
 /*
  * IORT node types
  */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4b9687439d..42ea460313 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -273,20 +273,26 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
     return idmap_a->input_base - idmap_b->input_base;
 }
 
+/*
+ * Input Output Remapping Table (IORT)
+ * Conforms to "IO Remapping Table System Software on ARM Platforms",
+ * Document number: ARM DEN 0049B, October 2015
+ */
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    int i, nb_nodes, rc_mapping_count, iort_start = table_data->len;
+    int i, nb_nodes, rc_mapping_count;
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
-    AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
-    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
+    const uint32_t iort_node_offset = 48;
+    size_t node_size, smmu_offset = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
-    iort = acpi_data_push(table_data, sizeof(*iort));
+    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping next_range = {0};
@@ -325,18 +331,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         rc_mapping_count = 1;
     }
 
-    iort_length = sizeof(*iort);
-    iort->node_count = cpu_to_le32(nb_nodes);
-    /*
-     * Use a copy in case table_data->data moves during acpi_data_push
-     * operations.
-     */
-    iort_node_offset = sizeof(*iort);
-    iort->node_offset = cpu_to_le32(iort_node_offset);
+    /* Table 2 The IORT */
+    acpi_table_begin(&table, table_data);
+    /* Number of IORT Nodes */
+    build_append_int_noprefix(table_data, nb_nodes, 4);
+    /* Offset to Array of IORT Nodes */
+    build_append_int_noprefix(table_data, iort_node_offset, 4);
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
     /* ITS group node */
     node_size =  sizeof(*its) + sizeof(uint32_t);
-    iort_length += node_size;
     its = acpi_data_push(table_data, node_size);
 
     its->type = ACPI_IORT_NODE_ITS_GROUP;
@@ -350,7 +354,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* SMMUv3 node */
         smmu_offset = iort_node_offset + node_size;
         node_size = sizeof(*smmu) + sizeof(*idmap);
-        iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
@@ -375,7 +378,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     /* Root Complex Node */
     node_size = sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
-    iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
@@ -424,19 +426,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
+    acpi_table_end(linker, &table);
     g_array_free(smmu_idmaps, true);
     g_array_free(its_idmaps, true);
-
-    /*
-     * Update the pointer address in case table_data->data moves during above
-     * acpi_data_push operations.
-     */
-    iort = (AcpiIortTable *)(table_data->data + iort_start);
-    iort->length = cpu_to_le32(iort_length);
-
-    build_header(linker, table_data, (void *)(table_data->data + iort_start),
-                 "IORT", table_data->len - iort_start, 0, vms->oem_id,
-                 vms->oem_table_id);
 }
 
 static void
-- 
MST


