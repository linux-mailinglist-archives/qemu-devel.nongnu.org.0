Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE7330EF3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:15:40 +0100 (CET)
Received: from localhost ([::1]:52008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFjX-0008Jv-5U
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvd-0003aG-A7; Mon, 08 Mar 2021 07:24:05 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEva-00076o-Nt; Mon, 08 Mar 2021 07:24:05 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A07B236CE;
 Mon,  8 Mar 2021 07:24:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=e9FOm5scn0k6B
 771uE+6U7lGqP/YyWo8AoZ7CnoplZs=; b=BHnD6eP6pTBt8zISVZIaKc6+MEBHR
 XucaWI9SXCxrqTdD5f3RIRqxlKtBSCxauZvdLeaedwsZwu82EgPBuVFkiq+nfGHv
 xTOyBHnXsTV1m9UOyBCqOZs5K5UyVZnAkI7FCUPy8dd11b76FjJDHlVJ7WIeNQDA
 z+giBl+V6qKvKxD/ntIqx76Rwe00S0bIICgTLyQnTp4uE4oeECgBDu36HaRrk+K+
 hHJYtkj/6GggPDrNhrcFBEz9z3H4MoYCcsxU3ejKsdr1kO+WbrsK2keo6OgbLJWE
 cZIKs6IuwiilPs8EVUjGE0Z4+SbOJpvreDOieUYu13R/eEpaL1kFzA07g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=e9FOm5scn0k6B771uE+6U7lGqP/YyWo8AoZ7CnoplZs=; b=uD5OzEOg
 jXzczArSDFPK+InN1YMWBBOyu82yInVtqpZQdIBPd0+ykVvcFiveEi4AflL0sbkd
 eVRlave3QzFkolvYTk5xSVCM24yv/IIvP/HxKkHqLPsbnnKwdX8+LEenvog1k9H/
 zrdraOnd++qMYKyk98qk8GbdPr5B1tjj7deD+OYEbdsvWXOFuHVy8l7JvotulWHA
 RPsvKHwqsVE/1+Gji+DkY8+XOzbqejYAPBoWyEAVn40k/j8bEAF7Pdnx6bZzzFCH
 gQpmixPYaEUhGLcrLHUBroe7zVP1Ocyy9bw/0ih4eaMf5BRzjPlRuNbW7HZiUf8q
 SwmuMpp+7SxXSg==
X-ME-Sender: <xms:YBdGYEm0EgQl2szBFx09vACKxko68Dq8d43xsREOV6-L3UOjQDM0Vw>
 <xme:YBdGYD11MlPaqJgweCxjIVYtGsxEUaOarfm7sXro3wh6iMkfg0Koy14YFDn59J-2t
 yOi3oLRJon5QN5bJlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YBdGYCoRbbNhjN4GVerM5PHrEjov72fsoxCHAI4ao6zv86Pt2B2aUQ>
 <xmx:YBdGYAl3d-Y6ycNdJDfWw5ZpHfVgRZpbPf0BfJGApCIe-30-Na4xMg>
 <xmx:YBdGYC2JXzwAd0q4wIzoABxikfZ5kgcrG1R7Y66O7jzn0LK0SLj-iw>
 <xmx:YBdGYLnIx3ZJVt-HqgEmSX960Mg3i-uR3EX-zZ3kR_AVwYNNu_FKNA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA4FF1080064;
 Mon,  8 Mar 2021 07:23:58 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 28/38] hw/block/nvme: try to deal with the iov/qsg duality
Date: Mon,  8 Mar 2021 13:23:03 +0100
Message-Id: <20210308122313.286938-29-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Introduce NvmeSg and try to deal with that pesky qsg/iov duality that
haunts all the memory-related functions.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h |  17 ++++-
 hw/block/nvme.c | 191 ++++++++++++++++++++++++++----------------------
 2 files changed, 117 insertions(+), 91 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 294fac1defe3..96afefa8c9fb 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -29,6 +29,20 @@ typedef struct NvmeAsyncEvent {
     NvmeAerResult result;
 } NvmeAsyncEvent;
 
