Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7C39B3A4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:14:49 +0200 (CEST)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp42Z-0002eq-8o
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hT-0005nj-Od; Fri, 04 Jun 2021 02:52:59 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hQ-0007Qr-Sm; Fri, 04 Jun 2021 02:52:59 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AEFB5C0067;
 Fri,  4 Jun 2021 02:52:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Jun 2021 02:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DgVk06gsWbu2P
 bm1tsUU/M+KEU9VbHBChIq9TACYFIw=; b=MZ0bdDbfY0DvcUAwbeQkiHRv/nbNs
 JEJxiZxK7ZOlZMiG6PVoPNqfEWaVQ1Brq/v7+sJnuw4fgdCTEpiUa+Zs+u9AcHE8
 KVMaFgGMD3jYWCsXfc46ppNXxBEbMAAcMqF6ZIaoT38+L213qdKcvHxDDzeimPyz
 IxN6bB0wdqLHFEamDLI4jCFKh0cwfGHV63dfb4melow/pvjqjqtsklpxR7/V0McG
 X0J9kx13gXrQyfKPO6bNkd55CrqGeH4h5QNgJ7NY4O7Qy0yY/+WtN31Z+yYvriSO
 oMXZylS9fm0IWYguMu1YhjH4D51Yc5iw8IYYGR+SqCdymubF0IOq7cDDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DgVk06gsWbu2Pbm1tsUU/M+KEU9VbHBChIq9TACYFIw=; b=kMp2R01t
 qQm2ILlR4WxBVl3+gpH3E+x8Q7P+wq279t/jIgdWZdtufh112FwBieyXZTjUzUlA
 vJVUkC9x4koD3pNoHFjBYDvd/ZTaAefJ78VxKehuhNQ64QaLDzEUbbF7GzDpTuLn
 U5XfIBXwuYWHpE9vKKUITYy5r1PxykFaqIvmoTDzhguMblVrPdKJkwnL1jmEQi4v
 j9LdnqQnfpa7w+iOadfWzx/EduM5NCvlpCOYKPx9wHbshxCoNpqC5fYnOpH87WiO
 zgQwnS8fIXA+4Poc1SmGorsXiixYKTsXM8pCNmKrFS9qKDNTr+dil40sFGSoQPnO
 JXugQnDpegWuxQ==
X-ME-Sender: <xms:x825YI6n2PdmYSF0UlXxXRgxjxDof-BOC-YlYlNeNj76h0DAvN77zQ>
 <xme:x825YJ4HpxDC0mMHoM5rM_8xGz2hM5xmVS4hgOMyEOjCNTtEvtsY-ot6f_uZ4Pzj4
 9_yEqDQ4rD_QBhpb-Y>
X-ME-Received: <xmr:x825YHeK_ii40WxeAiayk3ibwpPBCBCdwlSfMqyLd4xuresfwv_JKTNiBLRhmdof8SToykbR4BDrO1Tdom7E9rlK61Gy8X1idHcjzN5p8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:x825YNJKX0G8yXRN7nvT-zCBxB-hYQpyevdb0MloDC8rqjH2vKeHKg>
 <xmx:x825YMJLp8R441Q4zh01L1FZJzin03oQtpbkQe8Bzc2hGuT-eaHFbQ>
 <xmx:x825YOwpCp1EX7uE665IBWfWydGougBY7b-UijpnLJHsUegwn64ktw>
 <xmx:yM25YFq1eS5EfqePa5A5QSV8YQUuIPyY9-fI7t92V9ehlWNsIgvmzg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/11] hw/nvme: reimplement the copy command to allow aio
 cancellation
Date: Fri,  4 Jun 2021 08:52:34 +0200
Message-Id: <20210604065237.873228-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Before this patch the code would issue several aios simultaneously
without saving a reference to the aiocb. Without the aiocb reference the
individual copies cannot be canceled.

