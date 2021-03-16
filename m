Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E238F33E111
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:03:44 +0100 (CET)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHmw-0001Z5-3b
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXv-00071E-K8; Tue, 16 Mar 2021 17:48:11 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:54293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXr-0000xP-Ie; Tue, 16 Mar 2021 17:48:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C5FD2580A76;
 Tue, 16 Mar 2021 17:48:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Mar 2021 17:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=W7fOFU7TnGXUq
 bdMIdegDguw6DvoBIz2eqDxiNMSaB4=; b=zmPYoo8xN3aC/PEFQ1SLCDmNdvUB9
 zxluhhDkdWf9KvK5zDX4tIDsP6/XfjhgECIg7+B/zFdJPKkDj+FHHoBGbYLjVFOD
 eJjUkqA4n/v/ijmzSpoJZYSGiMnflg+WXG2K1Y4Bgxv8Al7tghRbnZKVifamZs1T
 48ATkWZGWlt6wxFrTDi0F8Y3hPV0FtWCbOb0TEjLuhbR75QWdd8NUMAqVZz86T+9
 Z+jBPgFA2oujNX57wSQelsBnnM86S05O+PHjGx07cYrEyrbAaNgpE3feHQ/kaBVt
 X4tC/W2q9Jgyloh4YbxWAv6NIkRO2MEhTgy4kDVRF3XjymX3FBBOTvYdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=W7fOFU7TnGXUqbdMIdegDguw6DvoBIz2eqDxiNMSaB4=; b=ogslMyg6
 Li1bDj2mUVtoPGnJLA1rcmsyV2od6nkrXV/Li0UT2N1F7GClRgBlhGNZd9pjaQYx
 l+sxO4XPooPkCURvXIbFjEwlwft9fItriJbYJ7I4rv+inYADKr6DuBHryleXX/tU
 HspR3IMBl4E0Hy3ECzxoEOLmkPkXMpQ+oNEwbkuJq5oXdV0yoR3IbyoWsXN9v66q
 6WmWaTbg+JlGvCblQfJieNRcoVg7XH4OJR7aspJTFjwEZfObss8DRl+DqLuuYuhj
 wWAm+hUx7ffsR1bqzR8whe0xlKktzx3Ukv9IZ5twqiaSbFSbS1c8Qwr6BsSKJ6Ok
 TYlhW+LEth1g9g==
X-ME-Sender: <xms:lidRYJFLWeLnTT9rtRpbMlc-zn_aXGsNw1hQLWlju6E0p6QQvjt4iw>
 <xme:lidRYOzlPzXALsm6SYv06JBdXkQOIwIucHPd3WlHeXAzYOwDB2LZFGqQFcHEqvcYf
 -BxnlylXfAsf2xbzVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lidRYK5dOhPq-o3iL3xnleZvow1p-zID0E1cSH97QY_4CVEF1ZNEVQ>
 <xmx:lidRYLcG_jbTVCd1vYE_c3C5EaJOYg6maE5Q1e6ys7jbz5Ps4-KPlQ>
 <xmx:lidRYJFQkKEMXnVaIAqbbqiBiUNVjp-HwwWI89PCO-z_cAPMSfRYzg>
 <xmx:lidRYBmLfNGpl2YVZEf7EPFgvIJuanm76MQ2lXGnvYLsE1pR1u4HYA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5915C108005C;
 Tue, 16 Mar 2021 17:48:05 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/11] hw/block/nvme: add verify command
Date: Tue, 16 Mar 2021 22:47:48 +0100
Message-Id: <20210316214753.399389-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

See NVM Express 1.4, section 6.14 ("Verify Command").

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: rebased, refactored for e2e]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-dif.h   |   2 +
 hw/block/nvme.h       |   1 +
 include/block/nvme.h  |   2 +
 hw/block/nvme-dif.c   |   4 +-
 hw/block/nvme.c       | 147 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   3 +
 6 files changed, 156 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme-dif.h b/hw/block/nvme-dif.h
index 793829782c9d..5a8e37c8525b 100644
--- a/hw/block/nvme-dif.h
+++ b/hw/block/nvme-dif.h
@@ -39,6 +39,8 @@ static const uint16_t t10_dif_crc_table[256] = {
 
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
                            uint32_t reftag);
+uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
+                               uint64_t slba);
 void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint8_t *mbuf, size_t mlen, uint16_t apptag,
                                  uint32_t reftag);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 115d0177654d..11c7fcc317da 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -98,6 +98,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_VERIFY:           return "NVME_NVM_CMD_VERIFY";
     case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
     case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
     case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 288038dc9562..ba757b32dbb7 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -580,6 +580,7 @@ enum NvmeIoCommands {
     NVME_CMD_COMPARE            = 0x05,
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
+    NVME_CMD_VERIFY             = 0x0c,
     NVME_CMD_COPY               = 0x19,
     NVME_CMD_ZONE_MGMT_SEND     = 0x79,
     NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
@@ -1084,6 +1085,7 @@ enum NvmeIdCtrlOncs {
     NVME_ONCS_FEATURES      = 1 << 4,
     NVME_ONCS_RESRVATIONS   = 1 << 5,
     NVME_ONCS_TIMESTAMP     = 1 << 6,
+    NVME_ONCS_VERIFY        = 1 << 7,
     NVME_ONCS_COPY          = 1 << 8,
 };
 
diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index 1b628dead715..2038d724bda5 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -162,8 +162,8 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf,
-                                      size_t mlen, uint64_t slba)
+uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
+                               uint64_t slba)
 {
     BlockBackend *blk = ns->blkconf.blk;
     BlockDriverState *bs = blk_bs(blk);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7af651dc306f..d754bd8e0440 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -208,6 +208,7 @@ static const uint32_t nvme_cse_iocs_nvm[256] = {
     [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_VERIFY]               = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
 };
@@ -218,6 +219,7 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
     [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_VERIFY]               = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_ZONE_APPEND]          = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
@@ -1884,6 +1886,90 @@ static void nvme_aio_flush_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static void nvme_verify_cb(void *opaque, int ret)
+{
+    NvmeBounceContext *ctx = opaque;
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
+        status = nvme_dif_mangle_mdata(ns, ctx->mdata.bounce,
+                                       ctx->mdata.iov.size, slba);
+        if (status) {
+            req->status = status;
+            goto out;
+        }
+
+        req->status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
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
+    NvmeBounceContext *ctx = opaque;
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
 static void nvme_aio_discard_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -2431,6 +2517,62 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
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
+    NvmeBounceContext *ctx = NULL;
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
+    ctx = g_new0(NvmeBounceContext, 1);
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
@@ -3449,6 +3591,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_compare(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
+    case NVME_CMD_VERIFY:
+        return nvme_verify(n, req);
     case NVME_CMD_COPY:
         return nvme_copy(n, req);
     case NVME_CMD_ZONE_MGMT_SEND:
@@ -5770,7 +5914,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY |
+                           NVME_ONCS_VERIFY);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
diff --git a/hw/block/trace-events b/hw/block/trace-events
index fc243d0b4624..72114a5946fc 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -60,6 +60,9 @@ pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"P
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
2.30.1