+enum {
+    NVME_SG_ALLOC = 1 << 0,
+    NVME_SG_DMA   = 1 << 1,
+};
+
+typedef struct NvmeSg {
+    int flags;
+
+    union {
+        QEMUSGList   qsg;
+        QEMUIOVector iov;
+    };
+} NvmeSg;
+
 typedef struct NvmeRequest {
     struct NvmeSQueue       *sq;
     struct NvmeNamespace    *ns;
@@ -38,8 +52,7 @@ typedef struct NvmeRequest {
     NvmeCqe                 cqe;
     NvmeCmd                 cmd;
     BlockAcctCookie         acct;
-    QEMUSGList              qsg;
-    QEMUIOVector            iov;
+    NvmeSg                  sg;
     QTAILQ_ENTRY(NvmeRequest)entry;
 } NvmeRequest;
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6580f5eb1746..621e993e652e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -432,15 +432,31 @@ static void nvme_req_clear(NvmeRequest *req)
     req->status = NVME_SUCCESS;
 }
 
-static void nvme_req_exit(NvmeRequest *req)
+static inline void nvme_sg_init(NvmeCtrl *n, NvmeSg *sg, bool dma)
 {
-    if (req->qsg.sg) {
-        qemu_sglist_destroy(&req->qsg);
+    if (dma) {
+        pci_dma_sglist_init(&sg->qsg, &n->parent_obj, 0);
+        sg->flags = NVME_SG_DMA;
+    } else {
+        qemu_iovec_init(&sg->iov, 0);
     }
 
-    if (req->iov.iov) {
-        qemu_iovec_destroy(&req->iov);
+    sg->flags |= NVME_SG_ALLOC;
+}
+
+static inline void nvme_sg_unmap(NvmeSg *sg)
+{
+    if (!(sg->flags & NVME_SG_ALLOC)) {
+        return;
     }
+
+    if (sg->flags & NVME_SG_DMA) {
+        qemu_sglist_destroy(&sg->qsg);
+    } else {
+        qemu_iovec_destroy(&sg->iov);
+    }
+
+    memset(sg, 0x0, sizeof(*sg));
 }
 
 static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
@@ -477,8 +493,7 @@ static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
-                              hwaddr addr, size_t len)
+static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
 {
     bool cmb = false, pmr = false;
 
@@ -495,38 +510,31 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     }
 
     if (cmb || pmr) {
-        if (qsg && qsg->sg) {
+        if (sg->flags & NVME_SG_DMA) {
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
+    if (!(sg->flags & NVME_SG_DMA)) {
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
 
+static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
+{
+    return !(nvme_addr_is_cmb(n, addr) || nvme_addr_is_pmr(n, addr));
+}
+
 static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                              uint32_t len, NvmeRequest *req)
 {
@@ -536,20 +544,13 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
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
+    nvme_sg_init(n, &req->sg, nvme_addr_is_dma(n, prp1));
 
-    status = nvme_map_addr(n, qsg, iov, prp1, trans_len);
+    status = nvme_map_addr(n, &req->sg, prp1, trans_len);
     if (status) {
-        return status;
+        goto unmap;
     }
 
     len -= trans_len;
@@ -564,7 +565,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
             ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
             if (ret) {
                 trace_pci_nvme_err_addr_read(prp2);
-                return NVME_DATA_TRAS_ERROR;
+                status = NVME_DATA_TRAS_ERROR;
+                goto unmap;
             }
             while (len != 0) {
                 uint64_t prp_ent = le64_to_cpu(prp_list[i]);
@@ -572,7 +574,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 if (i == n->max_prp_ents - 1 && len > n->page_size) {
                     if (unlikely(prp_ent & (n->page_size - 1))) {
                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
-                        return NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                        status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
+                        goto unmap;
                     }
 
                     i = 0;
@@ -582,20 +585,22 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
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
@@ -604,24 +609,28 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
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
@@ -679,7 +688,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, QEMUSGList *qsg,
             return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
         }
 
-        status = nvme_map_addr(n, qsg, iov, addr, trans_len);
+        status = nvme_map_addr(n, sg, addr, trans_len);
         if (status) {
             return status;
         }
@@ -691,9 +700,8 @@ next:
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
@@ -716,12 +724,14 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
 
     trace_pci_nvme_map_sgl(nvme_cid(req), NVME_SGL_TYPE(sgl.type), len);
 
+    nvme_sg_init(n, sg, nvme_addr_is_dma(n, addr));
+
     /*
      * If the entire transfer can be described with a single data block it can
      * be mapped directly.
      */
     if (NVME_SGL_TYPE(sgl.type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
-        status = nvme_map_sgl_data(n, qsg, iov, sgld, 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, req);
         if (status) {
             goto unmap;
         }
@@ -759,7 +769,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
                 goto unmap;
             }
 
-            status = nvme_map_sgl_data(n, qsg, iov, segment, SEG_CHUNK_SIZE,
+            status = nvme_map_sgl_data(n, sg, segment, SEG_CHUNK_SIZE,
                                        &len, req);
             if (status) {
                 goto unmap;
@@ -786,7 +796,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         switch (NVME_SGL_TYPE(last_sgld->type)) {
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            status = nvme_map_sgl_data(n, qsg, iov, segment, nsgld, &len, req);
+            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, req);
             if (status) {
                 goto unmap;
             }
@@ -813,7 +823,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
          * Do not map the last descriptor; it will be a Segment or Last Segment
          * descriptor and is handled by the next iteration.
          */
-        status = nvme_map_sgl_data(n, qsg, iov, segment, nsgld - 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, req);
         if (status) {
             goto unmap;
         }
@@ -829,14 +839,7 @@ out:
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
 
@@ -857,8 +860,7 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, size_t len, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        return nvme_map_sgl(n, &req->qsg, &req->iov, req->cmd.dptr.sgl, len,
-                            req);
+        return nvme_map_sgl(n, &req->sg, req->cmd.dptr.sgl, len, req);
     default:
         return NVME_INVALID_FIELD;
     }
@@ -874,16 +876,13 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
         return status;
     }
 
-    /* assert that only one of qsg and iov carries data */
-    assert((req->qsg.nsg > 0) != (req->iov.niov > 0));
-
-    if (req->qsg.nsg > 0) {
+    if (req->sg.flags & NVME_SG_DMA) {
         uint64_t residual;
 
         if (dir == DMA_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &req->qsg);
+            residual = dma_buf_write(ptr, len, &req->sg.qsg);
         } else {
-            residual = dma_buf_read(ptr, len, &req->qsg);
+            residual = dma_buf_read(ptr, len, &req->sg.qsg);
         }
 
         if (unlikely(residual)) {
@@ -894,9 +893,9 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
         size_t bytes;
 
         if (dir == DMA_DIRECTION_TO_DEVICE) {
-            bytes = qemu_iovec_to_buf(&req->iov, 0, ptr, len);
+            bytes = qemu_iovec_to_buf(&req->sg.iov, 0, ptr, len);
         } else {
-            bytes = qemu_iovec_from_buf(&req->iov, 0, ptr, len);
+            bytes = qemu_iovec_from_buf(&req->sg.iov, 0, ptr, len);
         }
 
         if (unlikely(bytes != len)) {
@@ -908,6 +907,32 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return status;
 }
 
+static inline void nvme_blk_read(BlockBackend *blk, int64_t offset,
+                                 BlockCompletionFunc *cb, NvmeRequest *req)
+{
+    assert(req->sg.flags & NVME_SG_ALLOC);
+
+    if (req->sg.flags & NVME_SG_DMA) {
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
+    assert(req->sg.flags & NVME_SG_ALLOC);
+
+    if (req->sg.flags & NVME_SG_DMA) {
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
@@ -938,7 +963,7 @@ static void nvme_post_cqes(void *opaque)
         }
         QTAILQ_REMOVE(&cq->req_list, req, entry);
         nvme_inc_cq_tail(cq);
-        nvme_req_exit(req);
+        nvme_sg_unmap(&req->sg);
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
@@ -1635,14 +1660,14 @@ static void nvme_copy_in_complete(NvmeRequest *req)
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
 
@@ -2078,13 +2103,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -2164,13 +2183,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
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
2.30.1


