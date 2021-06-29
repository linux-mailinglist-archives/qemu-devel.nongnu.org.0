Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23E3B783A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:05:40 +0200 (CEST)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ3D-0001RL-DT
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImh-0001Xb-NG; Tue, 29 Jun 2021 14:48:35 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIma-0005Ro-MJ; Tue, 29 Jun 2021 14:48:35 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 0818D2B00AB4;
 Tue, 29 Jun 2021 14:48:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 29 Jun 2021 14:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4CFoEZVyb/V4H
 oQkhoYdG1/htmg9DBlSw+HlnsC+bSA=; b=Xm3dGhqLvQ7/0iY1+fKDYdrrRza1e
 t6fMJtYeQEs4ecuEbXN2jhR6io3Ppg+P1C+5vJSsIGem7amkLGyI0Pn5s01rJJMi
 9ZEgtwrYxM12ozW9arizvN3cpGnJsrOjBrheSAHylwo4J6/LBF7sW+Si8T3NGinK
 /hehB0NXfU0k3MMdQjbxDozTA3B+/uc33XobcE1eH83buD04JCKDQ3dVKpLbI9fX
 qt6e71ZXvHRr31iyp9U2k6ikRyLN9ZlNxFyleGZQuXoWlNSsaw2mDk9FaWhT2JCd
 prI/OJlgbbBbombPdjiaeVZz/4tI5FN2LU2YUZ3hd7rLUMBZ/dFRs9Svw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4CFoEZVyb/V4HoQkhoYdG1/htmg9DBlSw+HlnsC+bSA=; b=dy2q9K2G
 ssEmFJK6vDijrse/kTIxE1on2JD142f5QdANM39jY+Frm4Q8P+nfXEYQbMCnU2Dp
 oHRGR97Sj0zMsOvpxM6ofD/9CyULrNeOD6WtDsARtuA/Rw7hEEUtgQMpUs7mgz/1
 yByJ5PHommfZpa6mm0cR/BX51X3c3aIy1/rdZn0XsLKaMBp+nGjGNX0PBU1qGZox
 7BcLoH0AuA6zgd9/eGoygPdMPbpu6gMPNghGrH9hOLCGV0p3ZpfDFJ0LYaeeoX5N
 +tkAc3yfhNZZPZYKCuPp0I5cWxQvsgC0ZEoKvJPj5bAuqG4aN8IGIk4vF96XjilA
 WX2t9zAUsG5Bpg==
X-ME-Sender: <xms:-GrbYByoaSs0_7XLOiN_Gx5aFlqhojMRSKAehKgEyedDodfNR4jSCQ>
 <xme:-GrbYBTYy_LjsFVtrvu_zrgF--hgpsysc_FuzT5Far4b7-cvoTAl6KHcWO4OIIcxS
 FGbxq2ax7dcHzoqf6Q>
X-ME-Received: <xmr:-GrbYLVQvQbxpRXdy5DewnZB6vYZbC0MX4tFclpy3kXCi7lil7-nffM3UoLzf4ERQEi2pZAwAGpj2pQT8jn0wRzWGLtfDrzKXmeNUM59eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-GrbYDhn3ZaDRFZcFyuAvcEbip-sUZxwtltrax_jOdTQUhsWTOpPlA>
 <xmx:-GrbYDAH5Rpv0lqD_WdONcEmZd7yNrKBuQM8FcDreVsPBEYMk920GQ>
 <xmx:-GrbYMLLH_lBQVP0cl2fKaDMEdfsEVdMNbXoo8qyp4Wmfs1uULwvsw>
 <xmx:-GrbYH7FW3A82Vtd7uI8Uaf83e0n-unK16kbPZf6JSXcE7ViglOBCMLhCHc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:22 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/23] hw/nvme: reimplement dsm to allow cancellation
Date: Tue, 29 Jun 2021 20:47:30 +0200
Message-Id: <20210629184743.230173-11-its@irrelevant.dk>
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

Prior to this patch, a loop was used to issue multiple "fire and forget"
aios for each range in the command. Without a reference to the aiocb
returned from the blk_aio_pdiscard calls, the aios cannot be canceled.

