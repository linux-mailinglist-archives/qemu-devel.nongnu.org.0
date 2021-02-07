Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE993127B7
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 22:56:10 +0100 (CET)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8s2L-0002z4-0n
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 16:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwI-0000bj-Dc; Sun, 07 Feb 2021 16:49:54 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwE-0004PP-Ah; Sun, 07 Feb 2021 16:49:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FAD55C0003;
 Sun,  7 Feb 2021 16:49:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+nND/QIqtDEhO
 TGH4h7tKVFqsLfaApS1g7QGhrKq/zk=; b=kCwAhKnBgF4UgTh/vk6SD0eczX65M
 Nq/btKiqEW20Ju5DHan8pd3Cquo4ol5ogNc4XxIlO+YEneKlEGLmA6KEhmK5Rytg
 HaBEzasL6mGaeHOH+sSBF8pGCD1P0ODKcLpj+N41/uDYxEflA5u+tgDxRPqEU85j
 I4HQslJrDssHxkY56xKo34bBe4PMEOlYGYeHzK1xsIVS0yJAJViovLlr14lkUR9s
 cCRclFJQlNK3riTsYK4LxY8vRR1Dwjp1C56GviEbI6VwQS1LMKqTthRb58VKvFbz
 eBcjxlTWyelDHD6/KanbV7ZWPDQCi+tRRy8emK4V68x79J3LdzNJ+AaXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+nND/QIqtDEhOTGH4h7tKVFqsLfaApS1g7QGhrKq/zk=; b=DsBsKD8z
 5nloP1Y0RMvdKpcVhDDHpyFrN7mg+voFhQXxCu8vgeeOVr49/hq/lA51lgwvsUQD
 Rx2RsW/T8yVaApBJTaYIvT2VGxEU+cOTLRLKQUp8OE/wKKkegmOcFsOPkSwV46CR
 wVMRZ1/hFEeot/yOhbIAbHaWQVi51zsyc9r0aJ4RT9AoLZ8phJcp2ABOOP5FZx8m
 6V3NlwwBVFEhHnt6v4jzWtEKsI3YfYyFVGg9FHuNCVjIJqEwB87pGUeh9Mh1pzad
 8Dsy7w0bKuGNLsTZB1ruzrInoUhSdoqUZKcYGYueBEw8Rv9ZW+VX0XQS95OhdwkZ
 wyOzFFP65gicnw==
X-ME-Sender: <xms:fWAgYDEx1yemnOHS6ygPqmATrHoeBtzhUU42sR1UwRMNdOIMm5U4ww>
 <xme:fWAgYAUU9Gsh_b-WsnHunAiAL-W1xf45q00TyG4vhRzN7D2gg2zsPAyMaEg5npLPF
 lryVoBiFwSyf3l0vJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fWAgYFJc5QLjXOlz-AZAc5cKCU3vPMVFUm5kEb6fMVa4owhQt8-6MQ>
 <xmx:fWAgYBFnFcnVpgmiHkuwUzAE0Mi5q--sqjtfg2mgJlsKr6qkmCxRrw>
 <xmx:fWAgYJXspdYUZAPIvX5N4FKwPTs1J2ogmlF6k4cjdsXPnIIdVBKuvQ>
 <xmx:fWAgYIGpzjU3HUsb55cIy53bHBDwXk7SVhIqLekC5Z_AtBRk6NgS8g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E3231080057;
 Sun,  7 Feb 2021 16:49:48 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 4/8] hw/block/nvme: try to deal with the iov/qsg duality
Date: Sun,  7 Feb 2021 22:49:36 +0100
Message-Id: <20210207214940.281889-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207214940.281889-1-its@irrelevant.dk>
References: <20210207214940.281889-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Introduce NvmeSg and try to deal with that pesky qsg/iov duality that
haunts all the memory-related functions.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |   8 ++-
 hw/block/nvme.c | 171 ++++++++++++++++++++++++------------------------
 2 files changed, 90 insertions(+), 89 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cb2b5175f1a1..0e4fbd6990ad 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -29,6 +29,11 @@ typedef struct NvmeAsyncEvent {
     NvmeAerResult result;
 } NvmeAsyncEvent;
 
