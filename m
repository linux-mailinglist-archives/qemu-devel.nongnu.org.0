Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0905329C67
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:24:52 +0100 (CET)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH391-0008WB-U5
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vU-0006de-GK; Tue, 02 Mar 2021 06:10:52 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vS-0007In-D6; Tue, 02 Mar 2021 06:10:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A127B5C0176;
 Tue,  2 Mar 2021 06:10:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 06:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=MOwPSj56kJY4y
 s0jgX8/bepqCln2LFFecpGG7QyJacw=; b=miO3ik6RtQIY+cKHMNBzZ+D8ldLvG
 VBQ0my2U8mDGmXJHviS/4hw4fIEugVxfKzzPujA6EljKuucO75+I6T1S2Z3b5Mv+
 olhGwvtJ0EovDKFj405AarXehFgQIpYOXl9YC7bBSFlV2v7CE0TK25W8Lk7VIIwm
 DotlXi/FNuwlM984vSo5Eta1qrj/20pgxUxdZTe1YNnYqHmM1/cnQyiZZvZ1MOEQ
 K0ALD8j8AJgGkI4vBtWHQeNibhj/U+n/YP8WmFijUjXCnRz5fCsz/OABsReCM77S
 GkCzQBhpAzWAHc1kL0rERzzNB0fcBdDX7ldp/hIiuPz8jDZ4/03gPHiQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=MOwPSj56kJY4ys0jgX8/bepqCln2LFFecpGG7QyJacw=; b=TuqzpyzV
 q/MEfCMK0mwUOgBydEUHh0fVWDH3ARbunV0XBPYF7GjlFpjEJDCP7M5WROB6E9PO
 GhAIq6+nKTTBSaoiUvXWCxBzYwQfcvuu8v4AcAK1auyuUv+FfPXws20jVZKihUzK
 HLHCDa5SCYI3OPkZntwtYJDeBwNwtFInIPnZ1/vBOkMt3CSCSbFZhasL6ohBJAhX
 zUJ7xB0m4y6Dq6HnWW3OA6IIKjcHivbh19RiqBU7UMvKetrlKbyo593+HrKAJOv3
 LEc9fhnTw9gYNwNp9kSSWe+qPMycWQcJYLZoNPckCuQ1XvcXxZCj3zymAT3J31HU
 sKtfYmhIU9vJKw==
X-ME-Sender: <xms:OR0-YEgbc5GgnErL58zKBmreXZeCzYTWA9-9rOH3do4O7vn8fCNgzg>
 <xme:OR0-YNBp2zZjW-vcXLEJymKWfP7kHxwhKU_oF2u43hDm3plNIv_4g5T1FHmuo_Mor
 _8PgcnUl6tLzHbV5cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OR0-YMFFnV9gytOjcwU-YYZU_qXhGE_hN6EpLYfC5Mz1-fAqiOYUtg>
 <xmx:OR0-YFSFcfM4lA1P2mpFB465UneknYNtt0cANXaOzJ1Ycbi7cq2CqQ>
 <xmx:OR0-YBwB06KrX1uBSR9TGcMe9dJD1xlId6gcVpOTsa16IkTFHz9q-Q>
 <xmx:OR0-YEo2BlkUVQ8oXBiMtWrsCWlgcxIgVhFXYmb8qWV3unV7ECtjSA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78A1C1080054;
 Tue,  2 Mar 2021 06:10:48 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 4/4] hw/block/nvme: convert zone reset to aiocb
Date: Tue,  2 Mar 2021 12:10:40 +0100
Message-Id: <20210302111040.289244-5-its@irrelevant.dk>
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

Convert zone reset from ad-hoc multi aio tracking to use standard QEMU
AIOCB processing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 233 +++++++++++++++++++++++++++++-------------------
 1 file changed, 139 insertions(+), 94 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 773b41527c79..0d067f186ed7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1325,6 +1325,29 @@ static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
     }
 }
 
+static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
+{
+    switch (nvme_get_zone_state(zone)) {
+    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fallthrough */
+    case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fallthrough */
+    case NVME_ZONE_STATE_FULL:
+        zone->w_ptr = zone->d.zslba;
+        zone->d.wp = zone->w_ptr;
+        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
+        /* fallthrough */
+    case NVME_ZONE_STATE_EMPTY:
+        return NVME_SUCCESS;
+
+    default:
+        return NVME_ZONE_INVAL_TRANSITION;
+    }
+}
+
 static void nvme_zrm_auto_transition_zone(NvmeNamespace *ns)
 {
     NvmeZone *zone;
@@ -1472,53 +1495,6 @@ static void nvme_misc_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
-struct nvme_zone_reset_ctx {
-    NvmeRequest *req;
-    NvmeZone    *zone;
-};
-
-static void nvme_aio_zone_reset_cb(void *opaque, int ret)
-{
-    struct nvme_zone_reset_ctx *ctx = opaque;
-    NvmeRequest *req = ctx->req;
-    NvmeNamespace *ns = req->ns;
-    NvmeZone *zone = ctx->zone;
-    uintptr_t *resets = (uintptr_t *)&req->opaque;
-
-    g_free(ctx);
-
-    trace_pci_nvme_aio_zone_reset_cb(nvme_cid(req), zone->d.zslba);
-
-    if (!ret) {
-        switch (nvme_get_zone_state(zone)) {
-        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-            nvme_aor_dec_open(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_CLOSED:
-            nvme_aor_dec_active(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_FULL:
-            zone->w_ptr = zone->d.zslba;
-            zone->d.wp = zone->w_ptr;
-            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
-            /* fall through */
-        default:
-            break;
-        }
-    } else {
-        nvme_aio_err(req, ret);
-    }
-
-    (*resets)--;
-
-    if (*resets) {
-        return;
-    }
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
@@ -2336,41 +2312,6 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
     return nvme_zrm_finish(ns, zone);
 }
 
-static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                NvmeZoneState state, NvmeRequest *req)
-{
-    uintptr_t *resets = (uintptr_t *)&req->opaque;
-    struct nvme_zone_reset_ctx *ctx;
-
-    switch (state) {
-    case NVME_ZONE_STATE_EMPTY:
-        return NVME_SUCCESS;
-    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-    case NVME_ZONE_STATE_CLOSED:
-    case NVME_ZONE_STATE_FULL:
-        break;
-    default:
-        return NVME_ZONE_INVAL_TRANSITION;
-    }
-
-    /*
-     * The zone reset aio callback needs to know the zone that is being reset
-     * in order to transition the zone on completion.
-     */
-    ctx = g_new(struct nvme_zone_reset_ctx, 1);
-    ctx->req = req;
-    ctx->zone = zone;
-
-    (*resets)++;
-
-    blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_l2b(ns, zone->d.zslba),
-                          nvme_l2b(ns, ns->zone_size), BDRV_REQ_MAY_UNMAP,
-                          nvme_aio_zone_reset_cb, ctx);
-
-    return NVME_NO_COMPLETE;
-}
-
 static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
                                   NvmeZoneState state, NvmeRequest *req)
 {
@@ -2499,12 +2440,115 @@ out:
     return status;
 }
 
