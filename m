Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD52C5E4E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:50:33 +0100 (CET)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR20-0000kX-0U
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxt-0007P8-Ks; Thu, 26 Nov 2020 18:46:17 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxk-0003sL-Su; Thu, 26 Nov 2020 18:46:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D311A580E83;
 Thu, 26 Nov 2020 18:46:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sBPATm+u2MfPv
 qufWKbPI4pSHthzu9uObTwJH52y8Q0=; b=1ZpSg2B8YF1z9unSMZEEpBjOS2JBW
 Bj+XPbdIGw01Bu8IA1gQTyC/jUkMJSlypVQ++IgB+X14ADZVODxMkDkbXrqIgNEA
 VdRFgcvo8w6updEe8TBKtbTqq/Z+sNl47uhOSdpP0miguWnhO5lHA+3eHXYsygGZ
 +FjYcpnBKGE8uLS+TINqd8WxDDxWEfLM4UoK9STQtmXQilh1bONKUVulmm9dJZ9R
 P5sg/diJ/ZPQvP8NyjpMvrbed7lEjx/zsnTW21emDn8byMKqvZOHp34nGyE59TNF
 TwITE4YSyhnII+eUrCeCjNG4y+31+U9kvAiBwBE7yas0sFA6di6dUAWBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sBPATm+u2MfPvqufWKbPI4pSHthzu9uObTwJH52y8Q0=; b=cej9pILW
 mVEYUMmY9H3rj9rJuyTsPQGcDbbkkyadzvEVNzDS1CIAwU1eCkbWACmpcQnH27Bl
 5+ljRlLZDaaiEOl8C6cXarqWxY4MhVRLLqmHa5VNQaUIbVChQ2DrSSpYnU7zIR5N
 /CaLVjZLpxa5kvp8FayABpRVlzq6XJyNpal36HciRAPozJiLGe3Bv7KWmMJCOI5j
 V0Lkc+xNkV0HVcUatmJl8ReRDuVnvaPZIWl+ZQycEJMciY+yBvAmMmlexuEUnvCL
 I5L3Y6SKLqWNoMEjwJzKBTNX0enp7rc12cCQSQjNrB0IVdjErPOzZ/fsh4oFcLco
 H0xzyjukd67gIQ==
X-ME-Sender: <xms:Pz7AXzrxzE73AbzyHfdGqGBtYihDeO1jWjNElz44Tb53cunUaQkaxg>
 <xme:Pz7AX9rtaqMk9pcPi3R9Zs__5DtOdvbCKZp1AxphNTkXQiJdhkCa2YoC8AW2Q5d-1
 _VndvO4Q0wt_b3pel8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Pz7AXwN6ke6WrsCwAvQW98DlcIfNgicq7Y7oOZt-ef7cInTrZpV6jg>
 <xmx:Pz7AX24RN6FM56OUlco7P5QRMSoksh-VyDtJmPQ7j6tV_uT7u7HNvw>
 <xmx:Pz7AXy4Ex89FsQf-2JUPcl2l2J5t9LrBL9elGchjFpuFtdT_Rm4QbQ>
 <xmx:Pz7AX0vp7lZzoQB-yBYsTE8xRJ6gVVYlYCDNS2U8lpYHKcyNgSUK4A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 43D733064AAA;
 Thu, 26 Nov 2020 18:46:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/12] hw/block/nvme: Merge nvme_write_zeroes() with
 nvme_write()
Date: Fri, 27 Nov 2020 00:45:51 +0100
Message-Id: <20201126234601.689714-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126234601.689714-1-its@irrelevant.dk>
References: <20201126234601.689714-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

nvme_write() now handles WRITE, WRITE ZEROES and ZONE_APPEND.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
[kj: rebased]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 69 +++++++++++++++++--------------------------
 hw/block/trace-events |  1 -
 2 files changed, 27 insertions(+), 43 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 657d0b8b2922..0050ef87cb92 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1449,31 +1449,6 @@ invalid:
     return status;
 }
 
-static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
-{
-    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    NvmeNamespace *ns = req->ns;
-    uint64_t slba = le64_to_cpu(rw->slba);
-    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
-    uint64_t offset = nvme_l2b(ns, slba);
-    uint32_t count = nvme_l2b(ns, nlb);
-    uint16_t status;
-
-    trace_pci_nvme_write_zeroes(nvme_cid(req), nvme_nsid(ns), slba, nlb);
-
-    status = nvme_check_bounds(ns, slba, nlb);
-    if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
-        return status;
-    }
-
-    block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
-                     BLOCK_ACCT_WRITE);
-    req->aiocb = blk_aio_pwrite_zeroes(req->ns->blkconf.blk, offset, count,
-                                       BDRV_REQ_MAY_UNMAP, nvme_rw_cb, req);
-    return NVME_NO_COMPLETE;
-}
-
 static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -1483,15 +1458,18 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
     uint64_t data_size = nvme_l2b(ns, nlb);
     uint64_t data_offset;
     BlockBackend *blk = ns->blkconf.blk;
+    bool wrz = rw->opcode == NVME_CMD_WRITE_ZEROES;
     uint16_t status;
 
     trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
                          nvme_nsid(ns), nlb, data_size, slba);
 
-    status = nvme_check_mdts(n, data_size);
-    if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
-        goto invalid;
+    if (!wrz) {
+        status = nvme_check_mdts(n, data_size);
+        if (status) {
+            trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
+            goto invalid;
+        }
     }
 
     status = nvme_check_bounds(ns, slba, nlb);
@@ -1500,22 +1478,30 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    status = nvme_map_dptr(n, data_size, req);
-    if (status) {
-        goto invalid;
-    }
-
     data_offset = nvme_l2b(ns, slba);
 
-    block_acct_start(blk_get_stats(blk), &req->acct, data_size,
-                     BLOCK_ACCT_WRITE);
-    if (req->qsg.sg) {
-        req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
-                                   BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+    if (!wrz) {
+        status = nvme_map_dptr(n, data_size, req);
+        if (status) {
+            goto invalid;
+        }
+
+        block_acct_start(blk_get_stats(blk), &req->acct, data_size,
+                         BLOCK_ACCT_WRITE);
+        if (req->qsg.sg) {
+            req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
+                                       BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+        } else {
+            req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
+                                         nvme_rw_cb, req);
+        }
     } else {
-        req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
-                                     nvme_rw_cb, req);
+        block_acct_start(blk_get_stats(blk), &req->acct, 0, BLOCK_ACCT_WRITE);
+        req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
+                                           BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
+                                           req);
     }
+
     return NVME_NO_COMPLETE;
 
 invalid:
@@ -1547,7 +1533,6 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_FLUSH:
         return nvme_flush(n, req);
     case NVME_CMD_WRITE_ZEROES:
-        return nvme_write_zeroes(n, req);
     case NVME_CMD_WRITE:
         return nvme_write(n, req);
     case NVME_CMD_READ:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index cc269b51a1e0..35ea40c49169 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -47,7 +47,6 @@ pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"P
 pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
 pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
-- 
2.29.2


