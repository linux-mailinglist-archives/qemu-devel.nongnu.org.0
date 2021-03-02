Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF3329BEC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:19:23 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH33i-0002Tq-Do
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vS-0006a5-Ol; Tue, 02 Mar 2021 06:10:50 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vQ-0007IE-03; Tue, 02 Mar 2021 06:10:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DDDC5C018B;
 Tue,  2 Mar 2021 06:10:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 06:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SOEL7gSsOCXoh
 Vk5SSqfd5NkSNYvgtjmltmkeqWrdew=; b=U/VtL3ZGuJNcLA/1ekbSBpgwaziEe
 4CIuiB11MP4+xPN/BoHOrQwsLVuZjdsJ+A87TxDg3uF1hWarz45T9trZ+rD8xBjL
 tufHHeqG2V8a1wSGJ2tw7pxeX9xXKrlg5+07dfHGSaRH1nogej6fAyjuVjBOh48J
 9dQ+QNSWH2S849HfymgWAff3LpCX31ZN48RXezMZzTwRhIEpO3SdxTODDnTB2v9r
 nfrxXNzbBkNR5z/rYI6++02XJC5CRXbEftJbt0b5SXCCzRNWtnGxztg7pxVzBDNW
 pzsvDAcW7SXJb7hBANRzbLvNJm3A3BhURoLmTCjNwQ3SJ1lY8E2hWrY7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SOEL7gSsOCXohVk5SSqfd5NkSNYvgtjmltmkeqWrdew=; b=hkqJV9wk
 Kewt3dcYzzL8+TaK6lsQbOwW/zRu+Vo/5d4W98pCxqtBNL2A2z9yKeH8BIeFtHSx
 wQTgY77jcoKzeD0sR84WDhITv7eAdbbwT0/ijKNKJhqLiTSEJ57FJGjiSrFz74pt
 RM3DuAeTrZNUj0xDowBSvkBw2NHEhsw9vSZpeG1DjhblEJVRtEcKeksA7LZbKt2q
 5+SOQG7YzIEiInpyn0HI/Pc+zArAw5fKiSeRUP+jBm/HmF+gUAg4HbcXhRE8Idsf
 /QddMXZcAJVSXJEyQb6i0ZP7lQMymQm0yJ2qoVGSiGwiK20VlFBg/ZmPXoUfdG2X
 TGsAqQLAs1u0pg==
X-ME-Sender: <xms:Nx0-YMRbouIxs-P0fBcC1qVx6ZMRRAKIVJqu1ipT7pUWf8_Fq5BFCQ>
 <xme:Nx0-YJxGOTZ0KT1AWD5_v1sHLa1kwV2d53jjGvS-zBpPGOLuCP9g36BJzz_rcYNHo
 KPdF8HDVQsvfKLatsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Nx0-YJ2QA-PE6z-0_eu7C4Fn7QZBQhmWSEYKDzyEnRVtD0C2-v5dIA>
 <xmx:Nx0-YAANEZhD2_gdIJPcbf2w6A7MQbcJx4nJV_0NxMpNIJGqnBTR6w>
 <xmx:Nx0-YFhNNElB-cC-BI5VdLgd-OnpKHsdh4unF6bsZNcwo4cPGFK27A>
 <xmx:Nx0-YDbuasdneIplDXNk_PDGEa1aJUAxRKy-GkqFuwYK8DMPFVTvcw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1EB01080054;
 Tue,  2 Mar 2021 06:10:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 2/4] hw/block/nvme: convert copy to aiocb
Date: Tue,  2 Mar 2021 12:10:38 +0100
Message-Id: <20210302111040.289244-3-its@irrelevant.dk>
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

Convert copy from ad-hoc multi aio tracking to use standard QEMU AIOCB
processing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 382 +++++++++++++++++++++++++-----------------------
 1 file changed, 199 insertions(+), 183 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8830d72b959f..48a1abe52787 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1554,136 +1554,6 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
