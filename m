Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDDF330EBF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:57:33 +0100 (CET)
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFS0-0005bD-57
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvL-0003JA-Eh; Mon, 08 Mar 2021 07:23:47 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:51929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvI-00070S-5l; Mon, 08 Mar 2021 07:23:46 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DF22C360D;
 Mon,  8 Mar 2021 07:23:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mF8wBca9eMTR6
 PhzmNWaM5MpC7I4z28uERjuAGV1HXg=; b=zLzh6bUBnDsMiOJzaBcFV6YCGroFG
 nl2q9+v5byFRTr4BqJYl5BYu134L+0fs5E8lMKyosMakd4AeAfNS9DUvY728hZGV
 HaKArWLYMJQGxIzTofh4lUhjLdRvhOZXn6K4EGc2n7edI6Gbbxh/OCyUQ7I2Siwq
 Puss3Tiw60QZNapBoERUt2lqQCWznM0hun2Aptq5/7u263M8gXBx582HtDeksx0r
 5D8apNHPP8zScbQAc/n8Hr9DtNTadUzg1CKEGrgvCBFRqHpfpbGRelK7N5rsEZzl
 koX/H65ESWvFtQol3EEWFTUjOrve9Kce51/tHyOE/Kof5C14vbNA+DchQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mF8wBca9eMTR6PhzmNWaM5MpC7I4z28uERjuAGV1HXg=; b=UkrSwfea
 +tjvPRxq2FdNITceUsoY0P+SuTuM4CF+cDM939DYxW7awKqUL0g2IJ1NkPFyNs3V
 uvWwvIHUc+YGWaFxDIVek5gE+VGg00smeJTWNxio4deoAO9XcUONZreLf995VnYe
 EsTbU3fcusBE/4HGc44F4BslGT8Md/JSNi4X45fs0gSWCqcYRWvZkAZ1uQwFHxsg
 +d7FO/8S6ULoQAjXWXg8xDemAzDA9y2zV85P5zQ2URJdjNL1VTnVQJz05thAf2aS
 dkKipITguK7v+KvslNuWSnxWB/yqLeHDMppgEz7YNnaxhMsWcEYDQV3JfqpCG81/
 GlOuOCkHKmNoTQ==
X-ME-Sender: <xms:TRdGYNCnXccyoRxeVb0M9OmE6rzISgOaqOTFYbQlacA5t8fJ6zRJSQ>
 <xme:TRdGYLhvW2PJzczwWnORiC-HiKRJthgdoJzyw9EFc2r8MwMRbQWkZYzTo_m1ccIOy
 FvKmXCsR_XANvgHomI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TRdGYIk5TvlfMxbAPXW7bOreH4UFBMAq10Pcd2A4tgkl2Ee1qw3GZw>
 <xmx:TRdGYHwBL4v4-R7Iin-zenFWxk07YdE6lFAE41dixYowQx0nmpZP4w>
 <xmx:TRdGYCTO7KAU0edG3eF1sxJYPOCAHq8DeN8tDyF1cK81bvyq95-qow>
 <xmx:TRdGYFGWEpOgovuLlMG8zbKr6Z7axfWklNZQdC7WUmS5gTYNndpV1cV3cjo>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DC201080066;
 Mon,  8 Mar 2021 07:23:39 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/38] hw/block/nvme: add broadcast nsid support flush command
Date: Mon,  8 Mar 2021 13:22:51 +0100
Message-Id: <20210308122313.286938-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add support for using the broadcast nsid to issue a flush on all
namespaces through a single command.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h  |   8 +++
 hw/block/nvme.c       | 124 +++++++++++++++++++++++++++++++++++++++---
 hw/block/trace-events |   2 +
 3 files changed, 127 insertions(+), 7 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9f8eb3988c0e..b23f3ae2279f 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1062,6 +1062,14 @@ enum NvmeIdCtrlOcfs {
     NVME_OCFS_COPY_FORMAT_0 = 1 << 0,
 };
 