Fix this by issuing copies of the ranges one after another.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 705 +++++++++++++++++++++++--------------------
 hw/nvme/trace-events |   3 +-
 2 files changed, 373 insertions(+), 335 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 04027c80ad90..fb65a4f12d1f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2078,226 +2078,6 @@ out:
     nvme_aio_zone_reset_complete_cb(opaque, ret);
 }
 
-struct nvme_copy_ctx {
-    int copies;
-    uint8_t *bounce;
-    uint8_t *mbounce;
-    uint32_t nlb;
-    NvmeCopySourceRange *ranges;
-};
-
-struct nvme_copy_in_ctx {
-    NvmeRequest *req;
-    QEMUIOVector iov;
-    NvmeCopySourceRange *range;
-};
-
-static void nvme_copy_complete_cb(void *opaque, int ret)
-{
-    NvmeRequest *req = opaque;
-    NvmeNamespace *ns = req->ns;
-    struct nvme_copy_ctx *ctx = req->opaque;
-
-    if (ret) {
-        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-        nvme_aio_err(req, ret);
-        goto out;
-    }
-
-    block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
-
-out:
-    if (ns->params.zoned) {
-        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-        uint64_t sdlba = le64_to_cpu(copy->sdlba);
-        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
-
-        nvme_advance_zone_wp(ns, zone, ctx->nlb);
-    }
-
-    g_free(ctx->bounce);
-    g_free(ctx->mbounce);
-    g_free(ctx);
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
-static void nvme_copy_cb(void *opaque, int ret)
-{
-    NvmeRequest *req = opaque;
-    NvmeNamespace *ns = req->ns;
-    struct nvme_copy_ctx *ctx = req->opaque;
-
-    trace_pci_nvme_copy_cb(nvme_cid(req));
-
-    if (ret) {
-        goto out;
-    }
-
-    if (ns->lbaf.ms) {
-        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-        uint64_t sdlba = le64_to_cpu(copy->sdlba);
-        int64_t offset = nvme_moff(ns, sdlba);
-
-        qemu_iovec_reset(&req->sg.iov);
-        qemu_iovec_add(&req->sg.iov, ctx->mbounce, nvme_m2b(ns, ctx->nlb));
-
-        req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &req->sg.iov, 0,
-                                     nvme_copy_complete_cb, req);
-        return;
-    }
-
-out:
-    nvme_copy_complete_cb(opaque, ret);
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
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-        uint8_t prinfor = (copy->control[0] >> 4) & 0xf;
-        uint8_t prinfow = (copy->control[2] >> 2) & 0xf;
-        uint16_t nr = copy->nr + 1;
-        NvmeCopySourceRange *range;
-        uint64_t slba;
-        uint32_t nlb;
-        uint16_t apptag, appmask;
-        uint32_t reftag;
-        uint8_t *buf = ctx->bounce, *mbuf = ctx->mbounce;
-        size_t len, mlen;
-        int i;
-
-        for (i = 0; i < nr; i++) {
-            range = &ctx->ranges[i];
-            slba = le64_to_cpu(range->slba);
-            nlb = le16_to_cpu(range->nlb) + 1;
-            len = nvme_l2b(ns, nlb);
-            mlen = nvme_m2b(ns, nlb);
-            apptag = le16_to_cpu(range->apptag);
-            appmask = le16_to_cpu(range->appmask);
-            reftag = le32_to_cpu(range->reftag);
-
-            status = nvme_dif_check(ns, buf, len, mbuf, mlen, prinfor, slba,
-                                    apptag, appmask, &reftag);
-            if (status) {
-                goto invalid;
-            }
-
-            buf += len;
-            mbuf += mlen;
-        }
-
-        apptag = le16_to_cpu(copy->apptag);
-        appmask = le16_to_cpu(copy->appmask);
-        reftag = le32_to_cpu(copy->reftag);
-
-        if (prinfow & NVME_RW_PRINFO_PRACT) {
-            size_t len = nvme_l2b(ns, ctx->nlb);
-            size_t mlen = nvme_m2b(ns, ctx->nlb);
-
-            status = nvme_check_prinfo(ns, prinfow, sdlba, reftag);
-            if (status) {
-                goto invalid;
-            }
-
-            nvme_dif_pract_generate_dif(ns, ctx->bounce, len, ctx->mbounce,
-                                        mlen, apptag, &reftag);
-        } else {
-            status = nvme_dif_check(ns, ctx->bounce, len, ctx->mbounce, mlen,
-                                    prinfow, sdlba, apptag, appmask, &reftag);
-            if (status) {
-                goto invalid;
-            }
-        }
-    }
-
-    status = nvme_check_bounds(ns, sdlba, ctx->nlb);
-    if (status) {
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
-    qemu_iovec_init(&req->sg.iov, 1);
-    qemu_iovec_add(&req->sg.iov, ctx->bounce, nvme_l2b(ns, ctx->nlb));
-
-    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
-                     BLOCK_ACCT_WRITE);
-
-    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
-                                 &req->sg.iov, 0, nvme_copy_cb, req);
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
-        g_free(ctx->mbounce);
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
     struct {
         QEMUIOVector iov;
@@ -2698,153 +2478,412 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+typedef struct NvmeCopyAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    NvmeCopySourceRange *ranges;
+    int nr;
+    int idx;
+
+    uint8_t *bounce;
+    QEMUIOVector iov;
+    struct {
+        BlockAcctCookie read;
+        BlockAcctCookie write;
+    } acct;
+
+    uint32_t reftag;
+    uint64_t slba;
+
+    NvmeZone *zone;
+} NvmeCopyAIOCB;
+
+static void nvme_copy_cancel(BlockAIOCB *aiocb)
+{
+    NvmeCopyAIOCB *iocb = container_of(aiocb, NvmeCopyAIOCB, common);
+
+    iocb->ret = -ECANCELED;
+    iocb->idx = iocb->nr;
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
+    BlockAcctStats *stats = blk_get_stats(ns->blkconf.blk);
+
+    if (iocb->idx != iocb->nr) {
+        req->cqe.result = cpu_to_le32(iocb->idx);
+    }
+
+    qemu_iovec_destroy(&iocb->iov);
+    g_free(iocb->bounce);
+
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+
+    if (iocb->ret < 0) {
+        block_acct_failed(stats, &iocb->acct.read);
+        block_acct_failed(stats, &iocb->acct.write);
+    } else {
+        block_acct_done(stats, &iocb->acct.read);
+        block_acct_done(stats, &iocb->acct.write);
+    }
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_aio_unref(iocb);
+}
+
+static void nvme_copy_cb(void *opaque, int ret);
+
+static void nvme_copy_out_completed_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopySourceRange *range = &iocb->ranges[iocb->idx];
+    uint32_t nlb = le32_to_cpu(range->nlb) + 1;
+
+    if (ret < 0) {
+        nvme_copy_cb(iocb, ret);
+        return;
+    }
+
+    if (ns->params.zoned) {
+        nvme_advance_zone_wp(ns, iocb->zone, nlb);
+    }
+
+    iocb->idx++;
+    iocb->slba += nlb;
+    nvme_copy_cb(iocb, 0);
+}
+
+static void nvme_copy_out_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopySourceRange *range;
+    uint32_t nlb;
+    size_t mlen;
+    uint8_t *mbounce;
+
+    if (ret < 0) {
+        nvme_copy_cb(iocb, ret);
+        return;
+    }
+
+    if (!ns->lbaf.ms) {
+        nvme_copy_out_completed_cb(iocb, 0);
+        return;
+    }
+
+    range = &iocb->ranges[iocb->idx];
+    nlb = le32_to_cpu(range->nlb) + 1;
+
+    mlen = nvme_m2b(ns, nlb);
+    mbounce = iocb->bounce + nvme_l2b(ns, nlb);
+
+    qemu_iovec_reset(&iocb->iov);
+    qemu_iovec_add(&iocb->iov, mbounce, mlen);
+
+    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_moff(ns, iocb->slba),
+                                  &iocb->iov, 0, nvme_copy_out_completed_cb,
+                                  iocb);
+
+    return;
+}
+
+static void nvme_copy_in_completed_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopySourceRange *range;
+    uint32_t nlb;
+    size_t len;
+    uint16_t status;
+
+    if (ret < 0) {
+        nvme_copy_cb(iocb, ret);
+        return;
+    }
+
+    range = &iocb->ranges[iocb->idx];
+    nlb = le32_to_cpu(range->nlb) + 1;
+    len = nvme_l2b(ns, nlb);
+
+    trace_pci_nvme_copy_out(iocb->slba, nlb);
+
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+
+        uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
+        uint16_t prinfow = ((copy->control[2] >> 2) & 0xf);
+
+        uint16_t apptag = le16_to_cpu(range->apptag);
+        uint16_t appmask = le16_to_cpu(range->appmask);
+        uint32_t reftag = le32_to_cpu(range->reftag);
+
+        uint64_t slba = le64_to_cpu(range->slba);
+        size_t mlen = nvme_m2b(ns, nlb);
+        uint8_t *mbounce = iocb->bounce + nvme_l2b(ns, nlb);
+
+        status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen, prinfor,
+                                slba, apptag, appmask, &reftag);
+        if (status) {
+            goto invalid;
+        }
+
+        apptag = le16_to_cpu(copy->apptag);
+        appmask = le16_to_cpu(copy->appmask);
+
+        if (prinfow & NVME_PRINFO_PRACT) {
+            status = nvme_check_prinfo(ns, prinfow, iocb->slba, iocb->reftag);
+            if (status) {
+                goto invalid;
+            }
+
+            nvme_dif_pract_generate_dif(ns, iocb->bounce, len, mbounce, mlen,
+                                        apptag, &iocb->reftag);
+        } else {
+            status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen,
+                                    prinfow, iocb->slba, apptag, appmask,
+                                    &iocb->reftag);
+            if (status) {
+                goto invalid;
+            }
+        }
+    }
+
+    status = nvme_check_bounds(ns, iocb->slba, nlb);
+    if (status) {
+        goto invalid;
+    }
+
+    if (ns->params.zoned) {
+        status = nvme_check_zone_write(ns, iocb->zone, iocb->slba, nlb);
+        if (status) {
+            goto invalid;
+        }
+
+        iocb->zone->w_ptr += nlb;
+    }
+
+    qemu_iovec_reset(&iocb->iov);
+    qemu_iovec_add(&iocb->iov, iocb->bounce, len);
+
+    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, iocb->slba),
+                                  &iocb->iov, 0, nvme_copy_out_cb, iocb);
+
+    return;
+
+invalid:
+    req->status = status;
+    iocb->aiocb = NULL;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
+}
+
+static void nvme_copy_in_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopySourceRange *range;
+    uint64_t slba;
+    uint32_t nlb;
+
+    if (ret < 0) {
+        nvme_copy_cb(iocb, ret);
+        return;
+    }
+
+    if (!ns->lbaf.ms) {
+        nvme_copy_in_completed_cb(iocb, 0);
+        return;
+    }
+
+    range = &iocb->ranges[iocb->idx];
+    slba = le64_to_cpu(range->slba);
+    nlb = le32_to_cpu(range->nlb) + 1;
+
+    qemu_iovec_reset(&iocb->iov);
+    qemu_iovec_add(&iocb->iov, iocb->bounce + nvme_l2b(ns, nlb),
+                   nvme_m2b(ns, nlb));
+
+    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_moff(ns, slba),
+                                 &iocb->iov, 0, nvme_copy_in_completed_cb,
+                                 iocb);
+    return;
+}
+
+static void nvme_copy_cb(void *opaque, int ret)
+{
+    NvmeCopyAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCopySourceRange *range;
+    uint64_t slba;
+    uint32_t nlb;
+    size_t len;
+    uint16_t status;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    if (iocb->idx == iocb->nr) {
+        goto done;
+    }
+
+    range = &iocb->ranges[iocb->idx];
+    slba = le64_to_cpu(range->slba);
+    nlb = le32_to_cpu(range->nlb) + 1;
+    len = nvme_l2b(ns, nlb);
+
+    trace_pci_nvme_copy_source_range(slba, nlb);
+
+    if (nlb > le16_to_cpu(ns->id_ns.mssrl)) {
+        status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        goto invalid;
+    }
+
+    status = nvme_check_bounds(ns, slba, nlb);
+    if (status) {
+        goto invalid;
+    }
+
+    if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
+        status = nvme_check_dulbe(ns, slba, nlb);
+        if (status) {
+            goto invalid;
+        }
+    }
+
+    if (ns->params.zoned) {
+        status = nvme_check_zone_read(ns, slba, nlb);
+        if (status) {
+            goto invalid;
+        }
+    }
+
+    qemu_iovec_reset(&iocb->iov);
+    qemu_iovec_add(&iocb->iov, iocb->bounce, len);
+
+    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(ns, slba),
+                                 &iocb->iov, 0, nvme_copy_in_cb, iocb);
+    return;
+
+invalid:
+    req->status = status;
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
-
+    NvmeCopyAIOCB *iocb = blk_aio_get(&nvme_copy_aiocb_info, ns->blkconf.blk,
+                                      nvme_misc_cb, req);
     uint16_t nr = copy->nr + 1;
     uint8_t format = copy->control[0] & 0xf;