+typedef struct NvmeSg {
+    QEMUSGList   qsg;
+    QEMUIOVector iov;
+} NvmeSg;
+
 typedef struct NvmeRequest {
     struct NvmeSQueue       *sq;
     struct NvmeNamespace    *ns;
@@ -38,8 +43,7 @@ typedef struct NvmeRequest {
     NvmeCqe                 cqe;
     NvmeCmd                 cmd;
     BlockAcctCookie         acct;
-    QEMUSGList              qsg;
-    QEMUIOVector            iov;
+    NvmeSg                  sg;
     QTAILQ_ENTRY(NvmeRequest)entry;
 } NvmeRequest;
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 29902038d618..a0009c057f1e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -428,14 +428,20 @@ static void nvme_req_clear(NvmeRequest *req)
     req->status = NVME_SUCCESS;
 }
 
-static void nvme_req_exit(NvmeRequest *req)
+static inline void nvme_sg_init(NvmeCtrl *n, NvmeSg *sg)
 {
-    if (req->qsg.sg) {
-        qemu_sglist_destroy(&req->qsg);
+    pci_dma_sglist_init(&sg->qsg, &n->parent_obj, 0);
+    qemu_iovec_init(&sg->iov, 0);
+}
+
+static inline void nvme_sg_unmap(NvmeSg *sg)
+{
+    if (sg->qsg.sg) {
+        qemu_sglist_destroy(&sg->qsg);
     }
 
-    if (req->iov.iov) {
-        qemu_iovec_destroy(&req->iov);
+    if (sg->iov.iov) {
+        qemu_iovec_destroy(&sg->iov);
     }
 }
 
@@ -473,8 +479,7 @@ static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
-                              hwaddr addr, size_t len)
+static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
 {
     bool cmb = false, pmr = false;
 
@@ -491,34 +496,22 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     }
 
     if (cmb || pmr) {
-        if (qsg && qsg->sg) {
+        if (sg->qsg.nsg) {
             return NVME_INVALID_USE_OF_CMB | NVME_DNR;
         }
 
-        assert(iov);
-
-        if (!iov->iov) {
-            qemu_iovec_init(iov, 1);
-        }
-
         if (cmb) {
-            return nvme_map_addr_cmb(n, iov, addr, len);
+            return nvme_map_addr_cmb(n, &sg->iov, addr, len);
         } else {
-            return nvme_map_addr_pmr(n, iov, addr, len);
+            return nvme_map_addr_pmr(n, &sg->iov, addr, len);
         }
     }
 
-    if (iov && iov->iov) {
+    if (sg->iov.niov) {
         return NVME_INVALID_USE_OF_CMB | NVME_DNR;
     }
 
-    assert(qsg);
-
-    if (!qsg->sg) {
-        pci_dma_sglist_init(qsg, &n->parent_obj, 1);
-    }
-
-    qemu_sglist_add(qsg, addr, len);
+    qemu_sglist_add(&sg->qsg, addr, len);
 
     return NVME_SUCCESS;
 }
@@ -532,20 +525,13 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     uint16_t status;
     int ret;
 
-    QEMUSGList *qsg = &req->qsg;
-    QEMUIOVector *iov = &req->iov;
-
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    if (nvme_addr_is_cmb(n, prp1) || (nvme_addr_is_pmr(n, prp1))) {
-        qemu_iovec_init(iov, num_prps);
-    } else {
-        pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
-    }
+    nvme_sg_init(n, &req->sg);
 
-    status = nvme_map_addr(n, qsg, iov, prp1, trans_len);
+    status = nvme_map_addr(n, &req->sg, prp1, trans_len);
     if (status) {
-        return status;
+        goto unmap;
     }
 
     len -= trans_len;
@@ -560,7 +546,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
             ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
             if (ret) {
                 trace_pci_nvme_err_addr_read(prp2);
-                return NVME_DATA_TRAS_ERROR;
+                status = NVME_DATA_TRAS_ERROR;
+                goto unmap;
             }
             while (len != 0) {
                 uint64_t prp_ent = le64_to_cpu(prp_list[i]);
@@ -568,7 +555,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 if (i == n->max_prp_ents - 1 && len > n->page_size) {
                     if (unlikely(prp_ent & (n->page_size - 1))) {
                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                        return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                        status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                        goto unmap;
                     }
 
                     i = 0;
@@ -578,20 +566,22 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                                          prp_trans);
                     if (ret) {
                         trace_pci_nvme_err_addr_read(prp_ent);
-                        return NVME_DATA_TRAS_ERROR;
+                        status = NVME_DATA_TRAS_ERROR;
+                        goto unmap;
                     }
                     prp_ent = le64_to_cpu(prp_list[i]);
                 }
 
                 if (unlikely(prp_ent & (n->page_size - 1))) {
                     trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                    return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                    status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                    goto unmap;
                 }
 
                 trans_len = MIN(len, n->page_size);
-                status = nvme_map_addr(n, qsg, iov, prp_ent, trans_len);
+                status = nvme_map_addr(n, &req->sg, prp_ent, trans_len);
                 if (status) {
-                    return status;
+                    goto unmap;
                 }
 
                 len -= trans_len;
@@ -600,24 +590,28 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
         } else {
             if (unlikely(prp2 & (n->page_size - 1))) {
                 trace_pci_nvme_err_invalid_prp2_align(prp2);
-                return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                goto unmap;
             }
-            status = nvme_map_addr(n, qsg, iov, prp2, len);
+            status = nvme_map_addr(n, &req->sg, prp2, len);
             if (status) {
-                return status;
+                goto unmap;
             }
         }
     }
 
     return NVME_SUCCESS;
