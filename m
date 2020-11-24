Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CDF2C1EE1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:29:38 +0100 (CET)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khSld-0002s7-9K
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSX0-0006pr-5C; Tue, 24 Nov 2020 02:14:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSWw-0001KS-Sa; Tue, 24 Nov 2020 02:14:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF0015C01E3;
 Tue, 24 Nov 2020 02:14:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 24 Nov 2020 02:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=MntrGkJALBl9B
 8Uoh5Jj33osbScpCkhPmPMRVEUbVR8=; b=jzdBuRv+BHSne5sLAyt1zBuq+LGur
 Yf356NF8k6pMMJT5Vii7/jeKBCIv0tU5TvwjAOuDrDX01A/yI6jKrMMYnXTEV0vn
 pDgbQdVk/ZFkC+ktk4HHnubsy7kVo8uPW73DjAP8uIr/0DhbbpmdhHJ+WnuVyFKq
 tZi33WVvkMVOg3Vh8M72volp5X/bYGQala8g5eMpLliitoGsM1WxrrCFrIymlARB
 7+UIaaa1qwR+H9v8p0dMnWLrG8RNYlORowdEz1nH+Mm9lJzApuu5U8WX5yTimD6S
 +nbIDd5xS0Nn2Pw9Qu+C9cWRqOQi4cye0SmMPaZB18ixG4yS9OmDYCThw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=MntrGkJALBl9B8Uoh5Jj33osbScpCkhPmPMRVEUbVR8=; b=IbqZVmQF
 pGNh4peWrkzcFFpW5rFNcjCNCN1maF4O7crPZbN2yos7WDgf4NHLzDzZvjIup4nN
 C8G9HMYbvQyOo6oe3nC7XMRrtUO5cVwrmjLLCW8BHN0tLE0fleWrnuIYjUmxfeZm
 AuBvgA+EDdSDoiKWC1wrtSZ0sTcWIkhxzqMzbA24zCKh/NoqVTWSW1R5wqFBs9mK
 rKcoJq0OBqKUAdBrU5DcKymyO27aZ7KQAt8XaWmWvBDx9HL8ACasybmbi7e0Ol5L
 /GuymKzyiiLZx0zguTPmmbqdaImyOsIjwllPnU6cNfq9PATubQGADURuWhSeHJOK
 3PG6uQkYHm314Q==
X-ME-Sender: <xms:0LK8X4EHznC9P_pn5MLayi9JXl3oWmfMqHLTP8hDV1PohSOrSZkWoQ>
 <xme:0LK8XxU0WTNE_fRyJBLqWHqs_H_MEU_jWKxrnqJDVFO8EdCQf3_hp-R77Qei8IQSW
 BeVYCBsqB34hmqkJEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0LK8XyJjgjLp4FfPs5EyIHmvbrUM4HAnyA2seltmW1P1McRtIM27qg>
 <xmx:0LK8X6Et0MpePQQdGnTtD-BPZjGiZ0-y1s4E115JNQ1Z1_LRFRgqdQ>
 <xmx:0LK8X-XXUU4F-IJNwHHtRAu0lZ146ZzsShwuDL0_kpcnTw0nBu4uqg>
 <xmx:0LK8X8wI85IhHCI8L7qxTREJW1jutUdZPAz3kwgEVGSdA2v4h67sEQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B601A3064AB4;
 Tue, 24 Nov 2020 02:14:23 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: add simple copy command
Date: Tue, 24 Nov 2020 08:14:18 +0100
Message-Id: <20201124071418.12160-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124071418.12160-1-its@irrelevant.dk>
References: <20201124071418.12160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for TP 4065a ("Simple Copy Command"), v2020.05.04
("Ratified").

The implementation uses a bounce buffer to first read in the source
logical blocks, then issue a write of that bounce buffer. The default
maximum number of source logical blocks is 128, translating to 512 KiB
for 4k logical blocks which aligns with the default value of MDTS.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   4 +
 hw/block/nvme.h       |   1 +
 hw/block/nvme-ns.c    |   8 ++
 hw/block/nvme.c       | 225 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   6 ++
 5 files changed, 243 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 44bf6271b744..745d288b09cf 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -21,6 +21,10 @@
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+
+    uint16_t mssrl;
+    uint32_t mcl;
+    uint8_t  msrc;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 574333caa3f9..f549abeeb930 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -62,6 +62,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
 }
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 2d69b5177b51..eb28757c2f17 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -59,6 +59,11 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->npda = id_ns->npdg = npdg - 1;
 
+    /* simple copy */
+    id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
+    id_ns->mcl = cpu_to_le32(ns->params.mcl);
+    id_ns->msrc = ns->params.msrc;
+
     return 0;
 }
 
