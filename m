Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B643127C6
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:07:56 +0100 (CET)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8sDj-00017Z-6v
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwJ-0000eP-OK; Sun, 07 Feb 2021 16:49:55 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwG-0004R1-PD; Sun, 07 Feb 2021 16:49:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 06A955C00C1;
 Sun,  7 Feb 2021 16:49:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BQZijiKyGPWgJ
 dmqEiZwPb6tk3In04ZggQSqETfzK9o=; b=v3OfXpU0WNvqKWPylkNveJmXwpK0J
 oEnEG5MkA/4LwxJlrQOJQlhqRzUjGTL7FxakXRloPKcXwi2rh5s1/7xtWSfw9rsa
 o2tyMrIG6bwyKEERwBJI1l6lnWzsJ1Mogl9c8pUW13zmIFEziNIyuDl6k1ZNjKib
 pzO7Zrnyzbx55vkNhGWWCCaQbkGNIyko7AUF6dMHZ+22yNclJL8Z+dKm1EHmmwOb
 Ql6L3YM6y6CQVI8cNqFnnvePR7GpgOGff2J3B67B2uF3peqwrPmXKWwXRSLJ9/Gz
 656IX8eTPduHEzfjAmUjLKgCe+TEIr8JA4zXwArwxXvlgyQgFdo8pMROw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BQZijiKyGPWgJdmqEiZwPb6tk3In04ZggQSqETfzK9o=; b=apyI9lNl
 FJ9W0wl6/AR7tOOj8SCWWsuYcrOdct5VeXxWnUGSCbLvCk+Si/GtBPt7zCngK9Tb
 NM23KCrddm1YV9EvIpjDJF+pV8saXTSEb4RTm8Q1OKHjAISyQhAU47XgFr+17xvf
 uyEeFqq+MFJdmqBfbKKIz2J9sBrNuImIAeUxgVZFNtrKwerskEOfhsatN/qAf9xr
 mQz0iy3X8EXEms6EPteLuRCvj0OM8ZSXjC6uuwiME2i6am08s6ZqLv2J5dHYvBsA
 ldcTycVALQazfuNj24Ufhz4ghM0qAPXxhX9TI9gQ5FdeoaPH9RssqFT3D3DZj12P
 Tg0QLyySYp1tmg==
X-ME-Sender: <xms:fmAgYPa52wzLbVpaRomVls0sTyChT1oUJ6d6G0I_K929KncY5L_mVg>
 <xme:fmAgYOZNX-28DhOJ_wyUQmaqvsS-hMZu2DSDT2SxXRa1oVsEnnYGGhOizVe7RVCl6
 kgSGE1gUeiBPhdP964>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fmAgYB8n-ezfnmb9QfcOHQd6Exve_lXb6lWtFlV69ZKX1s6BMonZvw>
 <xmx:fmAgYFrusvY-gpdNGlIcKqxSxJ5vLgkbisE96LhFYqsrFLC0PafRLA>
 <xmx:fmAgYKockM-M9XlHQZUKmCV8cpmVoRNtfYLK907Re63FWqy1DMYB0w>
 <xmx:f2AgYKIdcII3Qn1CizvT12xXFDu7khXYHbCt3up4twc9mY_5MYEDEA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D8C01080057;
 Sun,  7 Feb 2021 16:49:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 5/8] hw/block/nvme: remove the req dependency in map
 functions
Date: Sun,  7 Feb 2021 22:49:37 +0100
Message-Id: <20210207214940.281889-6-its@irrelevant.dk>
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

The PRP and SGL mapping functions does not have any particular need for
the entire NvmeRequest as a parameter. Clean it up.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 61 ++++++++++++++++++++++---------------------
 hw/block/trace-events |  4 +--
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a0009c057f1e..24156699b035 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -516,8 +516,8 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
-                             uint32_t len, NvmeRequest *req)
+static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
+                             uint64_t prp2, uint32_t len)
 {
     hwaddr trans_len = n->page_size - (prp1 % n->page_size);
     trans_len = MIN(len, trans_len);
@@ -527,9 +527,9 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    nvme_sg_init(n, &req->sg);
+    nvme_sg_init(n, sg);
 
-    status = nvme_map_addr(n, &req->sg, prp1, trans_len);
+    status = nvme_map_addr(n, sg, prp1, trans_len);
     if (status) {
         goto unmap;
     }
@@ -579,7 +579,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 }
 
                 trans_len = MIN(len, n->page_size);
