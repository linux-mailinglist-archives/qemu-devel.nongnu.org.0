Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27643149A0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:44:34 +0100 (CET)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9NhJ-000307-Gq
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUk-0004sh-Ip; Tue, 09 Feb 2021 02:31:34 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:37271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUi-0005Uk-Lv; Tue, 09 Feb 2021 02:31:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 50588C10;
 Tue,  9 Feb 2021 02:31:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yr+ODXq0ar8Wm
 PLirTI08uQrB++W1cT3xbvsWymg0no=; b=1Ov3Ue3h5VMk0D9R3/sTQoqeOgVbb
 GYfABsSOE07gE05mCWat9xGwRzSdUfxk51MQlmkZqUl0nVrvoGTE2BrOjfzJ7syH
 kqsXX+KRqqcDfwwldtATaDXAdrszghzRMOTUrXzpltq1ho6qYO7ui6u4v7nWQ7s2
 fQU4CZx37uaBvMZb+bdtR+BcUew/NKoXMcqUaWtKvioXeT6ivi7OCQE/Aey3EbTF
 CB2HCO4adQU0wOWIlhYgQdiqxjLrGNtFyPorJ/4ybESWBP2wxnxYjOt9M0hmnCAi
 IbqoPjwzFodGEQanOl6bx4LlOgSIvgd9EakgBVNeOG6DHH9vaVqQOeZ7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yr+ODXq0ar8WmPLirTI08uQrB++W1cT3xbvsWymg0no=; b=Bg4ERhJW
 yC07IVj3q4VYxZ3GeC9Ks264R4q+SMJyLREH/xaL5gCpjmBBoVHmrwEwZ4ClLpX8
 c5pa6nnJdFyWHbINL4EBgIXfK3bLrKCLJFkP+EzKkTgrNEMnTPn/68ZXvUgkfiJo
 ZKsJjOQxXHJIyb0ivJHJJNV70M2U52znxfCE0+2AWpiJuCWANDwmV9fx6oBl2lJh
 fUVapW1tyTndWAhppGTw5bkUyQ5vFnmr7OqqcCi1UkfNLNLK62sFhyT4giQ+1Ztw
 Vmj2PmDi5zAoqWkh//E7MMcD/aXwS79Py3osWLFhVm0/7jexwInVscOqcz7+5hga
 m7Z+w0kuZctG1g==
X-ME-Sender: <xms:UToiYN5d46RtuIAe2EoR-C3eyiiS3rfaN0oHpqt6XW2CvHAU9f0low>
 <xme:UToiYK6Hws9q-XLd0V61_96SvaJcnGU959dJTQ6sFFqDUB3xjH3M7UxD-T3IBQwkV
 NC-RkFeX7nxxH7O1jo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UToiYEdxgivYc3l-YDcyoMpaaB1jkznhyCkdbHKqKzlOnuvsTt06jQ>
 <xmx:UToiYGJxp_zmCMMEks9xn7fyAWkGYjXinbgOpd7lhR9mqMr9dYyyOg>
 <xmx:UToiYBIXxcFdxt7Jzmbw9q3KZ0gXaUcJSg3bv7-gaXXikaCgzXFfVQ>
 <xmx:UToiYKWu47I0kRF-vrgKFKa9tkFS-zSqGU1bjXc0J--BT_6OagFaqy_5s2o>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F8351080057;
 Tue,  9 Feb 2021 02:31:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/56] hw/block/nvme: add compare command
Date: Tue,  9 Feb 2021 08:30:11 +0100
Message-Id: <20210209073101.548811-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add the Compare command.

This implementation uses a bounce buffer to read in the data from
storage and then compare with the host supplied buffer.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: rebased]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c       | 101 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   2 +
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f019d43788ac..b9313fdc4762 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -999,6 +999,51 @@ static void nvme_aio_discard_cb(void *opaque, int ret)
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
+        req->status = status;
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
@@ -1072,6 +1117,57 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
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
@@ -1201,6 +1297,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
         return nvme_rw(n, req);
+    case NVME_CMD_COMPARE:
+        return nvme_compare(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
     default:
@@ -2925,7 +3023,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
2.30.0