@@ -150,6 +155,9 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
+    DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
+    DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
+    DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 255),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f7f888402b06..82233f80541e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -999,6 +999,109 @@ static void nvme_aio_discard_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_copy_ctx {
+    int copies;
+    uint8_t *bounce;
+    uint32_t nlb;
+};
+
+struct nvme_copy_in_ctx {
+    NvmeRequest *req;
+    QEMUIOVector iov;
+};
+
+static void nvme_copy_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeNamespace *ns = req->ns;
+    struct nvme_copy_ctx *ctx = req->opaque;
+
+    trace_pci_nvme_copy_cb(nvme_cid(req));
+
+    if (!ret) {
+        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+    } else {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+        nvme_aio_err(req, ret);
+    }
+
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static void nvme_copy_in_complete(NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    struct nvme_copy_ctx *ctx = req->opaque;
+    uint64_t sdlba = le64_to_cpu(copy->sdlba);
+    uint16_t status;
+
+    trace_pci_nvme_copy_in_complete(nvme_cid(req));
+
+    block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+    status = nvme_check_bounds(ns, sdlba, ctx->nlb);
+    if (status) {
+        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
+        req->status = status;
+
+        g_free(ctx->bounce);
+        g_free(ctx);
+
+        nvme_enqueue_req_completion(nvme_cq(req), req);
+
+        return;
+    }
+
+    qemu_iovec_init(&req->iov, 1);
+    qemu_iovec_add(&req->iov, ctx->bounce, nvme_l2b(ns, ctx->nlb));
+
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct,
+                     nvme_l2b(ns, ctx->nlb), BLOCK_ACCT_WRITE);
+
+    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
+                                 &req->iov, 0, nvme_copy_cb, req);
+}
+
+static void nvme_aio_copy_in_cb(void *opaque, int ret)
+{
+    struct nvme_copy_in_ctx *in_ctx = opaque;
+    NvmeRequest *req = in_ctx->req;
+    NvmeNamespace *ns = req->ns;
+    struct nvme_copy_ctx *ctx = req->opaque;
+
+    qemu_iovec_destroy(&in_ctx->iov);
+    g_free(in_ctx);
+
+    trace_pci_nvme_aio_copy_in_cb(nvme_cid(req));
+
+    if (ret) {
+        nvme_aio_err(req, ret);
+    }
+
+    ctx->copies--;
+
+    if (ctx->copies) {
+        return;
+    }
+
+    if (req->status) {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+        g_free(ctx->bounce);
+        g_free(ctx);
+
+        nvme_enqueue_req_completion(nvme_cq(req), req);
+
+        return;
+    }
+
+    nvme_copy_in_complete(req);
+}
+
 static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -1072,6 +1175,122 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    g_autofree NvmeCopySourceRange *range = NULL;
+
+    uint32_t cdw12 = le32_to_cpu(copy->cdw12);
+    uint16_t nr = (cdw12 & 0xff) + 1;
+    uint8_t format = (cdw12 >> 8) & 0xf;
+    uint32_t nlb = 0;
+
+    uint8_t *bounce = NULL, *bouncep = NULL;
+    struct nvme_copy_ctx *ctx;
+    uint16_t status;
+    int i;
+
+    trace_pci_nvme_copy(nvme_cid(req), nvme_nsid(ns), nr, format);
+
+    if (!(n->id_ctrl.ocfs & (1 << format))) {
+        trace_pci_nvme_err_copy_invalid_format(format);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (nr > ns->id_ns.msrc + 1) {
+        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+    }
+
+    range = g_new(NvmeCopySourceRange, nr);
+
+    status = nvme_dma(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
+                      DMA_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        return status;
+    }
+
+    for (i = 0; i < nr; i++) {
+        uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
+        if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
+            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        }
+
+        nlb += _nlb;
+    }
+
+    if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
+        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+    }
+
+    bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
+
+    for (i = 0; i < nr; i++) {
+        uint64_t slba = le64_to_cpu(range[i].slba);
+        uint32_t nlb = le16_to_cpu(range[i].nlb) + 1;
+
+        status = nvme_check_bounds(ns, slba, nlb);
+        if (status) {
+            trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+            goto free_bounce;
+        }
+
+        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
+            status = nvme_check_dulbe(ns, slba, nlb);
+            if (status) {
+                goto free_bounce;
+            }
+        }
+    }
+
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct,
+                     nvme_l2b(ns, nlb), BLOCK_ACCT_READ);
+
+    ctx = g_new(struct nvme_copy_ctx, 1);
+
+    ctx->bounce = bounce;
+    ctx->nlb = nlb;
+    ctx->copies = 1;
+
+    req->opaque = ctx;
+
+    for (i = 0; i < nr; i++) {
+        uint64_t slba = le64_to_cpu(range[i].slba);
+        uint32_t nlb = le16_to_cpu(range[i].nlb) + 1;
+
+        size_t len = nvme_l2b(ns, nlb);
+        int64_t offset = nvme_l2b(ns, slba);
+
+        trace_pci_nvme_copy_source_range(slba, nlb);
+
+        struct nvme_copy_in_ctx *in_ctx = g_new(struct nvme_copy_in_ctx, 1);
+        in_ctx->req = req;
+
+        qemu_iovec_init(&in_ctx->iov, 1);
+        qemu_iovec_add(&in_ctx->iov, bouncep, len);
+
+        ctx->copies++;
+
+        blk_aio_preadv(ns->blkconf.blk, offset, &in_ctx->iov, 0,
+                       nvme_aio_copy_in_cb, in_ctx);
+
+        bouncep += len;
+    }
+
+    /* account for the 1-initialization */
+    ctx->copies--;
+
+    if (!ctx->copies) {
+        nvme_copy_in_complete(req);
+    }
+
+    return NVME_NO_COMPLETE;
+
+free_bounce:
+    g_free(bounce);
+    return status;
+}
+
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
     block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
@@ -1203,6 +1422,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_rw(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
+    case NVME_CMD_COPY:
+        return nvme_copy(n, req);
     default:
         trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
@@ -2927,9 +3148,11 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
-                           NVME_ONCS_FEATURES | NVME_ONCS_DSM);
+                           NVME_ONCS_FEATURES | NVME_ONCS_DSM |
+                           NVME_ONCS_COPY);
 
     id->vwc = 0x1;
+    id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0);
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 1ffe0b3f76b5..27e78b156d9b 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -42,11 +42,16 @@ pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, cons
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_rw(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
+pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
+pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
@@ -97,6 +102,7 @@ pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_cfs(void) "controller fatal status"
 pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu16" err '%s' status 0x%"PRIx16""
+pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
 pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
-- 
2.29.2