Fix this by processing the ranges one after another.

As a bonus, this fixes how metadata is cleared (i.e. we only zero it out
if the data was succesfully discarded).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c       | 233 +++++++++++++++++++++++++++++--------------
 hw/nvme/trace-events |   4 +-
 2 files changed, 162 insertions(+), 75 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5777c7ea1704..bb9ee9361554 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2015,26 +2015,6 @@ out:
     nvme_verify_cb(ctx, ret);
 }
 
-static void nvme_aio_discard_cb(void *opaque, int ret)
-{
-    NvmeRequest *req = opaque;
-    uintptr_t *discards = (uintptr_t *)&req->opaque;
-
-    trace_pci_nvme_aio_discard_cb(nvme_cid(req));
-
-    if (ret) {
-        nvme_aio_err(req, ret);
-    }
-
-    (*discards)--;
-
-    if (*discards) {
-        return;
-    }
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
 struct nvme_zone_reset_ctx {
     NvmeRequest *req;
     NvmeZone    *zone;
@@ -2495,75 +2475,182 @@ out:
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+typedef struct NvmeDSMAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    NvmeDsmRange *range;
+    unsigned int nr;
+    unsigned int idx;
+} NvmeDSMAIOCB;
+
+static void nvme_dsm_cancel(BlockAIOCB *aiocb)
+{
+    NvmeDSMAIOCB *iocb = container_of(aiocb, NvmeDSMAIOCB, common);
+
+    /* break nvme_dsm_cb loop */
+    iocb->idx = iocb->nr;
+    iocb->ret = -ECANCELED;
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
+    } else {
+        /*
+         * We only reach this if nvme_dsm_cancel() has already been called or
+         * the command ran to completion and nvme_dsm_bh is scheduled to run.
+         */
+        assert(iocb->idx == iocb->nr);
+    }
+}
+
+static const AIOCBInfo nvme_dsm_aiocb_info = {
+    .aiocb_size   = sizeof(NvmeDSMAIOCB),
+    .cancel_async = nvme_dsm_cancel,
+};
+
+static void nvme_dsm_bh(void *opaque)
+{
+    NvmeDSMAIOCB *iocb = opaque;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
+}
+
+static void nvme_dsm_cb(void *opaque, int ret);
+
+static void nvme_dsm_md_cb(void *opaque, int ret)
+{
+    NvmeDSMAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeDsmRange *range;
+    uint64_t slba;
+    uint32_t nlb;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    if (!ns->lbaf.ms) {
+        nvme_dsm_cb(iocb, 0);
+        return;
+    }
+
+    range = &iocb->range[iocb->idx - 1];
+    slba = le64_to_cpu(range->slba);
+    nlb = le32_to_cpu(range->nlb);
+
+    /*
+     * Check that all block were discarded (zeroed); otherwise we do not zero
+     * the metadata.
+     */
+
+    ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_ZERO);
+    if (ret) {
+        if (ret < 0) {
+            iocb->ret = ret;
+            goto done;
+        }
+
+        nvme_dsm_cb(iocb, 0);
+    }
+
+    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
+                                        nvme_m2b(ns, nlb), BDRV_REQ_MAY_UNMAP,
+                                        nvme_dsm_cb, iocb);
+    return;
+
+done:
+    iocb->aiocb = NULL;
+    qemu_bh_schedule(iocb->bh);
+}
+
+static void nvme_dsm_cb(void *opaque, int ret)
+{
+    NvmeDSMAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeNamespace *ns = req->ns;
+    NvmeDsmRange *range;
+    uint64_t slba;
+    uint32_t nlb;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+next:
+    if (iocb->idx == iocb->nr) {
+        goto done;
+    }
+
+    range = &iocb->range[iocb->idx++];
+    slba = le64_to_cpu(range->slba);
+    nlb = le32_to_cpu(range->nlb);
+
+    trace_pci_nvme_dsm_deallocate(slba, nlb);
+
+    if (nlb > n->dmrsl) {
+        trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
+        goto next;
+    }
+
+    if (nvme_check_bounds(ns, slba, nlb)) {
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb,
+                                             ns->id_ns.nsze);
+        goto next;
+    }
+
+    iocb->aiocb = blk_aio_pdiscard(ns->blkconf.blk, nvme_l2b(ns, slba),
+                                   nvme_l2b(ns, nlb),
+                                   nvme_dsm_md_cb, iocb);
+    return;
+
+done:
+    iocb->aiocb = NULL;
+    qemu_bh_schedule(iocb->bh);
+}
+
 static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     NvmeDsmCmd *dsm = (NvmeDsmCmd *) &req->cmd;
