Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB231B35F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:28:48 +0100 (CET)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQop-0005pr-Bb
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQQ7-0004U7-7f; Sun, 14 Feb 2021 18:03:15 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPw-0001pa-Ly; Sun, 14 Feb 2021 18:03:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 45D325C00CD;
 Sun, 14 Feb 2021 18:02:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Feb 2021 18:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dn5W3rCE/jC+2
 tcamkUO+fE9Y29PsOrEwULbVRYQM0M=; b=uNIDCYkqD9gsItge8EIdbqQxPyKuv
 oLGkz+j8cG7KDm8eazl0NZH0auQumSMC2GSxkUIMGB7byHMJjkzztZjZ0W63pVl+
 vVrTfd7HJ3HDj6G0bn9ZeHB2ff2GsgOYCft02gaMSOl0MPoupvg5YqupC7oNBxh0
 dfrR9W9ibZ01Goz/e0qnCGew/HNiVMjmHVK8YOCGJPouhBavtHjJjeimyp1b0yW5
 Lk71SmVRoghoe9C60rr4dx9F7MMaMlivlLZy32ei9ryjShQusliz4BQ12D+9G/1R
 ymyXczRlUCVB9n/Mr2jVsBIutLs0NylpjL5ie37IQLg8Pl8itRtWUjNEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dn5W3rCE/jC+2tcamkUO+fE9Y29PsOrEwULbVRYQM0M=; b=U/nzQw05
 DNddyULHr1xY5p/7AGDRUgkgXxPRsiaxmluSUrDnIV7WbzEWjjPCGfiee3g6QRiu
 9Js3vhnPg6nJeuZsKNKPDx+8XEbl8N4Z20XHDGQoopw3SZpyvJ9jRQ9G3W+w+4Wk
 QUlbD63WbBxDlSFUPEWz2wRl8hjdsgTQSUgdhUd5Z2Vo4z2ujm+9YhRIhA2IqmCh
 a61gDgcHtVgOxQlDf7Ura+RBkjRVZHz7+gsW84+2r89VjHgVIMpE/vG6t4Iap3OY
 yO3R98LpZdfXFBoczia1znox7EG536gvNg5kl/nY78AU7krEbIl1Rb2HvIDYpydC
 wG1Nh1ieVA2CIw==
X-ME-Sender: <xms:IqwpYHMnlZseQCrN8tGO1ez8jLGd8SiwpEZkX7hz26bFskFU3Frsqg>
 <xme:IqwpYB867Z-s3my6gx5c-dqAms2HvHqV5AzzsIfHjCSULapA36jRHGyBXwCTu-N8S
 9Y_MHz-zf42YwzpZq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepkeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IqwpYGTxLagrgdv3bbmPpg4czvWx9iCtKAnFBbdfNlXvpCo2Yn29IQ>
 <xmx:IqwpYLsLg2e58YMDndzSBFVB_2--KU8tfapZLgrj96FUP8UhwkR0yQ>
 <xmx:IqwpYPfE_QU4Ik22mir996PPT9JrJGson8osCSINIOyH-HRMt5YVBA>
 <xmx:IqwpYBuKJV73nyhE3j40fE7ywKm_4TwndAQeOoLy8T8WP3PesSiLRA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D706B240057;
 Sun, 14 Feb 2021 18:02:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 09/12] hw/block/nvme: add verify command
Date: Mon, 15 Feb 2021 00:02:37 +0100
Message-Id: <20210214230240.301275-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
References: <20210214230240.301275-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

See NVM Express 1.4, section 6.14 ("Verify Command").

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: rebased, refactored for e2e]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h       |   1 +
 include/block/nvme.h  |   2 +
 hw/block/nvme.c       | 148 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   3 +
 4 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 86f000235cf0..3b8ed73d2a04 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -82,6 +82,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_VERIFY:           return "NVME_NVM_CMD_VERIFY";
     case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
     case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
     case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
