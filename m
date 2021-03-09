Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EAA332566
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:23:23 +0100 (CET)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbOU-0006k5-1u
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoU-0000OJ-1r; Tue, 09 Mar 2021 06:46:10 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoO-0000gR-AD; Tue, 09 Mar 2021 06:46:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2A5ED2773;
 Tue,  9 Mar 2021 06:46:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=6xdWcItI5V3DE
 2Nyc9LS/NnV41O+rDzrC4PEbPvyRFM=; b=sqwQieejD6vykLwpFgbshsPKVmO9x
 1EWoiFOk/8vt/Ir3+HwahWKesJ3uujAi20js1Mk9Xw4rr2LTuSJrBoTiz087bANk
 19O0XTSpy5rC7zTK4lyC9Jsbay+FnXCAI+/IWwyog7Bu+Gh3j/+SV+rDFddyurFS
 D32Xbux89/yNn3v2cuOYuYTq6WACKNW++ZZlwDWSnAC+MLKGX9JyZ7bwfpssL0ZK
 PL+rAJkRbpI/kWd1j23+OVkK1RkbG6DUe1OmaaTU5wcyvF4tzfJGBkrpZ2y3eJTD
 9G7Zs4bn2XaqzHWr7++X0XCzSMgVhMr2RFOn3VjvD9TFJakI07KHpo0qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6xdWcItI5V3DE2Nyc9LS/NnV41O+rDzrC4PEbPvyRFM=; b=Wl7fZ6pS
 wr61wd72NxoisKwaCP3B3AEQ61/Vm5213i1JP7V5SM/oLaFb3mSo6Y8T+LgH/G7O
 Q4pfKmKyUSJooboitJNWw07M3wPnYT0oboFUj1BW37ttrNTA7G10R9bLQV2St6BQ
 GrTjoJYLTnGDTrHCXm/x+b17X0rcTNOt7NSG0z9UdSyrZnSad0mBjReP/11QPcCH
 BH++yxjezVzRXRvm9bOaycySR6nxiOWoqoyH6ZYynoa0e5tYc33AHW4yX5Uq45Gy
 9yfi3NQ/oFKDpxECIj/zp77Q32koZhf0s+CgDEPTnP+ac2ZgX6ux+oleUmrNaZom
 ambAGvMdtVkhZg==
X-ME-Sender: <xms:-V9HYIlDlwR7bNNoQP-AN3Cz-VU4RderrgOHQJ0bzzLr6B9d9Db2dQ>
 <xme:-V9HYH3zVjP_aL-fmJI12JVWBl2l_K5TejhNNDnEBUJ2_frxVT0jjBeqxutma4c0W
 bTPNNO4XpMYhcW1Uyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduke
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-V9HYGpSZM9jRM6FJ_-Derj7K89Wbbe818HugETrAzrAflXWwLyUfQ>
 <xmx:-V9HYEm_XZo6won12z3aGNl9UI4fXLOkBFVZ2Vrj2CIW1sEdH0Gpxw>
 <xmx:-V9HYG3MVdUZ7HKYW4rSBJfIExLcn_gmgMA2HdkENz1B--MU7ZU_NA>
 <xmx:-V9HYPlWCN4KLKn9GvOgWvGnsB64DrKaOVdF0BZBdH4_ooJEIqU82w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F82024005D;
 Tue,  9 Mar 2021 06:46:00 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 29/38] hw/block/nvme: remove the req dependency in map
 functions
Date: Tue,  9 Mar 2021 12:45:03 +0100
Message-Id: <20210309114512.536489-30-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The PRP and SGL mapping functions does not have any particular need for
the entire NvmeRequest as a parameter. Clean it up.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c       | 61 ++++++++++++++++++++++---------------------
 hw/block/trace-events |  4 +--
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a1e28c6570d4..59942f88113f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -544,8 +544,8 @@ static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
     return !(nvme_addr_is_cmb(n, addr) || nvme_addr_is_pmr(n, addr));
 }
 
