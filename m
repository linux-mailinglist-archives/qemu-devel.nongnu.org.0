Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9505FCAB5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:35:27 +0200 (CEST)
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigZi-0007Mt-CJ
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMS-0002Lg-3C
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:44 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oigMM-0001yQ-OP
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:21:43 -0400
Received: by mail-qk1-x743.google.com with SMTP id o22so10610194qkl.8
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNKsnJI2O2Dvzfe8afK4oFdeHHBtIjx3W5QyApq77ec=;
 b=dFpKglfKpZgSGu7YqXw/Ag0jwAUHtRW93owL6zO7NjuoojiXdvfmN+7+YWQSnul9zq
 VtMYjXjyRfKJPMiY3TywWuzR13g8Zt88PtWMN19b7fsEEfY1d+oh6IDPqJJrKmC/F858
 3Uib2CFKQRpACJEaXYj1Cmz008jFHxc5nWWg9frcFbSR0ymIneKR1VfuyDKCNwITu2Br
 VK6ahx3TM/PvuJ7+ToNIE6qWEj2BvyEgUn49eEQXuHykKaQRwcdcVUK2YdfBuF4+eCGE
 R7M14gdAjWAMFHSpftqqRZRVtOBMRQ7lLBJq03fQkNuZbRFRkKAOOTv7JsLaX3TNsOIl
 Lk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNKsnJI2O2Dvzfe8afK4oFdeHHBtIjx3W5QyApq77ec=;
 b=gL9WfKETAGeMRY5UYTETDnqSIoW+WVOphisx04HA8tiKrRs+YswxVcVEGUlpShNKtm
 Fa8B+Erfn7TNAktWoNvMbWtSLP2FEfTKORlEw31mb+IsO1LXqAYKIIdYF9iDfk30YGJ/
 VNlWd5bxHH+dFxY66N1j/z2XCM5BMp3HZNeMoVpb3WeYCLGEXVgMMf+701INLjiqzzTK
 yXmCo2OrOeJmuG0gJjL7e/9cQ5zkVdJojCkEDnd+S5W6wALIdgrCYesc2+Qdmr5yMVKN
 BEC0e09Fy7D48vbY3JNnDrjxBCsYTxER5WNfD/JVM3l897igrpoRL8mCOa6B+0Cs2apJ
 bdJA==
X-Gm-Message-State: ACrzQf3GgSx3rBVR57DqcMHSXSiB2EMUQQ2Bhm6H0q1IcqzznGv34f6Z
 9Cv8HflOZMfUZhGdE9HoTQ==
X-Google-Smtp-Source: AMsMyM7+lhEQBxC97aEvdrQqrRerFiBAjiYwBTHqxEF4uz6F3dwF2OA0MtzQne8RDkUnC1TVG9SOsA==
X-Received: by 2002:a05:620a:1e5:b0:6ed:1061:5c6b with SMTP id
 x5-20020a05620a01e500b006ed10615c6bmr11550573qkn.34.1665598897918; 
 Wed, 12 Oct 2022 11:21:37 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 bq40-20020a05620a46a800b006ee9d734479sm920228qkb.33.2022.10.12.11.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:21:37 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 4/5] hw/mem/cxl_type3: Change the CDAT allocation/free strategy
Date: Wed, 12 Oct 2022 14:21:19 -0400
Message-Id: <20221012182120.174142-5-gregory.price@memverge.com>
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

The existing code allocates a subtable for SLBIS entries, uses a
local variable to avoid a g_autofree footgun, and the cleanup code
causes heap corruption.

