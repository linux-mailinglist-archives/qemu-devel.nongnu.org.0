Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3583302CE5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 21:48:48 +0100 (CET)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l48n1-0008Nu-3Q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 15:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l48h6-0006iU-Tp; Mon, 25 Jan 2021 15:42:40 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l48h4-0004Ge-8N; Mon, 25 Jan 2021 15:42:40 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 6C33EF1C;
 Mon, 25 Jan 2021 15:42:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 25 Jan 2021 15:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=i/7sY3CnVYT2oLCHSGmblGatLF
 dSVJ+rhcsq+7yxsU4=; b=kt87o2hrRkupcFftN6mYULNj6I22De4EJeTDfrGigY
 yaTq2jsHWos6ZWMQuM0SCsIFhIblCnk23P8QFkahLO3nC6ATLOfyCcjZBgrLnpJt
 TS10KzplQHTDDn30uTF5/p2764PCO9Hnz36sYVay3fch793ock8TL22V3KpCHmr7
 CO2yee79BVGd+/CtiW3441m0jIM+e4Xh8lCEgqRbMhpvbcoJNPygMQ1q+8dt4ACH
 OK8YW5iJn7ZEYpINlAetNyXePsGAJ8QznmsxIDwwhBMgR0y7Go3eN4ZPBHVxDzaA
 kWb4mtq+sKHAcfAZ3K1e/3UNi18NuVFozBTaNQpLmpog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i/7sY3CnVYT2oLCHS
 GmblGatLFdSVJ+rhcsq+7yxsU4=; b=XsLhH5lO8IdhhIwo8th+HPl4fgLMuBtZd
 0K/Y4BkYcu+eksl1ueplxnVWrV856yZhDmYTSZJorvB1bwnP+Z3+ar5XVfktPZU9
 bcjByw/gFQ6GkxX3tjeSyX7m+Z0HJXA382JC+8JpjwkqcQ2mDKoYjPNCfhcLS4pw
 YbK25eadViT37F+mv6U5xj+fsqJ17WR0pJOl3vGXVgYfnxHrLcPMrDxVz4ouYS0Q
 GNIveI3xSpP4wv7PnxjXw0yqFo2TM2ASAnvnCFiEd6LLqZ1UWg82TYbD780rVFsr
 WyQO9YeUOANigfP1XMPS7RY2tSXLAfHIpKSoYs+hVx/KhJKb3lyTg==
X-ME-Sender: <xms:OS0PYApoKaisQGF-wy5cSRTy_d6RtWCTXRzUy1WLLgr4mIvD9Qa8Og>
 <xme:OS0PYL5RUXExTDQOlP1axjk8PltChKCeKrG31Sn8xqTikefvUR-St2x_OV83EKwKv
 -jDIVj_3G7ED9H4J6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OS0PYG4hzEbLazH5Rh_milPBT7estXgONYTEVa_TdEgxbbtlQT9HDQ>
 <xmx:OS0PYAEGpPRSH6mjkBD_iWOec-uB2c6qskcjU_T9Nmhn3O2wrOLaIQ>
 <xmx:OS0PYHS9ARaxa01933F2_axM39kfKqRqGFvsuUeL4D1UXASJ1ePVhw>
 <xmx:Oy0PYICp9vCsdpCw4ewLeNq-BpTMpb5ElcK7xlarh3bgUGzYO61njw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21FFC1080063;
 Mon, 25 Jan 2021 15:42:32 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Date: Mon, 25 Jan 2021 21:42:31 +0100
Message-Id: <20210125204231.254925-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
---
 include/block/nvme.h  |   8 +++
 hw/block/nvme.c       | 123 +++++++++++++++++++++++++++++++++++++++---
 hw/block/trace-events |   2 +
 3 files changed, 126 insertions(+), 7 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e4b918064df9..0e2e94c7ebbb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1024,6 +1024,14 @@ enum NvmeIdCtrlOncs {
     NVME_ONCS_TIMESTAMP     = 1 << 6,
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
index 98d84fe26644..b5ce8ed7c785 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1406,6 +1406,41 @@ static void nvme_rw_cb(void *opaque, int ret)
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
@@ -1644,10 +1679,56 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
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
+        req->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_cb, ctx);
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
@@ -2344,6 +2425,29 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -2355,8 +2459,6 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     }
 
     switch (req->cmd.opcode) {
-    case NVME_CMD_FLUSH:
-        return nvme_flush(n, req);
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
     case NVME_CMD_ZONE_APPEND:
@@ -4450,7 +4552,14 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE);
 
-    id->vwc = (0x2 << 1) | 0x1;
+    /*
+     * NOTE: If this device ever supports a command set that does NOT use 0x0
+     * as a Flush-equivalent operation, support for the broadcast NSID in Flush
+     * should probably be removed.
+     *
+     * See comment in nvme_io_cmd.
+     */
+    id->vwc = NVME_VWC_NSID_BROADCAST_SUPPORT | NVME_VWC_PRESENT;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 8e249ea910aa..ce2a35c34ea6 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -43,6 +43,8 @@ pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opna
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
+pci_nvme_aio_flush_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
-- 
2.30.0


