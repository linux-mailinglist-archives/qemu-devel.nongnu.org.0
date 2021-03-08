Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A65330EC2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:59:00 +0100 (CET)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFTP-0006al-9v
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEve-0003be-K4; Mon, 08 Mar 2021 07:24:06 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvc-000770-9C; Mon, 08 Mar 2021 07:24:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 33B8436C8;
 Mon,  8 Mar 2021 07:24:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=w5h2QSspehH+y
 XRUIDJBEMAjCtHdSbe/Q9TCLDYc0e8=; b=FIsW/miXUH9vlFL94aGYduhjibUsu
 qgVnvJlqkF22DPL0uFM7qTxefb8Yh6uIAC4T0tY4RDT9f4cwLWvpA/WllFhnIFQD
 RLIs7VfjwVr7v/oBUmQZ0nCYrHGzJ5pWAWdZoA6jwQ9K5zDWWZ9M3B08TLVK+VHl
 Fd6R6Wt35kQz9pTMAbI2atbCLn+g2KmTXChgrqEyP2/cYS3epWiIvcYJhauOoukC
 RK5ltyEvQ5BXtqAPb+Z93DNiwmMjglDNIHdTOhmMwIesBv/Aft4Rcrtxost43unp
 ozgWDi9X+sWu+6ETeaIr+xqaGudkYcdFh5KkfKesbs/CujUwFT888AluA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=w5h2QSspehH+yXRUIDJBEMAjCtHdSbe/Q9TCLDYc0e8=; b=PFvjT+6i
 wAFvK5osjernnxPReV+XH5ZXrDfNxHwpyVMJS21LIWTWavFRXYWTGfe9+oc7Bj4V
 PuB1YXPd5eEuc5GYKtMTC6TDqRZgMbrCmDzVhsA3sB4rM33ZWw2dWbcE5bfFOK9X
 6wxvaCS246Ewak4oVgxIuX8u9sUk1u8oti1suoTJzwF1qId39Ft/C2NcuJEtzmZ4
 Es9pUz1Q490J7HhPnA4SdhNITkbm61Nu/bgvkD239n5E9AQaBKbyrX9G3d84WzE0
 1f71KWVvMHfNiqlfXokhgVRlgOk1Rs/sSgagYx5rQUOm7Y0SoWJzf0YdoMJ0h5BG
 9Anqi6FCFH9Svw==
X-ME-Sender: <xms:YRdGYOnlMdr7j73TKFiclMLNiLsuJmgBJgvlNK8gaK6UPnB77c-Ocg>
 <xme:YRdGYF1WkASO20weWgyxxW62kJS51yRAAo1x2mbE50XnpDVOCO7SahQjd7OcacjZh
 BSKgqRAj13JWSuEAQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YRdGYMqrKNqmp_52R3R2QQqbJyVxQCbbpWzXewr4xZmvZDjlRj81tw>
 <xmx:YRdGYCkNxDwg_L3H2YkaTGy_xC_56IulZKXYjswUyZDOImH7ukqB0Q>
 <xmx:YRdGYM00XO8lgfc_YgwiR8T_WXjInzTtmdHdWIJGulRwV2tV--rlMw>
 <xmx:YRdGYNkx4D2Q2snGcixB6RlhQDbMiTx1bn7ZXoX9-p1wy6Ah4aEsxA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 558B71080063;
 Mon,  8 Mar 2021 07:24:00 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 29/38] hw/block/nvme: remove the req dependency in map functions
Date: Mon,  8 Mar 2021 13:23:04 +0100
Message-Id: <20210308122313.286938-30-its@irrelevant.dk>
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

The PRP and SGL mapping functions does not have any particular need for
the entire NvmeRequest as a parameter. Clean it up.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c       | 61 ++++++++++++++++++++++---------------------
 hw/block/trace-events |  4 +--
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 621e993e652e..fb0bc971704f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -535,8 +535,8 @@ static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
     return !(nvme_addr_is_cmb(n, addr) || nvme_addr_is_pmr(n, addr));
 }
 