diff --git a/include/block/nvme.h b/include/block/nvme.h
index a7debf29c644..c2fd7e817e5d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -579,6 +579,7 @@ enum NvmeIoCommands {
     NVME_CMD_COMPARE            = 0x05,
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
+    NVME_CMD_VERIFY             = 0x0c,
     NVME_CMD_COPY               = 0x19,
     NVME_CMD_ZONE_MGMT_SEND     = 0x79,
     NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
@@ -1060,6 +1061,7 @@ enum NvmeIdCtrlOncs {
     NVME_ONCS_FEATURES      = 1 << 4,
     NVME_ONCS_RESRVATIONS   = 1 << 5,
     NVME_ONCS_TIMESTAMP     = 1 << 6,
+    NVME_ONCS_VERIFY        = 1 << 7,
     NVME_ONCS_COPY          = 1 << 8,
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index ab45e58b2a3b..7b366f979a1c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -186,6 +186,7 @@ static const uint32_t nvme_cse_iocs_nvm[256] = {
     [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_VERIFY]               = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
 };
@@ -196,6 +197,7 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
     [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_VERIFY]               = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_ZONE_APPEND]          = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
@@ -2154,6 +2156,91 @@ out:
     nvme_e2e_rw_cb(ctx, ret);
 }
 
+
+static void nvme_verify_cb(void *opaque, int ret)
+{
+    struct nvme_bounce_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    BlockAcctCookie *acct = &req->acct;
+    BlockAcctStats *stats = blk_get_stats(blk);
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint16_t status;
+
+    trace_pci_nvme_verify_cb(nvme_cid(req), NVME_RW_PRINFO(ctrl), apptag,
+                             appmask, reftag);
+
+    if (ret) {
+        block_acct_failed(stats, acct);
+        nvme_aio_err(req, ret);
+        goto out;
+    }
+
+    block_acct_done(stats, acct);
+
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        status = nvme_e2e_mangle_mdata(ns, ctx->mdata.bounce,
+                                       ctx->mdata.iov.size, slba);
+        if (status) {
+            req->status = status;
+            goto out;
+        }
+
+        req->status = nvme_e2e_check(ns, ctx->data.bounce, ctx->data.iov.size,
+                                     ctx->mdata.bounce, ctx->mdata.iov.size,
+                                     ctrl, slba, apptag, appmask, reftag);
+    }
+
+out:
+    qemu_iovec_destroy(&ctx->data.iov);
+    g_free(ctx->data.bounce);
+
+    qemu_iovec_destroy(&ctx->mdata.iov);
+    g_free(ctx->mdata.bounce);
+
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+
+static void nvme_verify_mdata_in_cb(void *opaque, int ret)
+{
+    struct nvme_bounce_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    size_t mlen = nvme_m2b(ns, nlb);
+    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    BlockBackend *blk = ns->blkconf.blk;
+
+    trace_pci_nvme_verify_mdata_in_cb(nvme_cid(req), blk_name(blk));
+
+    if (ret) {
+        goto out;
+    }
+
+    ctx->mdata.bounce = g_malloc(mlen);
+
+    qemu_iovec_reset(&ctx->mdata.iov);
+    qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
+
+    req->aiocb = blk_aio_preadv(blk, offset, &ctx->mdata.iov, 0,
+                                nvme_verify_cb, ctx);
+    return;
+
+out:
+    nvme_verify_cb(ctx, ret);
+}
+
 static void nvme_e2e_rw_mdata_in_cb(void *opaque, int ret)
 {
     struct nvme_bounce_ctx *ctx = opaque;
@@ -2752,6 +2839,62 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    size_t len = nvme_l2b(ns, nlb);
+    int64_t offset = nvme_l2b(ns, slba);
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    struct nvme_bounce_ctx *ctx = NULL;
+    uint16_t status;
+
+    trace_pci_nvme_verify(nvme_cid(req), nvme_nsid(ns), slba, nlb);
+
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+        if (status) {
+            return status;
+        }
+
+        if (ctrl & NVME_RW_PRINFO_PRACT) {
+            return NVME_INVALID_PROT_INFO | NVME_DNR;
+        }
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
+    ctx = g_new0(struct nvme_bounce_ctx, 1);
+    ctx->req = req;
+
+    ctx->data.bounce = g_malloc(len);
+
+    qemu_iovec_init(&ctx->data.iov, 1);
+    qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, len);
+
+    block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
+                     BLOCK_ACCT_READ);
+
+    req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+                                nvme_verify_mdata_in_cb, ctx);
+    return NVME_NO_COMPLETE;
+}
+
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -3934,6 +4077,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_compare(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
+    case NVME_CMD_VERIFY:
+        return nvme_verify(n, req);
     case NVME_CMD_COPY:
         return nvme_copy(n, req);
     case NVME_CMD_ZONE_MGMT_SEND:
@@ -6045,7 +6190,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY |
+                           NVME_ONCS_VERIFY);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 243b0857b3d9..b5189aa88b85 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -59,6 +59,9 @@ pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"P
 pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
 pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_verify(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_verify_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_verify_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
 pci_nvme_rw_complete_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
-- 
2.30.0


