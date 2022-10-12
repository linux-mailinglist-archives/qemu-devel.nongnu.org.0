Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F155FCA8F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:24:46 +0200 (CEST)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigPN-0006OO-VN
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMR-0002Jl-AE
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:43 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMP-0001yV-5L
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:42 -0400
Received: by mail-qk1-x743.google.com with SMTP id f8so3596642qkg.3
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AwYRwJUmb/ECwSOs8mOpcTqevLQDineADYqXRuc0klU=;
 b=RhNDsoH0/3AmCc0nN1MsZMs353OL2dxTcLWgkajs7Y+F7ND0WwDkXgvxCw+xb1/IdW
 PnDiO0tOBro8/VDNoNOeqoCCkqCSLaG7oxPIPpZVVt/WBy2GMRLfjnF7B9bzb2PPzLxs
 UD/uxS8FLD4ECzzgo62yrTHv4EozkWZznhzrrTy3R2CbDHiaAAnX3jywcWesXyPv8+kl
 969x1PtgWeqKdczaEDZI8PoeHZbc/K48SPtX4kM2OQVF7f32gM3BAPNZVOustZU3CPvq
 VqRTap6Fe5HWAm/91HvpgqNdTZn43uG2uHuokztxfFwkeAUt6FK1Rp4z3LyjvFr7qdLy
 NOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwYRwJUmb/ECwSOs8mOpcTqevLQDineADYqXRuc0klU=;
 b=WXSfz3fGINoL69ZC4UmUWK4LO+YZmbwH3CThG3cOq7SeTkFPAlVcmLmSCoCwRozkr1
 a6RAJlZaKNgUtupq8qDHp3Nv8GEE2YGv09LWl7yJQuDUs8cFOTng4kr5RW6TRwdzWf1V
 h+Ms990FR+kfpfPCIGCctoKZSam9dJLmQCWgx4KBUeys16mmuFghnH2fdJBf/yLd6xn0
 9PWrYyVb5kCS4k54wn5IpdWII/H5r/PXe/91WahtKUToja5BgsGOlOA9Re9OqcxdkJbu
 a7SmjxGE40NYZORq2uBFj30ipbMX7VNVfZ9tDg2QP5KpzyVcDG+pqD6M6W05Z3MeibHJ
 Mv2A==
X-Gm-Message-State: ACrzQf06FcVsq0VIcELouhM+KRxY6P8EKvdQ+zu0yEog4Fm5M1kIXn5N
 t373yhmSSAlmnu59YIIfSg==
X-Google-Smtp-Source: AMsMyM7lYSTJ9D9LN2djFtz0k3yhYzKbW6MSVPKNTKwxtp9ZebLEkF8G6/Oo1vmWDAvi6mkdvKyzKw==
X-Received: by 2002:a05:620a:4081:b0:6ee:80ab:25b6 with SMTP id
 f1-20020a05620a408100b006ee80ab25b6mr6675429qko.517.1665598899339; 
 Wed, 12 Oct 2022 11:21:39 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 bq40-20020a05620a46a800b006ee9d734479sm920228qkb.33.2022.10.12.11.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:21:39 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 5/5] hw/mem/cxl_type3: Refactor CDAT sub-table entry
 initialization into a function
Date: Wed, 12 Oct 2022 14:21:20 -0400
Message-Id: <20221012182120.174142-6-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221012182120.174142-1-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x743.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CDAT can contain multiple entries for multiple memory regions, this
will allow us to re-use the initialization code when volatile memory
region support is added.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/mem/cxl_type3.c | 137 ++++++++++++++++++++++++---------------------
 1 file changed, 72 insertions(+), 65 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 220b9f09a9..3c5485abd0 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -19,117 +19,93 @@
 #define DWORD_BYTE 4
 #define CT3_CDAT_SUBTABLE_SIZE 6
 