-struct nvme_copy_ctx {
-    int copies;
-    uint8_t *bounce;
-    uint32_t nlb;
-};
-
-struct nvme_copy_in_ctx {
-    NvmeRequest *req;
-    QEMUIOVector iov;
-};
-
-static void nvme_copy_cb(void *opaque, int ret)
-{
-    NvmeRequest *req = opaque;
-    NvmeNamespace *ns = req->ns;
-    struct nvme_copy_ctx *ctx = req->opaque;
-
-    trace_pci_nvme_copy_cb(nvme_cid(req));
-
-    if (ns->params.zoned) {
-        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-        uint64_t sdlba = le64_to_cpu(copy->sdlba);
-        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
-
-        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
-    }
-
-    if (!ret) {
-        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
-    } else {
-        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-        nvme_aio_err(req, ret);
-    }
-
-    g_free(ctx->bounce);
-    g_free(ctx);
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
-static void nvme_copy_in_complete(NvmeRequest *req)
-{
-    NvmeNamespace *ns = req->ns;
-    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-    struct nvme_copy_ctx *ctx = req->opaque;
-    uint64_t sdlba = le64_to_cpu(copy->sdlba);
-    uint16_t status;
-
-    trace_pci_nvme_copy_in_complete(nvme_cid(req));
-
-    block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
-
-    status = nvme_check_bounds(ns, sdlba, ctx->nlb);
-    if (status) {
-        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
-        goto invalid;
-    }
-
-    if (ns->params.zoned) {
-        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
-
-        status = nvme_check_zone_write(ns, zone, sdlba, ctx->nlb);
-        if (status) {
-            goto invalid;
-        }
-
-        status = nvme_zrm_auto(ns, zone);
-        if (status) {
-            goto invalid;
-        }
-
-        zone->w_ptr += ctx->nlb;
-    }
-
-    qemu_iovec_init(&req->iov, 1);
-    qemu_iovec_add(&req->iov, ctx->bounce, nvme_l2b(ns, ctx->nlb));
-
-    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
-                     BLOCK_ACCT_WRITE);
-
-    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
-                                 &req->iov, 0, nvme_copy_cb, req);
-
-    return;
-
-invalid:
-    req->status = status;
-
-    g_free(ctx->bounce);
-    g_free(ctx);
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
-static void nvme_aio_copy_in_cb(void *opaque, int ret)
-{
-    struct nvme_copy_in_ctx *in_ctx = opaque;
-    NvmeRequest *req = in_ctx->req;
-    NvmeNamespace *ns = req->ns;
-    struct nvme_copy_ctx *ctx = req->opaque;
-
-    qemu_iovec_destroy(&in_ctx->iov);
-    g_free(in_ctx);
-
-    trace_pci_nvme_aio_copy_in_cb(nvme_cid(req));
-
-    if (ret) {
-        nvme_aio_err(req, ret);
-    }
-
-    ctx->copies--;
-
-    if (ctx->copies) {
-        return;
-    }
-
-    if (req->status) {
-        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-
-        g_free(ctx->bounce);
-        g_free(ctx);
-
-        nvme_enqueue_req_completion(nvme_cq(req), req);
-
-        return;
-    }
-
-    nvme_copy_in_complete(req);
-}
-
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
@@ -1874,18 +1744,184 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+typedef struct NvmeCopyAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    NvmeCopySourceRange *range;
+    int nr;
+    uint32_t nlb;
+    uint8_t *bounce;
+    bool done;
+    struct {
+        int idx;
+        uint8_t *p;
+    } copy_in;
+} NvmeCopyAIOCB;
+
+static void nvme_copy_cancel(BlockAIOCB *aiocb)
+{
+    NvmeCopyAIOCB *iocb = container_of(aiocb, NvmeCopyAIOCB, common);
+
+    iocb->ret = -ECANCELED;
+    iocb->copy_in.idx = iocb->nr;
+    iocb->done = true;
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
+    }
+}
+
+static const AIOCBInfo nvme_copy_aiocb_info = {
+    .aiocb_size   = sizeof(NvmeCopyAIOCB),
+    .cancel_async = nvme_copy_cancel,
+};
+
+static void nvme_copy_bh(void *opaque)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+
+    if (ns->params.zoned) {
+        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+        uint64_t sdlba = le64_to_cpu(copy->sdlba);
+        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
+
+        __nvme_advance_zone_wp(ns, zone, iocb->nlb);
+    }
+
+    if (iocb->ret < 0) {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+    } else {
+        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+    }
+
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+
+    g_free(iocb->bounce);
+
+    qemu_aio_unref(iocb);
+}
+
+static void nvme_copy_aio_cb(void *opaque, int ret);
+
+static uint16_t nvme_copy_in_complete(NvmeCopyAIOCB *iocb)
+{
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    uint64_t sdlba = le64_to_cpu(copy->sdlba);
+    uint16_t status;
+
+    block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+    status = nvme_check_bounds(ns, sdlba, iocb->nlb);
+    if (status) {
+        trace_pci_nvme_err_invalid_lba_range(sdlba, iocb->nlb, ns->id_ns.nsze);
+        return status;
+    }
+
+    if (ns->params.zoned) {
+        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
+
+        status = nvme_check_zone_write(ns, zone, sdlba, iocb->nlb);
+        if (status) {
+            return status;
+        }
+
+        status = nvme_zrm_auto(ns, zone);
+        if (status) {
+            return status;
+        }
+
+        zone->w_ptr += iocb->nlb;
+    }
+
+    iocb->done = true;
+
+    qemu_iovec_reset(&req->iov);
+    qemu_iovec_add(&req->iov, iocb->bounce, nvme_l2b(ns, iocb->nlb));
+
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
+                     BLOCK_ACCT_WRITE);
+
+    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
+                                  &req->iov, 0, nvme_copy_aio_cb, iocb);
+
+    return NVME_SUCCESS;
+}
+
+static void nvme_copy_aio_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopySourceRange *range;
+    uint64_t slba;
+    uint32_t nlb;
+    size_t bytes;
+    uint16_t status;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    if (iocb->copy_in.idx == iocb->nr) {
+        if (iocb->done) {
+            goto done;
+        }
+
+        status = nvme_copy_in_complete(iocb);
+        if (status) {
+            req->status = status;
+            goto done;
+        }
+
+        return;
+    }
+
+    range = &iocb->range[iocb->copy_in.idx++];
+    slba = le64_to_cpu(range->slba);
+    nlb = le32_to_cpu(range->nlb);
+    bytes = nvme_l2b(ns, nlb);
+
+    trace_pci_nvme_copy_source_range(slba, nlb);
+
+    qemu_iovec_reset(&req->iov);
+    qemu_iovec_add(&req->iov, iocb->copy_in.p, bytes);
+    iocb->copy_in.p += bytes;
+
+    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(ns, slba),
+                                 &req->iov, 0, nvme_copy_aio_cb, iocb);
+    return;
+
+done:
+    iocb->aiocb = NULL;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
+}
+
+
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-    g_autofree NvmeCopySourceRange *range = NULL;
-
+    NvmeCopyAIOCB *iocb = blk_aio_get(&nvme_copy_aiocb_info, ns->blkconf.blk,
+                                      nvme_misc_cb, req);
     uint16_t nr = copy->nr + 1;
     uint8_t format = copy->control[0] & 0xf;
     uint32_t nlb = 0;
