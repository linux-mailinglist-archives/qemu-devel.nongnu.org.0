Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3C31B32E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:08:40 +0100 (CET)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQVL-0006xS-C0
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPo-0004Ma-4N; Sun, 14 Feb 2021 18:02:56 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPl-0001nT-1H; Sun, 14 Feb 2021 18:02:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 465B25C0083;
 Sun, 14 Feb 2021 18:02:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Feb 2021 18:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8MkHjUbqOyJBY
 SYhYhmDRc54dLW+sYOn0/4axJwbSXs=; b=LAVusKVIhMjgxodLvBDe1XTfxPrtG
 Sb5KRuzmUKqfu5Hc/j5zbHCG3q7bLMKr/Ssni+T6fPpIJMZgzobM/rvym7W/yxgU
 PTX0dpsdhUac6SPeQMnhpumn3CwqWQnztKOobQczhsJoXkD9Yh3txje1kMFyKIFu
 wOFYCGry6elBlmPDJPi1d7LilgYAnNi6G/B0XAd2m6su+02rnLok5+g8wyr6TB79
 YOqer7OgyolG3b8qB0sUmTFT2TsM/nRmjVdOGEF5tiDQX8HhNQgrx5P6cgtIE9GZ
 GU26DcuiWncwGBpRRLYKdnLzhNtNlO8NVH+n3i3KnkYzeF9PFM8l8vJpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8MkHjUbqOyJBYSYhYhmDRc54dLW+sYOn0/4axJwbSXs=; b=uLo7zt9B
 GE052vdJzyjUTIeNmYuNbKvQTWGjVsb5grAV9Z0z6bEar47S8JIcOsE8vQ3jpHFb
 Lt5Hj15UOxgtlvRV8EtGc+rwMPpiW+Ycb+y/VAtRxmrhURk1WQ09bDWAKvsrEeJn
 RTfxJk4tAQKoetpDuLWLCbNYdqmsXvQK/OQE2amDwT9ljLSBA01NNZrtwHk3enxC
 KIhqdUPAaaeYQkYScyr7WKLKM962kzS+GbTLWMsPUwOWye/ibwzVfTt5HE/NS5u9
 ++07iu6jikbIrYV3Tj/WDr2Ow8HrNqhdgB2jefsi70Zprfa9QfXspgvL3RT1doBb
 QenthxBDdxTu9g==
X-ME-Sender: <xms:HKwpYFDQU0c5Y4As4mXccoScjbFUA6gz_olY8GAW6MZYdKYQoODdfw>
 <xme:HKwpYDiujV1DRuKq7ADzH52SGqAUh7u68sd_Xu_6as2fyKQ-lAtTpwx9-U7Y6vWCn
 nu_JiUghf8sK2HR9Bs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HKwpYAnW2UIeLtxGkvV4S13Gp1NpCx1T_3dLfR0rU7dPPyrFU_RSCg>
 <xmx:HKwpYPyjO5AGIkJvOCehZnsp3Lrf8VdIY4D6Yqz10Xn0E0YiszJOiA>
 <xmx:HKwpYKT-TO8wyeHPQ27-4cOUID7D3ok0Dr-Yo4REuMkt88FxToJWQg>
 <xmx:HKwpYHQ2H8BLw-8jEJmV0fryVB8vRMaHdDziBfFTPu4gGAno3KwFIg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D880C240057;
 Sun, 14 Feb 2021 18:02:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 05/12] hw/block/nvme: remove the req dependency in map
 functions
Date: Mon, 15 Feb 2021 00:02:33 +0100
Message-Id: <20210214230240.301275-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
References: <20210214230240.301275-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The PRP and SGL mapping functions does not have any particular need for
the entire NvmeRequest as a parameter. Clean it up.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 61 ++++++++++++++++++++++---------------------
 hw/block/trace-events |  4 +--
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 96abb2533b4d..b0f163374cf7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -531,8 +531,8 @@ static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
     return !(nvme_addr_is_cmb(n, addr) || nvme_addr_is_pmr(n, addr));
 }
 
-static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
-                             uint32_t len, NvmeRequest *req)
+static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
+                             uint64_t prp2, uint32_t len)
 {
     hwaddr trans_len = n->page_size - (prp1 % n->page_size);
     trans_len = MIN(len, trans_len);
@@ -542,9 +542,9 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    nvme_sg_init(n, &req->sg, nvme_addr_is_dma(n, prp1));
+    nvme_sg_init(n, sg, nvme_addr_is_dma(n, prp1));
 
-    status = nvme_map_addr(n, &req->sg, prp1, trans_len);
+    status = nvme_map_addr(n, sg, prp1, trans_len);
     if (status) {
         goto unmap;
     }
@@ -594,7 +594,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 }
 
                 trans_len = MIN(len, n->page_size);
-                status = nvme_map_addr(n, &req->sg, prp_ent, trans_len);
+                status = nvme_map_addr(n, sg, prp_ent, trans_len);
                 if (status) {
                     goto unmap;
                 }
@@ -608,7 +608,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
                 goto unmap;
             }
-            status = nvme_map_addr(n, &req->sg, prp2, len);
+            status = nvme_map_addr(n, sg, prp2, len);
             if (status) {
                 goto unmap;
             }