-static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
-                                void *priv)
+static int ct3_build_cdat_subtable(CDATSubHeader **cdat_table,
+        MemoryRegion *mr, int dsmad_handle)
 {
-    g_autofree CDATDsmas *dsmas_nonvolatile = NULL;
-    g_autofree CDATDslbis *dslbis_nonvolatile1 = NULL;
-    g_autofree CDATDslbis *dslbis_nonvolatile2 = NULL;
-    g_autofree CDATDslbis *dslbis_nonvolatile3 = NULL;
-    g_autofree CDATDslbis *dslbis_nonvolatile4 = NULL;
-    g_autofree CDATDsemts *dsemts_nonvolatile = NULL;
-    CXLType3Dev *ct3d = priv;
-    int next_dsmad_handle = 0;
-    int nonvolatile_dsmad = -1;
-    MemoryRegion *mr;
-
-    if (!ct3d->hostmem) {
-        return 0;
-    }
-
-    mr = host_memory_backend_get_memory(ct3d->hostmem);
-    if (!mr) {
-        return -EINVAL;
-    }
-
-    *cdat_table = g_malloc0(CT3_CDAT_SUBTABLE_SIZE * sizeof(*cdat_table));
-    if (!*cdat_table) {
-        return -ENOMEM;
-    }
-
-    /* Non volatile aspects */
-    dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
-    dslbis_nonvolatile1 = g_malloc(sizeof(*dslbis_nonvolatile1));
-    dslbis_nonvolatile2 = g_malloc(sizeof(*dslbis_nonvolatile2));
-    dslbis_nonvolatile3 = g_malloc(sizeof(*dslbis_nonvolatile3));
-    dslbis_nonvolatile4 = g_malloc(sizeof(*dslbis_nonvolatile4));
-    dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
-
-    if (!dsmas_nonvolatile || !dsemts_nonvolatile ||
-        !dslbis_nonvolatile1 || !dslbis_nonvolatile2 ||
-        !dslbis_nonvolatile3 || !dslbis_nonvolatile4) {
-        g_free(*cdat_table);
-        *cdat_table = NULL;
+    g_autofree CDATDsmas *dsmas = NULL;
+    g_autofree CDATDslbis *dslbis1 = NULL;
+    g_autofree CDATDslbis *dslbis2 = NULL;
+    g_autofree CDATDslbis *dslbis3 = NULL;
+    g_autofree CDATDslbis *dslbis4 = NULL;
+    g_autofree CDATDsemts *dsemts = NULL;
+
+    dsmas = g_malloc(sizeof(*dsmas));
+    dslbis1 = g_malloc(sizeof(*dslbis1));
+    dslbis2 = g_malloc(sizeof(*dslbis2));
+    dslbis3 = g_malloc(sizeof(*dslbis3));
+    dslbis4 = g_malloc(sizeof(*dslbis4));
+    dsemts = g_malloc(sizeof(*dsemts));
+
+    if (!dsmas || !dslbis1 || !dslbis2 || !dslbis3 || !dslbis4 || !dsemts) {
         return -ENOMEM;
     }
 
-    nonvolatile_dsmad = next_dsmad_handle++;
-    *dsmas_nonvolatile = (CDATDsmas) {
+    *dsmas = (CDATDsmas) {
         .header = {
             .type = CDAT_TYPE_DSMAS,
-            .length = sizeof(*dsmas_nonvolatile),
+            .length = sizeof(*dsmas),
         },
-        .DSMADhandle = nonvolatile_dsmad,
+        .DSMADhandle = dsmad_handle,
         .flags = CDAT_DSMAS_FLAG_NV,
         .DPA_base = 0,
         .DPA_length = int128_get64(mr->size),
     };
 
     /* For now, no memory side cache, plausiblish numbers */
-    *dslbis_nonvolatile1 = (CDATDslbis) {
+    *dslbis1 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile1),
+            .length = sizeof(*dslbis1),
         },
-        .handle = nonvolatile_dsmad,
+        .handle = dsmad_handle,
         .flags = HMAT_LB_MEM_MEMORY,
         .data_type = HMAT_LB_DATA_READ_LATENCY,
         .entry_base_unit = 10000, /* 10ns base */
         .entry[0] = 15, /* 150ns */
     };
 
-    *dslbis_nonvolatile2 = (CDATDslbis) {
+    *dslbis2 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile2),
+            .length = sizeof(*dslbis2),
         },
