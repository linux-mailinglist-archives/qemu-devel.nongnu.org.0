Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0837329C0C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:22:30 +0100 (CET)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH36j-0005fK-QE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vS-0006Yz-6J; Tue, 02 Mar 2021 06:10:50 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vP-0007Hy-HF; Tue, 02 Mar 2021 06:10:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D17CE5C0181;
 Tue,  2 Mar 2021 06:10:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 06:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=eriUzmsaVkfoz
 ek47QFSs22AoXxj4Tuh5gCifVLfnq4=; b=vt4MlVCaJWr3jvjZsuld6TO/CWDo/
 ZeU+YaYgqAoNfZNy8pzQj+IvaAP4x5ZyHi13okF6e82eCx0QU1zZWqXbleDQsVqi
 suHC4MYJ30vXU0DG5JYMsmBuQuRe7Mqdm9sSzE4gOvfjLS753FAHPNEW3T4x3BoB
 yeSi7Y0EFODmAWOUsUKQXtExS3bj4o7uOa38Q/hXvop5ihKQJBAl1PV3+iD9HKUU
 KphYrHVkHUSZ/ZRPbsji292O3gf1cog1MJH7/hjHQEGTnPz7JS2Xx/MeK9Se38+w
 qYP2pL2YQLuUPHeWfN7+dTuI3c0boYytNe5n2dExtKjizs/wWCw538Xlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=eriUzmsaVkfozek47QFSs22AoXxj4Tuh5gCifVLfnq4=; b=thr9qg8H
 lxAwsL85qM2hDnnb+eIfxwcq3h/u2tHOEzVJmQz+160lDrQyI5xkIOMyb/7/nU/i
 2M/4PW5km3i1VT0n0D+SONuSfm1dxeq6oaCFYRQQjudWq1jGTjMHIUHj7lwpXXsj
 f7F4+14prbVtTPG6sGbh/RpBLmvd+e6YV5EgalO4lKHRKcbrXLCqTqa30tVm9Tzx
 9EsmLZxzvz/HC4kRuwjZO0073qW05ri8cqPBBKJlT9hhukb15+MlWLFi47lcSvQh
 ob7JpHCe4nbD09PV9Jf8lxw9OR/NpTV3st9QxHZkiEbLrYD0kMrxK6wBKgsru/f/
 qWqHMumV8u16IA==
X-ME-Sender: <xms:NR0-YCSs1tj0SwGPUpcria1zLa-PQ3sF-yvjQCXwZ9_Eyfx_J2BSLA>
 <xme:NR0-YHy_NWOgMbZbEEcOOfPFDUfh1mUV_tepFx1gEFTr45sopGBPluoiaAmM4b4dE
 zKOhAjncULRqDgpxpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NR0-YP1HnI18zC0OcLo92vq6s_V4EQm6EvEVTgQ5XvK99_DLHwthKg>
 <xmx:NR0-YOBgV7z5X32fSUdnDQLSEFLomV1uG_L8kCsAQzQfAzIqxYEyCQ>
 <xmx:NR0-YLhDAX1N6zuKtd5mL0xz60DRFNEU1Hkar9UXrjUNbgrk08-l4A>
 <xmx:NR0-YBb8BjbhwMCr_J4q0aP7t_c0FvIRCF2OlgaxJaqv6VkDYD8cYg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B474A1080054;
 Tue,  2 Mar 2021 06:10:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/4] hw/block/nvme: convert dsm to aiocb
Date: Tue,  2 Mar 2021 12:10:37 +0100
Message-Id: <20210302111040.289244-2-its@irrelevant.dk>
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

Convert dataset management from ad-hoc multi aio tracking to use
standard QEMU AIOCB processing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 187 ++++++++++++++++++++++++++++--------------
 hw/block/trace-events |   2 +-
 2 files changed, 125 insertions(+), 64 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 54c87c8f5fe3..8830d72b959f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1494,23 +1494,16 @@ static void nvme_aio_flush_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
-static void nvme_aio_discard_cb(void *opaque, int ret)
+static void nvme_misc_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
-    uintptr_t *discards = (uintptr_t *)&req->opaque;
 
-    trace_pci_nvme_aio_discard_cb(nvme_cid(req));
+    trace_pci_nvme_misc_cb(nvme_cid(req));
 
     if (ret) {
         nvme_aio_err(req, ret);
     }
 