-
-    uint8_t *bounce = NULL, *bouncep = NULL;
-    struct nvme_copy_ctx *ctx;
     uint16_t status;
     int i;
 
@@ -1900,39 +1936,46 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         return NVME_CMD_SIZE_LIMIT | NVME_DNR;
     }
 
-    range = g_new(NvmeCopySourceRange, nr);
+    iocb->req = req;
+    iocb->bh = qemu_bh_new(nvme_copy_bh, iocb);
+    iocb->ret = 0;
+    iocb->done = false;
+    iocb->range = g_new(NvmeCopySourceRange, nr);
+    iocb->nr = nr;
+    iocb->copy_in.idx = 0;
 
-    status = nvme_dma(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
+    status = nvme_dma(n, (uint8_t *)iocb->range,
+                      sizeof(NvmeCopySourceRange) * nr,
                       DMA_DIRECTION_TO_DEVICE, req);
     if (status) {
-        return status;
+        goto invalid;
     }
 
     for (i = 0; i < nr; i++) {
-        uint64_t slba = le64_to_cpu(range[i].slba);
-        uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
+        uint64_t slba = le64_to_cpu(iocb->range[i].slba);
+        uint32_t _nlb = le16_to_cpu(iocb->range[i].nlb) + 1;
 
         if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
-            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+            status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
         }
 
         status = nvme_check_bounds(ns, slba, _nlb);
         if (status) {
             trace_pci_nvme_err_invalid_lba_range(slba, _nlb, ns->id_ns.nsze);
-            return status;
+            goto invalid;
         }
 
         if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
             status = nvme_check_dulbe(ns, slba, _nlb);
             if (status) {
-                return status;
+                goto invalid;
             }
         }
 
         if (ns->params.zoned) {
             status = nvme_check_zone_read(ns, slba, _nlb);
             if (status) {
-                return status;
+                goto invalid;
             }
         }
 
@@ -1940,53 +1983,26 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
-        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        goto invalid;
     }
 
-    bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
+    iocb->nlb = nlb;
+    iocb->bounce = g_malloc(nvme_l2b(ns, nlb));
+    iocb->copy_in.p = iocb->bounce;
+
+    qemu_iovec_init(&req->iov, 1);
 
     block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
                      BLOCK_ACCT_READ);
 
-    ctx = g_new(struct nvme_copy_ctx, 1);
-
-    ctx->bounce = bounce;
-    ctx->nlb = nlb;
-    ctx->copies = 1;
-
-    req->opaque = ctx;
-
-    for (i = 0; i < nr; i++) {
-        uint64_t slba = le64_to_cpu(range[i].slba);
-        uint32_t nlb = le16_to_cpu(range[i].nlb) + 1;
-
-        size_t len = nvme_l2b(ns, nlb);
-        int64_t offset = nvme_l2b(ns, slba);
-
-        trace_pci_nvme_copy_source_range(slba, nlb);
-
-        struct nvme_copy_in_ctx *in_ctx = g_new(struct nvme_copy_in_ctx, 1);
-        in_ctx->req = req;
-
-        qemu_iovec_init(&in_ctx->iov, 1);
-        qemu_iovec_add(&in_ctx->iov, bouncep, len);
-
-        ctx->copies++;
-
-        blk_aio_preadv(ns->blkconf.blk, offset, &in_ctx->iov, 0,
-                       nvme_aio_copy_in_cb, in_ctx);
-
-        bouncep += len;
-    }
-
-    /* account for the 1-initialization */
-    ctx->copies--;
-
-    if (!ctx->copies) {
-        nvme_copy_in_complete(req);
-    }
+    nvme_copy_aio_cb(iocb, 0);
+    req->aiocb = &iocb->common;
 
     return NVME_NO_COMPLETE;
+
+invalid:
+    return status;
 }
 
 static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
-- 
2.30.1