+enum NvmeIdctrlVwc {
+    NVME_VWC_PRESENT                    = 1 << 0,
+    NVME_VWC_NSID_BROADCAST_NO_SUPPORT  = 0 << 1,
+    NVME_VWC_NSID_BROADCAST_RESERVED    = 1 << 1,
+    NVME_VWC_NSID_BROADCAST_CTRL_SPEC   = 2 << 1,
+    NVME_VWC_NSID_BROADCAST_SUPPORT     = 3 << 1,
+};
+
 enum NvmeIdCtrlFrmw {
     NVME_FRMW_SLOT1_RO = 1 << 0,
 };
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 68d80a0b4c37..1cd82fa3c9fe 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1457,6 +1457,41 @@ static void nvme_rw_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_aio_flush_ctx {
+    NvmeRequest     *req;
+    NvmeNamespace   *ns;
+    BlockAcctCookie acct;
+};
+
+static void nvme_aio_flush_cb(void *opaque, int ret)
+{
+    struct nvme_aio_flush_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
+
+    BlockBackend *blk = ctx->ns->blkconf.blk;
+    BlockAcctCookie *acct = &ctx->acct;
+    BlockAcctStats *stats = blk_get_stats(blk);
+
+    trace_pci_nvme_aio_flush_cb(nvme_cid(req), blk_name(blk));
+
+    if (!ret) {
+        block_acct_done(stats, acct);
+    } else {
+        block_acct_failed(stats, acct);
+        nvme_aio_err(req, ret);
+    }
+
+    (*num_flushes)--;
+    g_free(ctx);
+
+    if (*num_flushes) {
+        return;
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
 static void nvme_aio_discard_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -1940,10 +1975,56 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
-    block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
-                     BLOCK_ACCT_FLUSH);
-    req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb, req);
-    return NVME_NO_COMPLETE;
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
+    uint16_t status;
+    struct nvme_aio_flush_ctx *ctx;
+    NvmeNamespace *ns;
+
+    trace_pci_nvme_flush(nvme_cid(req), nsid);
+
+    if (nsid != NVME_NSID_BROADCAST) {
+        req->ns = nvme_ns(n, nsid);
+        if (unlikely(!req->ns)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
+                         BLOCK_ACCT_FLUSH);
+        req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb, req);
+        return NVME_NO_COMPLETE;
+    }
+
+    /* 1-initialize; see comment in nvme_dsm */
+    *num_flushes = 1;
+
+    for (int i = 1; i <= n->num_namespaces; i++) {
+        ns = nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
+
+        ctx = g_new(struct nvme_aio_flush_ctx, 1);
+        ctx->req = req;
+        ctx->ns = ns;
+
+        (*num_flushes)++;
+
+        block_acct_start(blk_get_stats(ns->blkconf.blk), &ctx->acct, 0,
+                         BLOCK_ACCT_FLUSH);
+        blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_cb, ctx);
+    }
+
+    /* account for the 1-initialization */
+    (*num_flushes)--;
+
+    if (*num_flushes) {
+        status = NVME_NO_COMPLETE;
+    } else {
+        status = req->status;
+    }
+
+    return status;
 }
 
 static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
@@ -2599,6 +2680,29 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
+    /*
+     * In the base NVM command set, Flush may apply to all namespaces
+     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature is used
+     * along with TP 4056 (Namespace Types), it may be pretty screwed up.
+     *
+     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate the
+     * opcode with a specific command since we cannot determine a unique I/O
+     * command set. Opcode 0x0 could have any other meaning than something
+     * equivalent to flushing and say it DOES have completely different
+     * semantics in some other command set - does an NSID of 0xFFFFFFFF then
+     * mean "for all namespaces, apply whatever command set specific command
+     * that uses the 0x0 opcode?" Or does it mean "for all namespaces, apply
+     * whatever command that uses the 0x0 opcode if, and only if, it allows
+     * NSID to be 0xFFFFFFFF"?
+     *
+     * Anyway (and luckily), for now, we do not care about this since the
+     * device only supports namespace types that includes the NVM Flush command
+     * (NVM and Zoned), so always do an NVM Flush.
+     */
+    if (req->cmd.opcode == NVME_CMD_FLUSH) {
+        return nvme_flush(n, req);
+    }
+
     req->ns = nvme_ns(n, nsid);
     if (unlikely(!req->ns)) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -2610,8 +2714,6 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     }
 
     switch (req->cmd.opcode) {
-    case NVME_CMD_FLUSH:
-        return nvme_flush(n, req);
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
     case NVME_CMD_ZONE_APPEND:
@@ -4741,7 +4843,15 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE | NVME_ONCS_COPY);
 
-    id->vwc = (0x2 << 1) | 0x1;
+    /*
+     * NOTE: If this device ever supports a command set that does NOT use 0x0
+     * as a Flush-equivalent operation, support for the broadcast NSID in Flush
+     * should probably be removed.
+     *
+     * See comment in nvme_io_cmd.
+     */
+    id->vwc = NVME_VWC_NSID_BROADCAST_SUPPORT | NVME_VWC_PRESENT;
+
     id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0);
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 4b5ee04024f4..b04f7a3e1890 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -40,6 +40,7 @@ pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2,
 pci_nvme_map_sgl(uint16_t cid, uint8_t typ, uint64_t len) "cid %"PRIu16" type 0x%"PRIx8" len %"PRIu64""
 pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
+pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
@@ -55,6 +56,7 @@ pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
+pci_nvme_aio_flush_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
-- 
2.30.1