-static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
-                             uint32_t len, NvmeRequest *req)
+static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
+                             uint64_t prp2, uint32_t len)
 {
     hwaddr trans_len = n->page_size - (prp1 % n->page_size);
     trans_len = MIN(len, trans_len);
@@ -555,9 +555,9 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    nvme_sg_init(n, &req->sg, nvme_addr_is_dma(n, prp1));
+    nvme_sg_init(n, sg, nvme_addr_is_dma(n, prp1));
 
-    status = nvme_map_addr(n, &req->sg, prp1, trans_len);
+    status = nvme_map_addr(n, sg, prp1, trans_len);
     if (status) {
         goto unmap;
     }
@@ -607,7 +607,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 }
 
                 trans_len = MIN(len, n->page_size);
-                status = nvme_map_addr(n, &req->sg, prp_ent, trans_len);
+                status = nvme_map_addr(n, sg, prp_ent, trans_len);
                 if (status) {
                     goto unmap;
                 }
@@ -621,7 +621,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
                 goto unmap;
             }
-            status = nvme_map_addr(n, &req->sg, prp2, len);
+            status = nvme_map_addr(n, sg, prp2, len);
             if (status) {
                 goto unmap;
             }
@@ -631,7 +631,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     return NVME_SUCCESS;
 
 unmap:
-    nvme_sg_unmap(&req->sg);
+    nvme_sg_unmap(sg);
     return status;
 }
 
@@ -641,7 +641,7 @@ unmap:
  */
 static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                                   NvmeSglDescriptor *segment, uint64_t nsgld,
-                                  size_t *len, NvmeRequest *req)
+                                  size_t *len, NvmeCmd *cmd)
 {
     dma_addr_t addr, trans_len;
     uint32_t dlen;
@@ -652,7 +652,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
 
         switch (type) {
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            if (req->cmd.opcode == NVME_CMD_WRITE) {
+            if (cmd->opcode == NVME_CMD_WRITE) {
                 continue;
             }
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
@@ -681,7 +681,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                 break;
             }
 
-            trace_pci_nvme_err_invalid_sgl_excess_length(nvme_cid(req));
+            trace_pci_nvme_err_invalid_sgl_excess_length(dlen);
             return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
         }
 
@@ -710,7 +710,7 @@ next:
 }
 
 static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
-                             size_t len, NvmeRequest *req)
+                             size_t len, NvmeCmd *cmd)
 {
     /*
      * Read the segment in chunks of 256 descriptors (one 4k page) to avoid
@@ -731,7 +731,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
     sgld = &sgl;
     addr = le64_to_cpu(sgl.addr);
 
-    trace_pci_nvme_map_sgl(nvme_cid(req), NVME_SGL_TYPE(sgl.type), len);
+    trace_pci_nvme_map_sgl(NVME_SGL_TYPE(sgl.type), len);
 
     nvme_sg_init(n, sg, nvme_addr_is_dma(n, addr));
 
@@ -740,7 +740,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
      * be mapped directly.
      */
     if (NVME_SGL_TYPE(sgl.type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
-        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -779,7 +779,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
             }
 
             status = nvme_map_sgl_data(n, sg, segment, SEG_CHUNK_SIZE,
-                                       &len, req);
+                                       &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -805,7 +805,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         switch (NVME_SGL_TYPE(last_sgld->type)) {
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, req);
+            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -832,7 +832,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
          * Do not map the last descriptor; it will be a Segment or Last Segment
          * descriptor and is handled by the next iteration.
          */
-        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -852,24 +852,20 @@ unmap:
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
@@ -880,7 +876,7 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 {
     uint16_t status = NVME_SUCCESS;
 
-    status = nvme_map_dptr(n, len, req);
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
     if (status) {
         return status;
     }
@@ -2096,7 +2092,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_map_dptr(n, data_size, req);
+    status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
     if (status) {
         goto invalid;
     }
@@ -2185,7 +2181,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
-        status = nvme_map_dptr(n, data_size, req);
+        status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
         if (status) {
             goto invalid;
         }
@@ -3867,6 +3863,11 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
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
index 8deeacc8c35c..60a076cea54f 100644
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
@@ -126,7 +126,7 @@ pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu
 pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
 pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
-pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
+pci_nvme_err_invalid_sgl_excess_length(uint32_t residual) "residual %"PRIu32""
 pci_nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
 pci_nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is not page aligned: 0x%"PRIx64""
 pci_nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PRIx64""
-- 
2.30.1


