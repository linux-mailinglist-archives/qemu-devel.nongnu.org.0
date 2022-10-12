Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A299B5FCAA2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:27:47 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigSI-0001Vu-Pc
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMP-0002Fq-HL
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:41 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMK-0001y6-Ck
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:41 -0400
Received: by mail-qk1-x741.google.com with SMTP id f8so3596526qkg.3
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IktacSVymJ4XPCZWnpI70Qh+XpMKAyrOqOuaVfZ+z7M=;
 b=HUtZZy4YLvJmCpi4B9LSnmhnuAcZIx3YxOg8+glBpEoRFKMbdTEAzLPoADuTODqkxs
 d8MHJq7yZnOnh89QqA8rKcYYlhbm8HgFIXAPPQ8b5AYGPjBpY6tlrumHM1WuTq5KDitv
 nGV0oFEt3aH4Dn2Pg3rXZLHn2VdvuewYalojXdAq3e5ZOL0s2F1y6w/2rWNY77Shpb69
 c+yOXfSAGFrlYegQ0Jek5Ru1X62FY65RPlY8qoJ2tkd+W5DZbRZiyjnUp3ehQhJbCtNf
 etpHuSmY1UkhhdBvP2N6oUJV4n5xMCf4r3VidBGvDTZvHWO7iBEzVc3fxqE60CU24jFG
 KDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IktacSVymJ4XPCZWnpI70Qh+XpMKAyrOqOuaVfZ+z7M=;
 b=B+h2RI2I8y9K1+RNNQX7yH6O29fIJeEVhdPak4xeoWZYqJp6+SvSD9VheAVRKICube
 /yh9yuc3He/6J+1FtvbuE6TZ4Pa+Wte28Yt53QmgbCvbQG9iuga1xi6FxchlECs6TEbP
 Q1UrRy/U29dulFAZ/1srsBrNQu974eUVcaNr1buOh0+7G1KybqczwduEWv5qi6AO2+iX
 4qyWCgkrUB6bUUov5+Jo15X4zdfU7x3SzVyP0LqDzR2TltlvcKoJx4w6d5XwQ5xqB13o
 eX1QcwXVkXjZYBwC33PTEhUDHx48hrXmqj+bzQiUeL5+aemzy2l/qRF0Gk6nRbNS8+Em
 jCRw==
X-Gm-Message-State: ACrzQf0xE0ccBoJR2knUm3BUmU0hZkCSGKVAWPmywh/2qeAlnKGhFs/t
 1desnT9WsKFYyV0mrc1sXqi32GkJXA==
X-Google-Smtp-Source: AMsMyM7A4eoyN5KwTtSExyVRSKfjjEUI0Mvu7mnNU+2q9jNGEXRo6WDFrbnysRtbs7Al87blAXeluQ==
X-Received: by 2002:a05:620a:4694:b0:6ee:b286:281a with SMTP id
 bq20-20020a05620a469400b006eeb286281amr311258qkb.455.1665598895491; 
 Wed, 12 Oct 2022 11:21:35 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 bq40-20020a05620a46a800b006ee9d734479sm920228qkb.33.2022.10.12.11.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:21:35 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 2/5] hw/mem/cxl_type3: Pull validation checks ahead of
 functional code
Date: Wed, 12 Oct 2022 14:21:17 -0400
Message-Id: <20221012182120.174142-3-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221012182120.174142-1-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x741.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

For style - pulling these validations ahead flattens the code.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/mem/cxl_type3.c | 193 ++++++++++++++++++++++-----------------------
 1 file changed, 96 insertions(+), 97 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 94bc439d89..43b2b9e041 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -32,107 +32,106 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     int dslbis_nonvolatile_num = 4;
     MemoryRegion *mr;
 
+    if (!ct3d->hostmem) {
+        return len;
+    }
+
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        return -EINVAL;
+    }
+
     /* Non volatile aspects */