-    uint8_t prinfor = (copy->control[0] >> 4) & 0xf;
-    uint8_t prinfow = (copy->control[2] >> 2) & 0xf;
+    uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
+    uint16_t prinfow = ((copy->control[2] >> 2) & 0xf);
 
-    uint32_t nlb = 0;
-    uint8_t *bounce = NULL, *bouncep = NULL;
-    uint8_t *mbounce = NULL, *mbouncep = NULL;
-    struct nvme_copy_ctx *ctx;
     uint16_t status;
-    int i;
 
     trace_pci_nvme_copy(nvme_cid(req), nvme_nsid(ns), nr, format);
 
+    iocb->ranges = NULL;
+    iocb->zone = NULL;
+
     if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
         ((prinfor & NVME_PRINFO_PRACT) != (prinfow & NVME_PRINFO_PRACT))) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        status = NVME_INVALID_FIELD | NVME_DNR;
+        goto invalid;
     }
 
     if (!(n->id_ctrl.ocfs & (1 << format))) {
         trace_pci_nvme_err_copy_invalid_format(format);
-        return NVME_INVALID_FIELD | NVME_DNR;
+        status = NVME_INVALID_FIELD | NVME_DNR;
+        goto invalid;
     }
 
     if (nr > ns->id_ns.msrc + 1) {
-        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
-    }
-
-    ctx = g_new(struct nvme_copy_ctx, 1);
-    ctx->ranges = g_new(NvmeCopySourceRange, nr);
-
-    status = nvme_h2c(n, (uint8_t *)ctx->ranges,
-                      nr * sizeof(NvmeCopySourceRange), req);
-    if (status) {
-        goto out;
-    }
-
-    for (i = 0; i < nr; i++) {
-        uint64_t slba = le64_to_cpu(ctx->ranges[i].slba);
-        uint32_t _nlb = le16_to_cpu(ctx->ranges[i].nlb) + 1;
-
-        if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
-            status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
-            goto out;
-        }
-
-        status = nvme_check_bounds(ns, slba, _nlb);
-        if (status) {
-            goto out;
-        }
-
-        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
-            status = nvme_check_dulbe(ns, slba, _nlb);
-            if (status) {
-                goto out;
-            }
-        }
-
-        if (ns->params.zoned) {
-            status = nvme_check_zone_read(ns, slba, _nlb);
-            if (status) {
-                goto out;
-            }
-        }
-
-        nlb += _nlb;
-    }
-
-    if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
         status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