-static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
-                             uint32_t len, NvmeRequest *req)
+static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
+                             uint64_t prp2, uint32_t len)
 {
     hwaddr trans_len = n->page_size - (prp1 % n->page_size);
     trans_len = MIN(len, trans_len);
@@ -546,9 +546,9 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    nvme_sg_init(n, &req->sg, nvme_addr_is_dma(n, prp1));
+    nvme_sg_init(n, sg, nvme_addr_is_dma(n, prp1));
 
-    status = nvme_map_addr(n, &req->sg, prp1, trans_len);
+    status = nvme_map_addr(n, sg, prp1, trans_len);
     if (status) {
         goto unmap;
     }
@@ -598,7 +598,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 }
 
                 trans_len = MIN(len, n->page_size);
-                status = nvme_map_addr(n, &req->sg, prp_ent, trans_len);
+                status = nvme_map_addr(n, sg, prp_ent, trans_len);
                 if (status) {
                     goto unmap;
                 }
@@ -612,7 +612,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
                 goto unmap;
             }
-            status = nvme_map_addr(n, &req->sg, prp2, len);
+            status = nvme_map_addr(n, sg, prp2, len);
             if (status) {
                 goto unmap;
             }
@@ -622,7 +622,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     return NVME_SUCCESS;
 
 unmap:
-    nvme_sg_unmap(&req->sg);
+    nvme_sg_unmap(sg);
     return status;
 }
 
@@ -632,7 +632,7 @@ unmap:
  */
 static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                                   NvmeSglDescriptor *segment, uint64_t nsgld,
-                                  size_t *len, NvmeRequest *req)
+                                  size_t *len, NvmeCmd *cmd)
 {
     dma_addr_t addr, trans_len;
     uint32_t dlen;
@@ -643,7 +643,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
 
         switch (type) {
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            if (req->cmd.opcode == NVME_CMD_WRITE) {
+            if (cmd->opcode == NVME_CMD_WRITE) {
                 continue;
             }
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
@@ -672,7 +672,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                 break;
             }
 
-            trace_pci_nvme_err_invalid_sgl_excess_length(nvme_cid(req));
+            trace_pci_nvme_err_invalid_sgl_excess_length(dlen);
             return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
         }
 
@@ -701,7 +701,7 @@ next:
 }
 
 static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
-                             size_t len, NvmeRequest *req)
+                             size_t len, NvmeCmd *cmd)
 {
     /*
      * Read the segment in chunks of 256 descriptors (one 4k page) to avoid
@@ -722,7 +722,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
     sgld = &sgl;
     addr = le64_to_cpu(sgl.addr);
 
-    trace_pci_nvme_map_sgl(nvme_cid(req), NVME_SGL_TYPE(sgl.type), len);
+    trace_pci_nvme_map_sgl(NVME_SGL_TYPE(sgl.type), len);
 
     nvme_sg_init(n, sg, nvme_addr_is_dma(n, addr));
 
@@ -731,7 +731,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
      * be mapped directly.
      */
     if (NVME_SGL_TYPE(sgl.type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
-        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -770,7 +770,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
             }
 
             status = nvme_map_sgl_data(n, sg, segment, SEG_CHUNK_SIZE,
-                                       &len, req);
+                                       &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -796,7 +796,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         switch (NVME_SGL_TYPE(last_sgld->type)) {
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, req);
+            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -823,7 +823,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
          * Do not map the last descriptor; it will be a Segment or Last Segment
          * descriptor and is handled by the next iteration.
          */
-        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -843,24 +843,20 @@ unmap:
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
@@ -871,7 +867,7 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 {
     uint16_t status = NVME_SUCCESS;
 
-    status = nvme_map_dptr(n, len, req);
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
     if (status) {
         return status;
     }
@@ -2087,7 +2083,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_map_dptr(n, data_size, req);
+    status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
     if (status) {
         goto invalid;
     }
@@ -2176,7 +2172,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
-        status = nvme_map_dptr(n, data_size, req);
+        status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
         if (status) {
             goto invalid;
         }
@@ -3858,6 +3854,11 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
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


