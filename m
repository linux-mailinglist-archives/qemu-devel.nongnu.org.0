Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A73B786F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:14:37 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJBs-0007wp-Bm
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImb-0001SC-Mu; Tue, 29 Jun 2021 14:48:30 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:45997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImS-0005PH-JP; Tue, 29 Jun 2021 14:48:29 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 84CDB2B00AAE;
 Tue, 29 Jun 2021 14:48:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 29 Jun 2021 14:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zgmg8Utm40hoz
 6dINXrVI9YgTbV0PQqvwGlu+ed5QCQ=; b=h5AR7ZkY0y09diJ7lqbUH4/1EL/YO
 lqXecOlS/67nVz8eW2CMhYIsl4fILlTKnmOZHkXFVF2r46zGZeeeZIEWMC++aNro
 KqYBsxactAW4vZywD3Wu66Q/1m0g4BvchKcvNYwugXFC14lBnK2lZRbh8+c3X0CA
 Anx3l/+UKF0P2914nImzn6hLGKj8v6yWf8nl4vuf/urEcDK+to10mBOxkGB0qgbt
 64zXCNjUCp/KP1vHgzSW2ZD2LUgoCWhdDa8oKJJfp9iTG2iMtjorkoV2tuF4RRh0
 QJ0YR+wVhYV3T6rnDzGix892iydEWa6Fyr3GJPAfefMJTNl0kJThG++8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zgmg8Utm40hoz6dINXrVI9YgTbV0PQqvwGlu+ed5QCQ=; b=c51Ka1Dt
 IwS+MeZwvNhAymCpU5wDjw9zzXLELq/xZQykN/027UiSFJ1Ul1z9cy+0oD9fo/l2
 2iylsUEquANdRG+S2rVWtwFsOj3BaPsAeG4/pkmkxxUQrDRie2E07mvrx7TaOrIX
 zbGhFAmxd0jLzar00xWo6Jtg/HkCj+twIrUL3qfYAXXfCnm0x5R/eVyolDOfgSR2
 1DpAayXcPs+xyf/03+aBsKvGK4XYNvw6n5OrmuiLiZMM5bqpdHEl3nJCvqjD2I5a
 PkRDbc+E2Eq0vGL8tBG4VyVt9c4LqI150l3DvwVyFVOS52JXsE4a1SoJjLUdnfFE
 YjbQYzQ5eaKjZw==
X-ME-Sender: <xms:8WrbYAtqeLjqKizYnAhP7M8jClCGP3FeINjqVsG4SMD9CjEHNCpujg>
 <xme:8WrbYNckpU4qLC6uiXS6JekxeeWEM_cMu-9KPGlw-nQ7rVi1yFbjEw6PwWpCghAE7
 UEqJVhwZATSmFw8k2U>
X-ME-Received: <xmr:8WrbYLwx_jp_e7KKAhH5LFmkcp_k-NkpgP8W8cVO8cnZaj1dCAhsfvxPgeOyBBqhW9JsuUEwWYCNhxlKz-lUwiwAGwGaA_wrJqCbbNj4eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:8WrbYDOBHaV2sdaHxbWkBDDl8JANKB1Rvy3ssbywF-0TMGH80cBP-A>
 <xmx:8WrbYA-Z62DTlc6fxCvZRoAouKAlhYZUwPwy-O8YtfuvG64yuQyOiQ>
 <xmx:8WrbYLVBjoz2jO1ASBv_CUZClVer-F5SnNBuWN6pWSC5UYgu5kX-Iw>
 <xmx:8WrbYB2NNv4f15wUDbHxIGR66cPcVFew0EsNnFEtTNHtT5UrA3OxvAFFnW4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:15 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/23] hw/nvme: reimplement flush to allow cancellation
Date: Tue, 29 Jun 2021 20:47:28 +0200
Message-Id: <20210629184743.230173-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prior to this patch, a broadcast flush would result in submitting
multiple "fire and forget" aios (no reference saved to the aiocbs
returned from the blk_aio_flush calls).