-    if (ct3d->hostmem) {
-        dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
-        if (!dsmas_nonvolatile) {
-            return -ENOMEM;
-        }
-        nonvolatile_dsmad = next_dsmad_handle++;
-        mr = host_memory_backend_get_memory(ct3d->hostmem);
-        if (!mr) {
-            return -EINVAL;
-        }
-        *dsmas_nonvolatile = (CDATDsmas) {
-            .header = {
-                .type = CDAT_TYPE_DSMAS,
-                .length = sizeof(*dsmas_nonvolatile),
-            },
-            .DSMADhandle = nonvolatile_dsmad,
-            .flags = CDAT_DSMAS_FLAG_NV,
-            .DPA_base = 0,
-            .DPA_length = int128_get64(mr->size),
-        };
-        len++;
-
-        /* For now, no memory side cache, plausiblish numbers */
-        dslbis_nonvolatile =
-            g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
-        if (!dslbis_nonvolatile) {
-            return -ENOMEM;
-        }
+    dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
+    if (!dsmas_nonvolatile) {
+        return -ENOMEM;
+    }
+    nonvolatile_dsmad = next_dsmad_handle++;
+    *dsmas_nonvolatile = (CDATDsmas) {
+        .header = {
+            .type = CDAT_TYPE_DSMAS,
+            .length = sizeof(*dsmas_nonvolatile),
+        },
+        .DSMADhandle = nonvolatile_dsmad,
+        .flags = CDAT_DSMAS_FLAG_NV,
+        .DPA_base = 0,
+        .DPA_length = int128_get64(mr->size),
+    };
+    len++;
 
-        dslbis_nonvolatile[0] = (CDATDslbis) {
-            .header = {
-                .type = CDAT_TYPE_DSLBIS,
-                .length = sizeof(*dslbis_nonvolatile),
-            },
-            .handle = nonvolatile_dsmad,
-            .flags = HMAT_LB_MEM_MEMORY,
-            .data_type = HMAT_LB_DATA_READ_LATENCY,
-            .entry_base_unit = 10000, /* 10ns base */
-            .entry[0] = 15, /* 150ns */
-        };
-        len++;
-
-        dslbis_nonvolatile[1] = (CDATDslbis) {
-            .header = {
-                .type = CDAT_TYPE_DSLBIS,
-                .length = sizeof(*dslbis_nonvolatile),
-            },
-            .handle = nonvolatile_dsmad,
-            .flags = HMAT_LB_MEM_MEMORY,
-            .data_type = HMAT_LB_DATA_WRITE_LATENCY,
-            .entry_base_unit = 10000,
-            .entry[0] = 25, /* 250ns */
-        };
-        len++;
-
-        dslbis_nonvolatile[2] = (CDATDslbis) {
-            .header = {
-                .type = CDAT_TYPE_DSLBIS,
-                .length = sizeof(*dslbis_nonvolatile),
-            },
-            .handle = nonvolatile_dsmad,
-            .flags = HMAT_LB_MEM_MEMORY,
-            .data_type = HMAT_LB_DATA_READ_BANDWIDTH,
-            .entry_base_unit = 1000, /* GB/s */
-            .entry[0] = 16,
-        };
-        len++;
-
-        dslbis_nonvolatile[3] = (CDATDslbis) {
-            .header = {
-                .type = CDAT_TYPE_DSLBIS,
-                .length = sizeof(*dslbis_nonvolatile),
-            },
-            .handle = nonvolatile_dsmad,
-            .flags = HMAT_LB_MEM_MEMORY,
-            .data_type = HMAT_LB_DATA_WRITE_BANDWIDTH,
-            .entry_base_unit = 1000, /* GB/s */
-            .entry[0] = 16,
-        };
-        len++;
-
-        mr = host_memory_backend_get_memory(ct3d->hostmem);
-        if (!mr) {
-            return -EINVAL;
-        }
-        dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
-        *dsemts_nonvolatile = (CDATDsemts) {
-            .header = {
-                .type = CDAT_TYPE_DSEMTS,
-                .length = sizeof(*dsemts_nonvolatile),
-            },
-            .DSMAS_handle = nonvolatile_dsmad,
-            /* Reserved - the non volatile from DSMAS matters */
-            .EFI_memory_type_attr = 2,
-            .DPA_offset = 0,
-            .DPA_length = int128_get64(mr->size),
-        };
-        len++;
+    /* For now, no memory side cache, plausiblish numbers */
+    dslbis_nonvolatile =
+        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
+    if (!dslbis_nonvolatile) {
+        return -ENOMEM;
     }
 
+    dslbis_nonvolatile[0] = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis_nonvolatile),
+        },
+        .handle = nonvolatile_dsmad,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_READ_LATENCY,
+        .entry_base_unit = 10000, /* 10ns base */
+        .entry[0] = 15, /* 150ns */
+    };
+    len++;
+
+    dslbis_nonvolatile[1] = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis_nonvolatile),
+        },
+        .handle = nonvolatile_dsmad,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_WRITE_LATENCY,
+        .entry_base_unit = 10000,
+        .entry[0] = 25, /* 250ns */
+    };
+    len++;
+
+    dslbis_nonvolatile[2] = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis_nonvolatile),
+        },
+        .handle = nonvolatile_dsmad,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_READ_BANDWIDTH,
+        .entry_base_unit = 1000, /* GB/s */
+        .entry[0] = 16,
+    };
+    len++;
+
+    dslbis_nonvolatile[3] = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis_nonvolatile),
+        },
+        .handle = nonvolatile_dsmad,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_WRITE_BANDWIDTH,
+        .entry_base_unit = 1000, /* GB/s */
+        .entry[0] = 16,
+    };
+    len++;
+
+    dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
+    *dsemts_nonvolatile = (CDATDsemts) {
+        .header = {
+            .type = CDAT_TYPE_DSEMTS,
+            .length = sizeof(*dsemts_nonvolatile),
+        },
+        .DSMAS_handle = nonvolatile_dsmad,
+        /* Reserved - the non volatile from DSMAS matters */
+        .EFI_memory_type_attr = 2,
+        .DPA_offset = 0,
+        .DPA_length = int128_get64(mr->size),
+    };
+    len++;
+
     *cdat_table = g_malloc0(len * sizeof(*cdat_table));
     /* Header always at start of structure */
     if (dsmas_nonvolatile) {
-- 
2.37.3