@@ -618,7 +618,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     return NVME_SUCCESS;
 
 unmap:
-    nvme_sg_unmap(&req->sg);
+    nvme_sg_unmap(sg);
     return status;
 }
 
@@ -628,7 +628,7 @@ unmap:
  */
 static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                                   NvmeSglDescriptor *segment, uint64_t nsgld,
-                                  size_t *len, NvmeRequest *req)
+                                  size_t *len, NvmeCmd *cmd)
 {
     dma_addr_t addr, trans_len;
     uint32_t dlen;
@@ -639,7 +639,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
 
         switch (type) {
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            if (req->cmd.opcode == NVME_CMD_WRITE) {
+            if (cmd->opcode == NVME_CMD_WRITE) {
                 continue;
             }
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
@@ -668,7 +668,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                 break;
             }
 
-            trace_pci_nvme_err_invalid_sgl_excess_length(nvme_cid(req));
+            trace_pci_nvme_err_invalid_sgl_excess_length(dlen);
             return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
         }
 
@@ -697,7 +697,7 @@ next:
 }
 
 static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
-                             size_t len, NvmeRequest *req)
+                             size_t len, NvmeCmd *cmd)
 {
     /*
      * Read the segment in chunks of 256 descriptors (one 4k page) to avoid
@@ -718,7 +718,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
     sgld = &sgl;
     addr = le64_to_cpu(sgl.addr);
 
-    trace_pci_nvme_map_sgl(nvme_cid(req), NVME_SGL_TYPE(sgl.type), len);
+    trace_pci_nvme_map_sgl(NVME_SGL_TYPE(sgl.type), len);
 
     nvme_sg_init(n, sg, nvme_addr_is_dma(n, addr));
 
@@ -727,7 +727,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
      * be mapped directly.
      */
     if (NVME_SGL_TYPE(sgl.type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
-        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -766,7 +766,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
             }
 
             status = nvme_map_sgl_data(n, sg, segment, SEG_CHUNK_SIZE,
-                                       &len, req);
+                                       &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -792,7 +792,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         switch (NVME_SGL_TYPE(last_sgld->type)) {
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, req);
+            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -819,7 +819,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
          * Do not map the last descriptor; it will be a Segment or Last Segment
          * descriptor and is handled by the next iteration.
          */
-        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -839,24 +839,20 @@ unmap:
     return status;
 }
 
-static uint16_t nvme_map_dptr(NvmeCtrl *n, size_t len, NvmeRequest *req)
+static uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
+                              NvmeCmd *cmd)
 {
     uint64_t prp1, prp2;
 
-    switch (NVME_CMD_FLAGS_PSDT(req->cmd.flags)) {
+    switch (NVME_CMD_FLAGS_PSDT(cmd->flags)) {
     case NVME_PSDT_PRP:
-        prp1 = le64_to_cpu(req->cmd.dptr.prp1);
-        prp2 = le64_to_cpu(req->cmd.dptr.prp2);
+        prp1 = le64_to_cpu(cmd->dptr.prp1);
+        prp2 = le64_to_cpu(cmd->dptr.prp2);
 
-        return nvme_map_prp(n, prp1, prp2, len, req);
+        return nvme_map_prp(n, sg, prp1, prp2, len);
     case NVME_PSDT_SGL_MPTR_CONTIGUOUS:
     case NVME_PSDT_SGL_MPTR_SGL:
-        /* SGLs shall not be used for Admin commands in NVMe over PCIe */
-        if (!req->sq->sqid) {
-            return NVME_INVALID_FIELD | NVME_DNR;
-        }
-
-        return nvme_map_sgl(n, &req->sg, req->cmd.dptr.sgl, len, req);
+        return nvme_map_sgl(n, sg, cmd->dptr.sgl, len, cmd);
     default:
         return NVME_INVALID_FIELD;
     }
@@ -867,7 +863,7 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 {
     uint16_t status = NVME_SUCCESS;
 
-    status = nvme_map_dptr(n, len, req);
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
     if (status) {
         return status;
     }
@@ -2083,7 +2079,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_map_dptr(n, data_size, req);
+    status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
     if (status) {
         goto invalid;
     }
@@ -2174,7 +2170,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
-        status = nvme_map_dptr(n, data_size, req);
+        status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
         if (status) {
             goto invalid;
         }
@@ -3852,6 +3848,11 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
+    /* SGLs shall not be used for Admin commands in NVMe over PCIe */
+    if (NVME_CMD_FLAGS_PSDT(req->cmd.flags) != NVME_PSDT_PRP) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
         return nvme_del_sq(n, req);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b04f7a3e1890..3a4003f107a5 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -37,7 +37,7 @@ pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2
 pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
-pci_nvme_map_sgl(uint16_t cid, uint8_t typ, uint64_t len) "cid %"PRIu16" type 0x%"PRIx8" len %"PRIu64""
+pci_nvme_map_sgl(uint8_t typ, uint64_t len) "type 0x%"PRIx8" len %"PRIu64""
 pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
@@ -123,7 +123,7 @@ pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu
 pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
 pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
-pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
+pci_nvme_err_invalid_sgl_excess_length(uint32_t residual) "residual %"PRIu32""
 pci_nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
 pci_nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is not page aligned: 0x%"PRIx64""
 pci_nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PRIx64""
-- 
2.30.0