Fix this by issuing the flushes one after another.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/nvme.h       |   2 +
 hw/nvme/ctrl.c       | 206 ++++++++++++++++++++++++++-----------------
 hw/nvme/trace-events |   6 +-
 3 files changed, 130 insertions(+), 84 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 371ac9bfd8fc..7f3d0a181d1d 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -28,6 +28,8 @@
 #define NVME_MAX_NAMESPACES  256
 #define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
 
+QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
+
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 762bb82e3cac..26c65a12e80c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1788,22 +1788,19 @@ static inline bool nvme_is_write(NvmeRequest *req)
            rw->opcode == NVME_CMD_WRITE_ZEROES;
 }
 
+static AioContext *nvme_get_aio_context(BlockAIOCB *acb)
+{
+    return qemu_get_aio_context();
+}
+
 static void nvme_misc_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
-    NvmeNamespace *ns = req->ns;
 
-    BlockBackend *blk = ns->blkconf.blk;
-    BlockAcctCookie *acct = &req->acct;
-    BlockAcctStats *stats = blk_get_stats(blk);
-
-    trace_pci_nvme_misc_cb(nvme_cid(req), blk_name(blk));
+    trace_pci_nvme_misc_cb(nvme_cid(req));
 
     if (ret) {
-        block_acct_failed(stats, acct);
         nvme_aio_err(req, ret);
-    } else {
-        block_acct_done(stats, acct);
     }
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
@@ -1919,41 +1916,6 @@ static void nvme_aio_format_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
-struct nvme_aio_flush_ctx {
-    NvmeRequest     *req;
-    NvmeNamespace   *ns;
-    BlockAcctCookie acct;
-};
-
-static void nvme_aio_flush_cb(void *opaque, int ret)
-{
-    struct nvme_aio_flush_ctx *ctx = opaque;
-    NvmeRequest *req = ctx->req;
-    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
-
-    BlockBackend *blk = ctx->ns->blkconf.blk;
-    BlockAcctCookie *acct = &ctx->acct;
-    BlockAcctStats *stats = blk_get_stats(blk);
-
-    trace_pci_nvme_aio_flush_cb(nvme_cid(req), blk_name(blk));
-
-    if (!ret) {
-        block_acct_done(stats, acct);
-    } else {
-        block_acct_failed(stats, acct);
-        nvme_aio_err(req, ret);
-    }
-
-    (*num_flushes)--;
-    g_free(ctx);
-
-    if (*num_flushes) {
-        return;
-    }
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
 static void nvme_verify_cb(void *opaque, int ret)
 {
     NvmeBounceContext *ctx = opaque;
@@ -2868,56 +2830,138 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+typedef struct NvmeFlushAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    NvmeNamespace *ns;
+    uint32_t nsid;
+    bool broadcast;
+} NvmeFlushAIOCB;
+
+static void nvme_flush_cancel(BlockAIOCB *acb)
+{
+    NvmeFlushAIOCB *iocb = container_of(acb, NvmeFlushAIOCB, common);
+
+    iocb->ret = -ECANCELED;
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+    }
+}
+
+static const AIOCBInfo nvme_flush_aiocb_info = {
+    .aiocb_size = sizeof(NvmeFlushAIOCB),
+    .cancel_async = nvme_flush_cancel,
+    .get_aio_context = nvme_get_aio_context,
+};
+
+static void nvme_flush_ns_cb(void *opaque, int ret)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+    NvmeNamespace *ns = iocb->ns;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto out;
+    } else if (iocb->ret < 0) {
+        goto out;
+    }
+
+    if (ns) {
+        trace_pci_nvme_flush_ns(iocb->nsid);
+
+        iocb->ns = NULL;
+        iocb->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, iocb);
+        return;
+    }
+
+out:
+    iocb->aiocb = NULL;
+    qemu_bh_schedule(iocb->bh);
+}
+
+static void nvme_flush_bh(void *opaque)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeCtrl *n = nvme_ctrl(req);
+    int i;
+
+    if (iocb->ret < 0) {
+        goto done;
+    }
+
+    if (iocb->broadcast) {
+        for (i = iocb->nsid + 1; i <= NVME_MAX_NAMESPACES; i++) {
+            iocb->ns = nvme_ns(n, i);
+            if (iocb->ns) {
+                iocb->nsid = i;
+                break;
+            }
+        }
+    }
+
+    if (!iocb->ns) {
+        goto done;
+    }
+
+    nvme_flush_ns_cb(iocb, 0);
+    return;
+
+done:
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_aio_unref(iocb);
+
+    return;
+}
+
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeFlushAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
-    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
     uint16_t status;