+
+unmap:
+    nvme_sg_unmap(&req->sg);
+    return status;
 }
 
 /*
  * Map 'nsgld' data descriptors from 'segment'. The function will subtract the
  * number of bytes mapped in len.
  */
-static uint16_t nvme_map_sgl_data(NvmeCtrl *n, QEMUSGList *qsg,
-                                  QEMUIOVector *iov,
+static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                                   NvmeSglDescriptor *segment, uint64_t nsgld,
                                   size_t *len, NvmeRequest *req)
 {
@@ -675,7 +669,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, QEMUSGList *qsg,
             return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
         }
 
-        status = nvme_map_addr(n, qsg, iov, addr, trans_len);
+        status = nvme_map_addr(n, sg, addr, trans_len);
         if (status) {
             return status;
         }
@@ -687,9 +681,8 @@ next:
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
-                             NvmeSglDescriptor sgl, size_t len,
-                             NvmeRequest *req)
+static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
+                             size_t len, NvmeRequest *req)
 {
     /*
      * Read the segment in chunks of 256 descriptors (one 4k page) to avoid
@@ -707,6 +700,8 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     hwaddr addr;
     int ret;
 
+    nvme_sg_init(n, sg);
+
     sgld = &sgl;
     addr = le64_to_cpu(sgl.addr);
 
@@ -717,7 +712,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
      * be mapped directly.
      */
     if (NVME_SGL_TYPE(sgl.type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
-        status = nvme_map_sgl_data(n, qsg, iov, sgld, 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, req);
         if (status) {
             goto unmap;
         }
@@ -755,7 +750,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
                 goto unmap;
             }
 
-            status = nvme_map_sgl_data(n, qsg, iov, segment, SEG_CHUNK_SIZE,
+            status = nvme_map_sgl_data(n, sg, segment, SEG_CHUNK_SIZE,
                                        &len, req);
             if (status) {
                 goto unmap;
@@ -782,7 +777,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         switch (NVME_SGL_TYPE(last_sgld->type)) {
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            status = nvme_map_sgl_data(n, qsg, iov, segment, nsgld, &len, req);
+            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, req);
             if (status) {
                 goto unmap;
             }
@@ -809,7 +804,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
          * Do not map the last descriptor; it will be a Segment or Last Segment
          * descriptor and is handled by the next iteration.
          */
-        status = nvme_map_sgl_data(n, qsg, iov, segment, nsgld - 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, req);
         if (status) {
             goto unmap;
         }
@@ -825,14 +820,7 @@ out:
     return NVME_SUCCESS;
 
 unmap:
-    if (iov->iov) {
-        qemu_iovec_destroy(iov);
-    }
-
-    if (qsg->sg) {
-        qemu_sglist_destroy(qsg);
-    }
-
+    nvme_sg_unmap(sg);
     return status;
 }
 
@@ -853,8 +841,7 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, size_t len, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        return nvme_map_sgl(n, &req->qsg, &req->iov, req->cmd.dptr.sgl, len,
-                            req);
+        return nvme_map_sgl(n, &req->sg, req->cmd.dptr.sgl, len, req);
     default:
         return NVME_INVALID_FIELD;
     }
@@ -871,15 +858,15 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     }
 
     /* assert that only one of qsg and iov carries data */
-    assert((req->qsg.nsg > 0) != (req->iov.niov > 0));
+    assert((req->sg.qsg.nsg > 0) != (req->sg.iov.niov > 0));
 
-    if (req->qsg.nsg > 0) {
+    if (req->sg.qsg.nsg > 0) {
         uint64_t residual;
 
         if (dir == DMA_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &req->qsg);
+            residual = dma_buf_write(ptr, len, &req->sg.qsg);
         } else {
-            residual = dma_buf_read(ptr, len, &req->qsg);
+            residual = dma_buf_read(ptr, len, &req->sg.qsg);
         }
 
         if (unlikely(residual)) {
@@ -890,9 +877,9 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
         size_t bytes;
 
         if (dir == DMA_DIRECTION_TO_DEVICE) {
-            bytes = qemu_iovec_to_buf(&req->iov, 0, ptr, len);
+            bytes = qemu_iovec_to_buf(&req->sg.iov, 0, ptr, len);
         } else {
-            bytes = qemu_iovec_from_buf(&req->iov, 0, ptr, len);
+            bytes = qemu_iovec_from_buf(&req->sg.iov, 0, ptr, len);
         }
 
         if (unlikely(bytes != len)) {
@@ -904,6 +891,28 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return status;
 }
 
+static inline void nvme_blk_read(BlockBackend *blk, int64_t offset,
+                                 BlockCompletionFunc *cb, NvmeRequest *req)
+{
+    if (req->sg.qsg.nsg) {
+        req->aiocb = dma_blk_read(blk, &req->sg.qsg, offset, BDRV_SECTOR_SIZE,
+                                  cb, req);
+    } else {
+        req->aiocb = blk_aio_preadv(blk, offset, &req->sg.iov, 0, cb, req);
+    }
+}
+
+static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
+                                  BlockCompletionFunc *cb, NvmeRequest *req)
+{
+    if (req->sg.qsg.nsg) {
+        req->aiocb = dma_blk_write(blk, &req->sg.qsg, offset, BDRV_SECTOR_SIZE,
+                                   cb, req);
+    } else {
+        req->aiocb = blk_aio_pwritev(blk, offset, &req->sg.iov, 0, cb, req);
+    }
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -934,7 +943,7 @@ static void nvme_post_cqes(void *opaque)
         }
         QTAILQ_REMOVE(&cq->req_list, req, entry);
         nvme_inc_cq_tail(cq);
-        nvme_req_exit(req);
+        nvme_sg_unmap(&req->sg);
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
@@ -1597,14 +1606,14 @@ static void nvme_copy_in_complete(NvmeRequest *req)
         zone->w_ptr += ctx->nlb;
     }
 
-    qemu_iovec_init(&req->iov, 1);
-    qemu_iovec_add(&req->iov, ctx->bounce, nvme_l2b(ns, ctx->nlb));
+    qemu_iovec_init(&req->sg.iov, 1);
+    qemu_iovec_add(&req->sg.iov, ctx->bounce, nvme_l2b(ns, ctx->nlb));
 
     block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
                      BLOCK_ACCT_WRITE);
 
     req->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
-                                 &req->iov, 0, nvme_copy_cb, req);
+                                 &req->sg.iov, 0, nvme_copy_cb, req);
 
     return;
 
@@ -1992,13 +2001,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                      BLOCK_ACCT_READ);
-    if (req->qsg.sg) {
-        req->aiocb = dma_blk_read(blk, &req->qsg, data_offset,
-                                  BDRV_SECTOR_SIZE, nvme_rw_cb, req);
-    } else {
-        req->aiocb = blk_aio_preadv(blk, data_offset, &req->iov, 0,
-                                    nvme_rw_cb, req);
-    }
+    nvme_blk_read(blk, data_offset, nvme_rw_cb, req);
     return NVME_NO_COMPLETE;
 
 invalid:
@@ -2080,13 +2083,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
         block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                          BLOCK_ACCT_WRITE);
-        if (req->qsg.sg) {
-            req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
-                                       BDRV_SECTOR_SIZE, nvme_rw_cb, req);
-        } else {
-            req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
-                                         nvme_rw_cb, req);
-        }
+        nvme_blk_write(blk, data_offset, nvme_rw_cb, req);
     } else {
         req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
-- 
2.30.0