-        .handle = nonvolatile_dsmad,
+        .handle = dsmad_handle,
         .flags = HMAT_LB_MEM_MEMORY,
         .data_type = HMAT_LB_DATA_WRITE_LATENCY,
         .entry_base_unit = 10000,
         .entry[0] = 25, /* 250ns */
     };
 
-    *dslbis_nonvolatile3 = (CDATDslbis) {
+    *dslbis3 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile3),
+            .length = sizeof(*dslbis3),
         },
-        .handle = nonvolatile_dsmad,
+        .handle = dsmad_handle,
         .flags = HMAT_LB_MEM_MEMORY,
         .data_type = HMAT_LB_DATA_READ_BANDWIDTH,
         .entry_base_unit = 1000, /* GB/s */
         .entry[0] = 16,
     };
 
-    *dslbis_nonvolatile4 = (CDATDslbis) {
+    *dslbis4 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile4),
+            .length = sizeof(*dslbis4),
         },
-        .handle = nonvolatile_dsmad,
+        .handle = dsmad_handle,
         .flags = HMAT_LB_MEM_MEMORY,
         .data_type = HMAT_LB_DATA_WRITE_BANDWIDTH,
         .entry_base_unit = 1000, /* GB/s */
         .entry[0] = 16,
     };
 
-    *dsemts_nonvolatile = (CDATDsemts) {
+    *dsemts = (CDATDsemts) {
         .header = {
             .type = CDAT_TYPE_DSEMTS,
-            .length = sizeof(*dsemts_nonvolatile),
+            .length = sizeof(*dsemts),
         },
-        .DSMAS_handle = nonvolatile_dsmad,
+        .DSMAS_handle = dsmad_handle,
         /* Reserved - the non volatile from DSMAS matters */
         .EFI_memory_type_attr = 2,
         .DPA_offset = 0,
@@ -137,16 +113,47 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     };
 
     /* Header always at start of structure */
-    (*cdat_table)[0] = g_steal_pointer(&dsmas_nonvolatile);
-    (*cdat_table)[1] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile1);
-    (*cdat_table)[2] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile2);
-    (*cdat_table)[3] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile3);
-    (*cdat_table)[4] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile4);
-    (*cdat_table)[5] = g_steal_pointer(&dsemts_nonvolatile);
+    cdat_table[0] = g_steal_pointer(&dsmas);
+    cdat_table[1] = (CDATSubHeader *)g_steal_pointer(&dslbis1);
+    cdat_table[2] = (CDATSubHeader *)g_steal_pointer(&dslbis2);
+    cdat_table[3] = (CDATSubHeader *)g_steal_pointer(&dslbis3);
+    cdat_table[4] = (CDATSubHeader *)g_steal_pointer(&dslbis4);
+    cdat_table[5] = g_steal_pointer(&dsemts);
 
     return CT3_CDAT_SUBTABLE_SIZE;
 }
 
+static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
+                                void *priv)
+{
+    CXLType3Dev *ct3d = priv;
+    MemoryRegion *mr;
+    int ret = 0;
+
+    if (!ct3d->hostmem) {
+        return 0;
+    }
+
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        return -EINVAL;
+    }
+
+    *cdat_table = g_malloc0(CT3_CDAT_SUBTABLE_SIZE * sizeof(*cdat_table));
+    if (!*cdat_table) {
+        return -ENOMEM;
+    }
+
+    /* Non volatile aspects */
+    ret = ct3_build_cdat_subtable(*cdat_table, mr, 0);
+    if (ret < 0) {
+        g_free(*cdat_table);
+        *cdat_table = NULL;
+    }
+
+    return ret;
+}
+
 static void ct3_free_cdat_table(CDATSubHeader **cdat_table, int num, void *priv)
 {
     int i;
-- 
2.37.3