-    struct nvme_aio_flush_ctx *ctx;
-    NvmeNamespace *ns;
 
-    trace_pci_nvme_flush(nvme_cid(req), nsid);
+    iocb = qemu_aio_get(&nvme_flush_aiocb_info, NULL, nvme_misc_cb, req);
 
-    if (nsid != NVME_NSID_BROADCAST) {
-        req->ns = nvme_ns(n, nsid);
-        if (unlikely(!req->ns)) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+    iocb->req = req;
+    iocb->bh = qemu_bh_new(nvme_flush_bh, iocb);
+    iocb->ret = 0;
+    iocb->ns = NULL;
+    iocb->nsid = 0;
+    iocb->broadcast = (nsid == NVME_NSID_BROADCAST);
+
+    if (!iocb->broadcast) {
+        if (!nvme_nsid_valid(n, nsid)) {
+            status = NVME_INVALID_NSID | NVME_DNR;
+            goto out;
         }
 
-        block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
-                         BLOCK_ACCT_FLUSH);
-        req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_misc_cb, req);
-        return NVME_NO_COMPLETE;
-    }
-
-    /* 1-initialize; see comment in nvme_dsm */
-    *num_flushes = 1;
-
-    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
-        ns = nvme_ns(n, i);
-        if (!ns) {
-            continue;
+        iocb->ns = nvme_ns(n, nsid);
+        if (!iocb->ns) {
+            status = NVME_INVALID_FIELD | NVME_DNR;
+            goto out;
         }
 
-        ctx = g_new(struct nvme_aio_flush_ctx, 1);
-        ctx->req = req;
-        ctx->ns = ns;
-
-        (*num_flushes)++;
-
-        block_acct_start(blk_get_stats(ns->blkconf.blk), &ctx->acct, 0,
-                         BLOCK_ACCT_FLUSH);
-        blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_cb, ctx);
+        iocb->nsid = nsid;
     }
 
-    /* account for the 1-initialization */
-    (*num_flushes)--;
+    req->aiocb = &iocb->common;
+    qemu_bh_schedule(iocb->bh);
 
-    if (*num_flushes) {
-        status = NVME_NO_COMPLETE;
-    } else {
-        status = req->status;
-    }
+    return NVME_NO_COMPLETE;
+
+out:
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
 
     return status;
 }
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ea33d0ccc383..ce6b6ffe9604 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -7,16 +7,16 @@ pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
 pci_nvme_map_sgl(uint8_t typ, uint64_t len) "type 0x%"PRIx8" len %"PRIu64""
-pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
+pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid 0x%"PRIx32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
-pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
+pci_nvme_flush_ns(uint32_t nsid) "nsid 0x%"PRIx32""
 pci_nvme_format(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
 pci_nvme_format_ns(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
 pci_nvme_format_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-pci_nvme_misc_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_misc_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_dif_rw(uint8_t pract, uint8_t prinfo) "pract 0x%"PRIx8" prinfo 0x%"PRIx8""
 pci_nvme_dif_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-- 
2.32.0