Rather than allocate a table, explicitly allocate each individual entry
and make the sub-table size static.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/mem/cxl_type3.c | 49 ++++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 0e0ea70387..220b9f09a9 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -23,13 +23,14 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
                                 void *priv)
 {
     g_autofree CDATDsmas *dsmas_nonvolatile = NULL;
-    g_autofree CDATDslbis *dslbis_nonvolatile = NULL;
+    g_autofree CDATDslbis *dslbis_nonvolatile1 = NULL;
+    g_autofree CDATDslbis *dslbis_nonvolatile2 = NULL;
+    g_autofree CDATDslbis *dslbis_nonvolatile3 = NULL;
+    g_autofree CDATDslbis *dslbis_nonvolatile4 = NULL;
     g_autofree CDATDsemts *dsemts_nonvolatile = NULL;
     CXLType3Dev *ct3d = priv;
-    int i = 0;
     int next_dsmad_handle = 0;
     int nonvolatile_dsmad = -1;
-    int dslbis_nonvolatile_num = 4;
     MemoryRegion *mr;
 
     if (!ct3d->hostmem) {
@@ -48,10 +49,15 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
 
     /* Non volatile aspects */
     dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
-    dslbis_nonvolatile =
-        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
+    dslbis_nonvolatile1 = g_malloc(sizeof(*dslbis_nonvolatile1));
+    dslbis_nonvolatile2 = g_malloc(sizeof(*dslbis_nonvolatile2));
+    dslbis_nonvolatile3 = g_malloc(sizeof(*dslbis_nonvolatile3));
+    dslbis_nonvolatile4 = g_malloc(sizeof(*dslbis_nonvolatile4));
     dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
-    if (!dsmas_nonvolatile || !dslbis_nonvolatile || !dsemts_nonvolatile) {
+
+    if (!dsmas_nonvolatile || !dsemts_nonvolatile ||
+        !dslbis_nonvolatile1 || !dslbis_nonvolatile2 ||
+        !dslbis_nonvolatile3 || !dslbis_nonvolatile4) {
         g_free(*cdat_table);
         *cdat_table = NULL;
         return -ENOMEM;
@@ -70,10 +76,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     };
 
     /* For now, no memory side cache, plausiblish numbers */
-    dslbis_nonvolatile[0] = (CDATDslbis) {
+    *dslbis_nonvolatile1 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile),
+            .length = sizeof(*dslbis_nonvolatile1),
         },
         .handle = nonvolatile_dsmad,
         .flags = HMAT_LB_MEM_MEMORY,
@@ -82,10 +88,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry[0] = 15, /* 150ns */
     };
 
-    dslbis_nonvolatile[1] = (CDATDslbis) {
+    *dslbis_nonvolatile2 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile),
+            .length = sizeof(*dslbis_nonvolatile2),
         },
         .handle = nonvolatile_dsmad,
         .flags = HMAT_LB_MEM_MEMORY,
@@ -94,10 +100,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry[0] = 25, /* 250ns */
     };
 
-    dslbis_nonvolatile[2] = (CDATDslbis) {
+    *dslbis_nonvolatile3 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile),
+            .length = sizeof(*dslbis_nonvolatile3),
         },
         .handle = nonvolatile_dsmad,
         .flags = HMAT_LB_MEM_MEMORY,
@@ -106,10 +112,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
         .entry[0] = 16,
     };
 
-    dslbis_nonvolatile[3] = (CDATDslbis) {
+    *dslbis_nonvolatile4 = (CDATDslbis) {
         .header = {
             .type = CDAT_TYPE_DSLBIS,
-            .length = sizeof(*dslbis_nonvolatile),
+            .length = sizeof(*dslbis_nonvolatile4),
         },
         .handle = nonvolatile_dsmad,
         .flags = HMAT_LB_MEM_MEMORY,
@@ -131,15 +137,12 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
     };
 
     /* Header always at start of structure */
-    (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
-
-    CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
-    int j;
-    for (j = 0; j < dslbis_nonvolatile_num; j++) {
-        (*cdat_table)[i++] = (CDATSubHeader *)&dslbis[j];
-    }
-
-    (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
+    (*cdat_table)[0] = g_steal_pointer(&dsmas_nonvolatile);
+    (*cdat_table)[1] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile1);
+    (*cdat_table)[2] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile2);
+    (*cdat_table)[3] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile3);
+    (*cdat_table)[4] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile4);
+    (*cdat_table)[5] = g_steal_pointer(&dsemts_nonvolatile);
 
     return CT3_CDAT_SUBTABLE_SIZE;
 }
-- 
2.37.3