+typedef struct NvmeZoneResetAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    bool all;
+
+    struct {
+        int idx;
+        NvmeZone *zone;
+    } curr;
+} NvmeZoneResetAIOCB;
+
+static void nvme_zone_reset_cancel(BlockAIOCB *aiocb)
+{
+    NvmeZoneResetAIOCB *iocb = container_of(aiocb, NvmeZoneResetAIOCB, common);
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+
+    iocb->curr.idx = ns->num_zones;
+
+    iocb->ret = -ECANCELED;
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
+    }
+}
+
+static const AIOCBInfo nvme_zone_reset_aiocb_info = {
+    .aiocb_size = sizeof(NvmeZoneResetAIOCB),
+    .cancel_async = nvme_zone_reset_cancel,
+};
+
+static void nvme_zone_reset_bh(void *opaque)
+{
+    NvmeZoneResetAIOCB *iocb = opaque;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
+}
+
+static void nvme_zone_reset_aio_cb(void *opaque, int ret)
+{
+    NvmeZoneResetAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    if (iocb->curr.zone) {
+        nvme_zrm_reset(ns, iocb->curr.zone);
+
+        if (!iocb->all) {
+            goto done;
+        }
+    }
+
+    while (iocb->curr.idx < ns->num_zones) {
+        NvmeZone *zone = &ns->zone_array[iocb->curr.idx++];
+
+        switch (nvme_get_zone_state(zone)) {
+        case NVME_ZONE_STATE_EMPTY:
+            if (!iocb->all) {
+                goto done;
+            }
+
+            continue;
+
+        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        case NVME_ZONE_STATE_CLOSED:
+        case NVME_ZONE_STATE_FULL:
+            iocb->curr.zone = zone;
+            break;
+
+        default:
+            continue;
+        }
+
+        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk,
+                                            nvme_l2b(ns, zone->d.zslba),
+                                            nvme_l2b(ns, ns->zone_size),
+                                            BDRV_REQ_MAY_UNMAP,
+                                            nvme_zone_reset_aio_cb, iocb);
+        return;
+    }
+
+done:
+    iocb->aiocb = NULL;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
+}
+
 static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeZone *zone;
-    uintptr_t *resets;
+    NvmeZoneResetAIOCB *iocb;
     uint8_t *zd_ext;
     uint32_t dw13 = le32_to_cpu(cmd->cdw13);
     uint64_t slba = 0;
@@ -2515,7 +2559,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     enum NvmeZoneProcessingMask proc_mask = NVME_PROC_CURRENT_ZONE;
 
     action = dw13 & 0xff;
-    all = dw13 & 0x100;
+    all = !!(dw13 & 0x100);
 
     req->status = NVME_SUCCESS;
 
@@ -2559,21 +2603,22 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
         break;
 
     case NVME_ZONE_ACTION_RESET:
-        resets = (uintptr_t *)&req->opaque;
-
-        if (all) {
-            proc_mask = NVME_PROC_OPENED_ZONES | NVME_PROC_CLOSED_ZONES |
-                NVME_PROC_FULL_ZONES;
-        }
         trace_pci_nvme_reset_zone(slba, zone_idx, all);
 
-        *resets = 1;
+        iocb = blk_aio_get(&nvme_zone_reset_aiocb_info, ns->blkconf.blk,
+                           nvme_misc_cb, req);
 
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_reset_zone, req);
+        iocb->req = req;
+        iocb->bh = qemu_bh_new(nvme_zone_reset_bh, iocb);
+        iocb->ret = 0;
+        iocb->all = all;
+        iocb->curr.idx = zone_idx;
+        iocb->curr.zone = NULL;
 
-        (*resets)--;
+        nvme_zone_reset_aio_cb(iocb, 0);
+        req->aiocb = &iocb->common;
 
-        return *resets ? NVME_NO_COMPLETE : req->status;
+        return NVME_NO_COMPLETE;
 
     case NVME_ZONE_ACTION_OFFLINE:
         if (all) {
-- 
2.30.1


