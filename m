Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C42C1EFA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:41:26 +0100 (CET)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khSx3-0007SS-Ec
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSt8-0006sY-JV; Tue, 24 Nov 2020 02:37:22 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSt6-0000qs-6N; Tue, 24 Nov 2020 02:37:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B0975C01EF;
 Tue, 24 Nov 2020 02:37:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 24 Nov 2020 02:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=M6rqWmhWkTrnHrnv5n1TjWtlMK
 LvPHfGbuHtvMjyOpA=; b=YE55MFhMmL1BUg+JApDtyXMwh/IuA108cn3UJM5cWd
 SW2k5GKBNOs2VAoYT9IwEjkCYcK7Ls5s3KECn0fFjzCD93hN6NZEjhoFkUT+TWHe
 rnU9qvhmOTYQZKFinNF37OxEBTW9/2EnB0Sjtp0K2bamjCglOORLF+DMd7sVFCP7
 kMpG8XK04Wds8V4mTCrpFriRIl6n9k9rOm8dP6stym+JnBcGQxWZ2mMz1lrQHdYT
 48kDEoCXd3t+Dcn6q5sNP4xNx8WZpXYoW7vhXg6rxSgfFbleJU9iBCNu1vUVPsoP
 ihQfSv/pbIA/UTtJ7ll8Ne+bQa2Krq3DSpM73hAm6Hrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=M6rqWmhWkTrnHrnv5
 n1TjWtlMKLvPHfGbuHtvMjyOpA=; b=IN32QY7JUmYAr40PytTo/zsNGNOrxWp+q
 Xd4JjReOxu6OvnqoTdvkxfivrpkevmkCEnjWZtIVWyFgydcO5elRx2PS6TNIqNEJ
 I2hSjUAX0u0+B9cAU9+pAEx7nZ/ZJdW4kTGQvBBYkDtqozr8sQZLz148bjQUgg9h
 WnL+WG1khyJztnm2GRP+d6JEV3zX8QSV3CkmKU3q3Moig0mEvErL2+JDRYr68E0o
 FzLUVZ2TJhncEAi6mHVPGRhinDjgSCgWOmG1rf2kl5P9bFC28Cu0VVHBIBWfbFvl
 d+wBw8JumBVqc3q6uZK7GUE50jFL+SWWTB3WyRxlNuxT8GsPbkJEA==
X-ME-Sender: <xms:Lri8X4ZQpYW08AJxVGeDyqrPmPyusqD-5sQwg3H1q4yl7qjtEgBXQw>
 <xme:Lri8XzbJOSVOJePRsirWSOvPSkv-tugWG5qNNkapDfoU22fQd7PNI1VBb9JV9Lt85
 hI8mRce7ABh0qHQI6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteeh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Lri8Xy-IiQ28ZItvN3pEXSsm0XzO9wMjyWXyo4dfRfByTijYoa8pgQ>
 <xmx:Lri8XyqiIOZVntRO1MnQb2Ob1bOWU4W3vCN3kppj1ekWqN1MoA0z_w>
 <xmx:Lri8XzqMknRUZsuPyCnFnNvHGby_-JT-lXiunwFxGiTv_9TEg8_wKA>
 <xmx:L7i8X0CbyDKbqQAGCShtMMW1VN4M4H-lt_WdH_8wf9YZJAWJHr4lvA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E055C328005D;
 Tue, 24 Nov 2020 02:37:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: add compare command
Date: Tue, 24 Nov 2020 08:37:14 +0100
Message-Id: <20201124073714.24458-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add the Compare command.

This implementation uses a bounce buffer to read in the data from
storage and then compare with the host supplied buffer.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: rebased]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 100 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   2 +
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f7f888402b06..f88710ca3948 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -999,6 +999,50 @@ static void nvme_aio_discard_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_compare_ctx {
+    QEMUIOVector iov;
+    uint8_t *bounce;
+    size_t len;
+};
+
+static void nvme_compare_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeNamespace *ns = req->ns;
+    struct nvme_compare_ctx *ctx = req->opaque;
+    g_autofree uint8_t *buf = NULL;
+    uint16_t status;
+
+    trace_pci_nvme_compare_cb(nvme_cid(req));
+
+    if (!ret) {
+        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+    } else {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+        nvme_aio_err(req, ret);
+        goto out;
+    }
+
+    buf = g_malloc(ctx->len);
+
+    status = nvme_dma(nvme_ctrl(req), buf, ctx->len, DMA_DIRECTION_TO_DEVICE,
+                      req);
+    if (status) {
+        goto out;
+    }
+
+    if (memcmp(buf, ctx->bounce, ctx->len)) {
+        req->status = NVME_CMP_FAILURE;
+    }
+
+out:
+    qemu_iovec_destroy(&ctx->iov);
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
 static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -1072,6 +1116,57 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    size_t len = nvme_l2b(ns, nlb);
+    int64_t offset = nvme_l2b(ns, slba);
+    uint8_t *bounce = NULL;
+    struct nvme_compare_ctx *ctx = NULL;
+    uint16_t status;
+
+    trace_pci_nvme_compare(nvme_cid(req), nvme_nsid(ns), slba, nlb);
+
+    status = nvme_check_mdts(n, len);
+    if (status) {
+        trace_pci_nvme_err_mdts(nvme_cid(req), len);
+        return status;
+    }
+
+    status = nvme_check_bounds(ns, slba, nlb);
+    if (status) {
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+        return status;
+    }
+
+    if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
+        status = nvme_check_dulbe(ns, slba, nlb);
+        if (status) {
+            return status;
+        }
+    }
+
+    bounce = g_malloc(len);
+
+    ctx = g_new(struct nvme_compare_ctx, 1);
+    ctx->bounce = bounce;
+    ctx->len = len;
+
+    req->opaque = ctx;
+
+    qemu_iovec_init(&ctx->iov, 1);
+    qemu_iovec_add(&ctx->iov, bounce, len);
+
+    block_acct_start(blk_get_stats(blk), &req->acct, len, BLOCK_ACCT_READ);
+    blk_aio_preadv(blk, offset, &ctx->iov, 0, nvme_compare_cb, req);
+
+    return NVME_NO_COMPLETE;
+}
+
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
     block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
@@ -1201,6 +1296,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
         return nvme_rw(n, req);
+    case NVME_CMD_COMPARE:
+        return nvme_compare(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
     default:
@@ -2927,7 +3024,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
-                           NVME_ONCS_FEATURES | NVME_ONCS_DSM);
+                           NVME_ONCS_FEATURES | NVME_ONCS_DSM |
+                           NVME_ONCS_COMPARE);
 
     id->vwc = 0x1;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 1ffe0b3f76b5..68a4c8ed35e0 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -46,6 +46,8 @@ pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb)
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
+pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
-- 
2.29.2


