Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447CB329BAC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:16:52 +0100 (CET)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH31H-0001Kx-4i
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vS-0006aY-WD; Tue, 02 Mar 2021 06:10:51 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vR-0007Ib-67; Tue, 02 Mar 2021 06:10:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 672C55C015B;
 Tue,  2 Mar 2021 06:10:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 06:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=PNZmbtZdEl/mF
 rCUEeQ2F7hb4v6l/Eu6Q3cp/qGLdZ0=; b=rcjP5MCz/2oq/1K4CT8sBzhAs5f4r
 FseT+AzKiZ5CLcWAIrSSn5uflSx07UeS3G4j4uME0v+EbfG3MflNlY0m8GVMYvq6
 VK7x2NrvLfiZMWuQkOv7D7Q+tpe5KOrckdk+LO+jS2tX60caKpUW9mv7IakfIse8
 bW8GUhHpEYywrqxzOIpm7d/HiQ2mTUMBFXP/8/G/EwgnfmfJQ2pBzYZE8en/rBC9
 BMFMRn1S8aYd+V9gj628NWGYT0mYiMVYtHWqxlNmKUsN8APgkbqt5E3l/PannceE
 gu61rw9l8C3FaZTTkceIajCzcCRuqeK0vCAf8hJ/St3A0yu4UM3SjCQZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=PNZmbtZdEl/mFrCUEeQ2F7hb4v6l/Eu6Q3cp/qGLdZ0=; b=LOtzC93H
 sMzI5ZilyWEqtFmqOivEH+XCfhSRb1bdjR07oyrL1N2xBWT5Wrxykw5pYfn6SBqe
 es6SD6FTMLl/uWc5Upao7vJhSXtemluCjV6/EjRRXHD9FvXm8FK9wryK+0uxlfda
 2I5BLJ0k64C+K83/TjMOb3aHMVRJ1O8fNl2GflJl/6vhGGACGFSF/2l/oJNSRUgE
 UYJRntlQc7vv4SqbSmCBTXdf16/UXZUVQrNpL06tzYw9cXW1jf38y4BQyeyI1Lpc
 VszM4uD5qVBHAKcnB/STc6MJE5Uv8HzUqP+dmaAqCEGcnbYZLUQtALxtdH8h+MMj
 cJXx6SVnvmPfXg==
X-ME-Sender: <xms:OB0-YPMh8_q8musXRwPKSuveJRKljRg7PVdEs8HccMQ0EDRn1zoUXQ>
 <xme:OB0-YJ_i_5e9Ql0OgFEH4qKGf0QYsoQfWqFlaP9au_oqPRDgNMoMv_MrWD6bqzFj0
 l5QiowCQAyRDUz7TjM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OB0-YOSvgmHJ_XWK_mzksR2XyyNnRvjr1WqghFvsh8XnhXKr2Tg-kA>
 <xmx:OB0-YDsovxEkleeXwSy1I7gqU5xUg3dTEbS7TtXQDQga-PpV1FSrZg>
 <xmx:OB0-YHfnMMmkjy0AD9J6vd4NKyDkAUnz4n9EgUXQ07sQi1lUkQsRUg>
 <xmx:OB0-YIEUxmROxjPAXOYcxOloCzbOc-oeyU533PYuXBc8eIt1BgvwdQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A37F1080054;
 Tue,  2 Mar 2021 06:10:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 3/4] hw/block/nvme: convert flush to aiocb
Date: Tue,  2 Mar 2021 12:10:39 +0100
Message-Id: <20210302111040.289244-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302111040.289244-1-its@irrelevant.dk>
References: <20210302111040.289244-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Convert flush from ad-hoc multi aio tracking to use standard QEMU AIOCB
processing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 143 +++++++++++++++++++++++++-----------------------
 1 file changed, 74 insertions(+), 69 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 48a1abe52787..773b41527c79 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1459,41 +1459,6 @@ static void nvme_rw_cb(void *opaque, int ret)
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
 static void nvme_misc_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -2055,13 +2020,74 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+typedef struct NvmeFlushAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    int nsid;
+} NvmeFlushAIOCB;
+
+static void nvme_flush_cancel(BlockAIOCB *acb)
+{
+    NvmeFlushAIOCB *iocb = container_of(acb, NvmeFlushAIOCB, common);
+    NvmeCtrl *n = nvme_ctrl(iocb->req);
+
+    iocb->nsid = n->num_namespaces + 1;
+    iocb->ret = -ECANCELED;
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
+    }
+}
+
+static const AIOCBInfo nvme_flush_aiocb_info = {
+    .aiocb_size = sizeof(NvmeFlushAIOCB),
+    .cancel_async = nvme_flush_cancel,
+};
+
+static void nvme_flush_bh(void *opaque)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
+}
+
+static void nvme_flush_aio_cb(void *opaque, int ret)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeCtrl *n = nvme_ctrl(req);
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    while (iocb->nsid <= n->num_namespaces) {
+        NvmeNamespace *ns = nvme_ns(n, iocb->nsid++);
+        if (ns) {
+            iocb->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_flush_aio_cb,
+                                        iocb);
+            return;
+        }
+    }
+
+done:
+    iocb->aiocb = NULL;
+    qemu_bh_schedule(iocb->bh);
+}
+
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeFlushAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
-    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
-    uint16_t status;
-    struct nvme_aio_flush_ctx *ctx;
-    NvmeNamespace *ns;
 
     trace_pci_nvme_flush(nvme_cid(req), nsid);
 
@@ -2071,42 +2097,21 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
-                         BLOCK_ACCT_FLUSH);
-        req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_rw_cb, req);
+        req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_misc_cb, req);
         return NVME_NO_COMPLETE;
     }
 
-    /* 1-initialize; see comment in nvme_dsm */
-    *num_flushes = 1;
+    iocb = qemu_aio_get(&nvme_flush_aiocb_info, NULL, nvme_misc_cb, req);
 
-    for (int i = 1; i <= n->num_namespaces; i++) {
-        ns = nvme_ns(n, i);
-        if (!ns) {
-            continue;
-        }
+    iocb->req = req;
+    iocb->bh = qemu_bh_new(nvme_flush_bh, iocb);
+    iocb->ret = 0;
+    iocb->nsid = 1;
 
-        ctx = g_new(struct nvme_aio_flush_ctx, 1);
-        ctx->req = req;
-        ctx->ns = ns;
+    nvme_flush_aio_cb(iocb, 0);
+    req->aiocb = &iocb->common;
 
-        (*num_flushes)++;
-
-        block_acct_start(blk_get_stats(ns->blkconf.blk), &ctx->acct, 0,
-                         BLOCK_ACCT_FLUSH);
-        blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_cb, ctx);
-    }
-
-    /* account for the 1-initialization */
-    (*num_flushes)--;
-
-    if (*num_flushes) {
-        status = NVME_NO_COMPLETE;
-    } else {
-        status = req->status;
-    }
-
-    return status;
+    return NVME_NO_COMPLETE;
 }
 
 static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
-- 
2.30.1