-
     uint32_t attr = le32_to_cpu(dsm->attributes);
     uint32_t nr = (le32_to_cpu(dsm->nr) & 0xff) + 1;
-
     uint16_t status = NVME_SUCCESS;
 
-    trace_pci_nvme_dsm(nvme_cid(req), nvme_nsid(ns), nr, attr);
+    trace_pci_nvme_dsm(nr, attr);
 
     if (attr & NVME_DSMGMT_AD) {
-        int64_t offset;
-        size_t len;
-        NvmeDsmRange range[nr];
-        uintptr_t *discards = (uintptr_t *)&req->opaque;
+        NvmeDSMAIOCB *iocb = blk_aio_get(&nvme_dsm_aiocb_info, ns->blkconf.blk,
+                                         nvme_misc_cb, req);
 
-        status = nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
+        iocb->req = req;
+        iocb->bh = qemu_bh_new(nvme_dsm_bh, iocb);
+        iocb->ret = 0;
+        iocb->range = g_new(NvmeDsmRange, nr);
+        iocb->nr = nr;
+        iocb->idx = 0;
+
+        status = nvme_h2c(n, (uint8_t *)iocb->range, sizeof(NvmeDsmRange) * nr,
+                          req);
         if (status) {
             return status;
         }
 
-        /*
-         * AIO callbacks may be called immediately, so initialize discards to 1
-         * to make sure the the callback does not complete the request before
-         * all discards have been issued.
-         */
-        *discards = 1;
+        req->aiocb = &iocb->common;
+        nvme_dsm_cb(iocb, 0);
 
-        for (int i = 0; i < nr; i++) {
-            uint64_t slba = le64_to_cpu(range[i].slba);
-            uint32_t nlb = le32_to_cpu(range[i].nlb);
-
-            if (nvme_check_bounds(ns, slba, nlb)) {
-                continue;
-            }
-
-            trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
-                                          nlb);
-
-            if (nlb > n->dmrsl) {
-                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
-            }
-
-            offset = nvme_l2b(ns, slba);
-            len = nvme_l2b(ns, nlb);
-
-            while (len) {
-                size_t bytes = MIN(BDRV_REQUEST_MAX_BYTES, len);
-
-                (*discards)++;
-
-                blk_aio_pdiscard(ns->blkconf.blk, offset, bytes,
-                                 nvme_aio_discard_cb, req);
-
-                offset += bytes;
-                len -= bytes;
-            }
-        }
-
-        /* account for the 1-initialization */
-        (*discards)--;
-
-        if (*discards) {
-            status = NVME_NO_COMPLETE;
-        } else {
-            status = req->status;
-        }
+        return NVME_NO_COMPLETE;
     }
 
     return status;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ce6b6ffe9604..eea4e31e46c4 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -37,8 +37,8 @@ pci_nvme_verify_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" bl
 pci_nvme_verify_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
 pci_nvme_rw_complete_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
-pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
-pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
+pci_nvme_dsm(uint32_t nr, uint32_t attr) "nr %"PRIu32" attr 0x%"PRIx32""
+pci_nvme_dsm_deallocate(uint64_t slba, uint32_t nlb) "slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_dsm_single_range_limit_exceeded(uint32_t nlb, uint32_t dmrsl) "nlb %"PRIu32" dmrsl %"PRIu32""
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_compare_data_cb(uint16_t cid) "cid %"PRIu16""
-- 
2.32.0