-        goto out;
+        goto invalid;
     }
 
-    bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
-    if (ns->lbaf.ms) {
-        mbounce = mbouncep = g_malloc(nvme_m2b(ns, nlb));
+    iocb->ranges = g_new(NvmeCopySourceRange, nr);
+
+    status = nvme_h2c(n, (uint8_t *)iocb->ranges,
+                      sizeof(NvmeCopySourceRange) * nr, req);
+    if (status) {
+        goto invalid;
     }
 
-    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
-                     BLOCK_ACCT_READ);
+    iocb->slba = le64_to_cpu(copy->sdlba);
 
-    ctx->bounce = bounce;
-    ctx->mbounce = mbounce;
-    ctx->nlb = nlb;
-    ctx->copies = 1;
+    if (ns->params.zoned) {
+        iocb->zone = nvme_get_zone_by_slba(ns, iocb->slba);
+        if (!iocb->zone) {
+            status = NVME_LBA_RANGE | NVME_DNR;
+            goto invalid;
+        }
 
-    req->opaque = ctx;
-
-    for (i = 0; i < nr; i++) {
-        uint64_t slba = le64_to_cpu(ctx->ranges[i].slba);
-        uint32_t nlb = le16_to_cpu(ctx->ranges[i].nlb) + 1;
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
-
-        if (ns->lbaf.ms) {
-            len = nvme_m2b(ns, nlb);
-            offset = nvme_moff(ns, slba);
-
-            in_ctx = g_new(struct nvme_copy_in_ctx, 1);
-            in_ctx->req = req;
-
-            qemu_iovec_init(&in_ctx->iov, 1);
-            qemu_iovec_add(&in_ctx->iov, mbouncep, len);
-
-            ctx->copies++;
-
-            blk_aio_preadv(ns->blkconf.blk, offset, &in_ctx->iov, 0,
-                           nvme_aio_copy_in_cb, in_ctx);
-
-            mbouncep += len;
+        status = nvme_zrm_auto(ns, iocb->zone);
+        if (status) {
+            goto invalid;
         }
     }
 
-    /* account for the 1-initialization */
-    ctx->copies--;
+    iocb->req = req;
+    iocb->bh = qemu_bh_new(nvme_copy_bh, iocb);
+    iocb->ret = 0;
+    iocb->nr = nr;
+    iocb->idx = 0;
+    iocb->reftag = le32_to_cpu(copy->reftag);
+    iocb->bounce = g_malloc_n(le16_to_cpu(ns->id_ns.mssrl),
+                              ns->lbasz + ns->lbaf.ms);
 
-    if (!ctx->copies) {
-        nvme_copy_in_complete(req);
-    }
+    qemu_iovec_init(&iocb->iov, 1);
+
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &iocb->acct.read, 0,
+                     BLOCK_ACCT_READ);
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &iocb->acct.write, 0,
+                     BLOCK_ACCT_WRITE);
+
+    req->aiocb = &iocb->common;
+    nvme_copy_cb(iocb, 0);
 
     return NVME_NO_COMPLETE;
 
-out:
-    g_free(ctx->ranges);
-    g_free(ctx);
-
+invalid:
+    g_free(iocb->ranges);
+    qemu_aio_unref(iocb);
     return status;
 }
 
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index a3e11346865e..cd65f8b28895 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -30,8 +30,7 @@ pci_nvme_dif_prchk_apptag(uint16_t apptag, uint16_t elbat, uint16_t elbatm) "app
 pci_nvme_dif_prchk_reftag(uint32_t reftag, uint32_t elbrt) "reftag 0x%"PRIx32" elbrt 0x%"PRIx32""
 pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
 pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
-pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
-pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_copy_out(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_verify(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_verify_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_verify_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
-- 
2.31.1