-                status = nvme_map_addr(n, &req->sg, prp_ent, trans_len);
+                status = nvme_map_addr(n, sg, prp_ent, trans_len);
                 if (status) {
                     goto unmap;
                 }
@@ -593,7 +593,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                 status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
                 goto unmap;
             }
-            status = nvme_map_addr(n, &req->sg, prp2, len);
+            status = nvme_map_addr(n, sg, prp2, len);
             if (status) {
                 goto unmap;
             }
@@ -603,7 +603,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     return NVME_SUCCESS;
 
 unmap:
-    nvme_sg_unmap(&req->sg);
+    nvme_sg_unmap(sg);
     return status;
 }
 
@@ -613,7 +613,7 @@ unmap:
  */
 static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                                   NvmeSglDescriptor *segment, uint64_t nsgld,
-                                  size_t *len, NvmeRequest *req)
+                                  size_t *len, NvmeCmd *cmd)
 {
     dma_addr_t addr, trans_len;
     uint32_t dlen;
@@ -624,7 +624,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
 
         switch (type) {
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            if (req->cmd.opcode == NVME_CMD_WRITE) {
+            if (cmd->opcode == NVME_CMD_WRITE) {
                 continue;
             }
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
@@ -653,7 +653,7 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
                 break;
             }
 
-            trace_pci_nvme_err_invalid_sgl_excess_length(nvme_cid(req));
+            trace_pci_nvme_err_invalid_sgl_excess_length(dlen);
             return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
         }
 
@@ -682,7 +682,7 @@ next:
 }
 
 static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
-                             size_t len, NvmeRequest *req)
+                             size_t len, NvmeCmd *cmd)
 {
     /*
      * Read the segment in chunks of 256 descriptors (one 4k page) to avoid
@@ -705,14 +705,14 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
     sgld = &sgl;
     addr = le64_to_cpu(sgl.addr);
 
-    trace_pci_nvme_map_sgl(nvme_cid(req), NVME_SGL_TYPE(sgl.type), len);
+    trace_pci_nvme_map_sgl(NVME_SGL_TYPE(sgl.type), len);
 
     /*
      * If the entire transfer can be described with a single data block it can
      * be mapped directly.
      */
     if (NVME_SGL_TYPE(sgl.type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
-        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, sgld, 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -751,7 +751,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
             }
 
             status = nvme_map_sgl_data(n, sg, segment, SEG_CHUNK_SIZE,
-                                       &len, req);
+                                       &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -777,7 +777,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         switch (NVME_SGL_TYPE(last_sgld->type)) {
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
         case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, req);
+            status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, cmd);
             if (status) {
                 goto unmap;
             }
@@ -804,7 +804,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
          * Do not map the last descriptor; it will be a Segment or Last Segment
          * descriptor and is handled by the next iteration.
          */
-        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, req);
+        status = nvme_map_sgl_data(n, sg, segment, nsgld - 1, &len, cmd);
         if (status) {
             goto unmap;
         }
@@ -824,24 +824,20 @@ unmap:
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
@@ -852,7 +848,7 @@ static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 {
     uint16_t status = NVME_SUCCESS;
 
-    status = nvme_map_dptr(n, len, req);
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
     if (status) {
         return status;
     }
@@ -1985,7 +1981,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_map_dptr(n, data_size, req);
+    status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
     if (status) {
         goto invalid;
     }
@@ -2076,7 +2072,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
-        status = nvme_map_dptr(n, data_size, req);
+        status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
         if (status) {
             goto invalid;
         }
@@ -3732,6 +3728,11 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
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
index b6e972d733a6..fe4a6c24306d 100644
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
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
@@ -121,7 +121,7 @@ pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu
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