-    (*discards)--;
-
-    if (*discards) {
-        return;
-    }
-
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
@@ -1736,78 +1729,146 @@ out:
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
+    int nr;
+    struct {
+        int64_t offset;
+        size_t  len;
+        int     idx;
+    } curr;
+} NvmeDSMAIOCB;
+
+static void nvme_dsm_cancel(BlockAIOCB *aiocb)
+{
+    NvmeDSMAIOCB *iocb = container_of(aiocb, NvmeDSMAIOCB, common);
+
+    /* break loop */
+    iocb->curr.len = 0;
+    iocb->curr.idx = iocb->nr;
+
+    iocb->ret = -ECANCELED;
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
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
+static void nvme_dsm_aio_cb(void *opaque, int ret)
+{
+    NvmeDSMAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeNamespace *ns = req->ns;
+    NvmeDsmRange *range;
+    uint64_t slba;
+    uint32_t nlb;
+    size_t bytes;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    if (iocb->curr.len == 0) {
+next:
+        if (iocb->curr.idx == iocb->nr) {
+            goto done;
+        }
+
+        range = &iocb->range[iocb->curr.idx++];
+        slba = le64_to_cpu(range->slba);
+        nlb = le32_to_cpu(range->nlb);
+
+        trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
+                                      nlb);
+
+        if (nlb > n->dmrsl) {
+            trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
+        }
+
+        if (nvme_check_bounds(ns, slba, nlb)) {
+            trace_pci_nvme_err_invalid_lba_range(slba, nlb,
+                                                 ns->id_ns.nsze);
+            goto next;
+        }
+
+        iocb->curr.offset = nvme_l2b(ns, slba);
+        iocb->curr.len = nvme_l2b(ns, nlb);
+    }
+
+    bytes = MIN(BDRV_REQUEST_MAX_BYTES, iocb->curr.len);
+
+    iocb->aiocb = blk_aio_pdiscard(ns->blkconf.blk, iocb->curr.offset, bytes,
+                                   nvme_dsm_aio_cb, iocb);
+
+    iocb->curr.offset += bytes;
+    iocb->curr.len -= bytes;
+
+    return;
+
+done:
+    iocb->aiocb = NULL;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
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
 
     trace_pci_nvme_dsm(nvme_cid(req), nvme_nsid(ns), nr, attr);
 
     if (attr & NVME_DSMGMT_AD) {
-        int64_t offset;
-        size_t len;
-        NvmeDsmRange range[nr];
-        uintptr_t *discards = (uintptr_t *)&req->opaque;
+        NvmeDSMAIOCB *iocb = blk_aio_get(&nvme_dsm_aiocb_info, ns->blkconf.blk,
+                                         nvme_misc_cb, req);
 
-        status = nvme_dma(n, (uint8_t *)range, sizeof(range),
+        iocb->req = req;
+        iocb->bh = qemu_bh_new(nvme_dsm_bh, iocb);
+        iocb->ret = 0;
+        iocb->range = g_new(NvmeDsmRange, nr);
+        iocb->nr = nr;
+        iocb->curr.len = 0;
+        iocb->curr.idx = 0;
+
+        status = nvme_dma(n, (uint8_t *)iocb->range, sizeof(NvmeDsmRange) * nr,
                           DMA_DIRECTION_TO_DEVICE, req);
         if (status) {
             return status;
         }
 
-        /*
-         * AIO callbacks may be called immediately, so initialize discards to 1
-         * to make sure the the callback does not complete the request before
-         * all discards have been issued.
-         */
-        *discards = 1;
+        nvme_dsm_aio_cb(iocb, 0);
+        req->aiocb = &iocb->common;
 
-        for (int i = 0; i < nr; i++) {
-            uint64_t slba = le64_to_cpu(range[i].slba);
-            uint32_t nlb = le32_to_cpu(range[i].nlb);
-
-            if (nvme_check_bounds(ns, slba, nlb)) {
-                trace_pci_nvme_err_invalid_lba_range(slba, nlb,
-                                                     ns->id_ns.nsze);
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
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 8deeacc8c35c..0e5bddbdd48b 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -54,7 +54,7 @@ pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb
 pci_nvme_dsm_single_range_limit_exceeded(uint32_t nlb, uint32_t dmrsl) "nlb %"PRIu32" dmrsl %"PRIu32""
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_misc_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
 pci_nvme_aio_flush_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-- 
2.30.1


