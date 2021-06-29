Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279C3B788F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:24:08 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJL5-0000A1-1i
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInJ-0001vS-1v; Tue, 29 Jun 2021 14:49:13 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:48739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInD-0005d8-9W; Tue, 29 Jun 2021 14:49:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 186A12B00AC4;
 Tue, 29 Jun 2021 14:48:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 29 Jun 2021 14:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0494d/++4VzA5
 DbaGQ8KSdD8G+do2aq1qBWXTv51y9s=; b=ajYA6x5DgAJibrKeCVpCFTZ0yk5E4
 bLcNU5GnoCZmOo0TwCK4U3w+nsp7HYSRvAHnnNpfmV39/TLTC2WRX5L5aIjYMq4o
 t8dWPHGK9Fz9q7bxOtMyAUYkwtDJGB48qDFOhmMtO9lLd4OgYvyKUkihn+JE78Ua
 iXiFytBc20eV7d8rcAOguF09AGbWQAJdiAamVqow+/DXVhdTL7+84+yQ9+/mBy43
 9WDZQTPGHdhZzTNiNo9Txn0pzmHW2V6+HxzNFfx3drDiwbWSkF8o3yHi56QZNgJ7
 nSNHNc24UDHUDX3yvTCkBiUQfP0SX3Tc7RuOEoMWan3SchbOnuRtUcwfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0494d/++4VzA5DbaGQ8KSdD8G+do2aq1qBWXTv51y9s=; b=mDlftN+q
 sMABwmNSLy7uD+GZXqtn7Jc2Y+PgK01MWIdpo/VttIRfl8mHoWu09N4/qB07Mg9+
 Q0qoKZ0kWKWsNs7s9m+SYJ0D4+UaPGWJWikSRVM5Aik1uoFNTuqG13+NX60Y2zAI
 UmDAlbYeLJCIZovOR92BKly1VxdWGytH8UcOI8YNNP5xZ2aYZP8FFn0xNyv4mMuK
 +IUbtkzsaNBw/sfKNWxGjb1Y7gRQJAKluXAX0n+B0VJi+qC2Bfr0TZ8J4jA+Ri/l
 C3tpys4OuaYUXyTVrHnj+UpMIScpZSmtuEKjyVBW8o0f/yopNwMbYdjnUQfoKy5t
 HJkU3qcr7uil9w==
X-ME-Sender: <xms:C2vbYHvme9mzDkL-E87GoWRIZFVxxbiHoMUCau8424uQpYsbo3a3Mw>
 <xme:C2vbYIfALVbhgn-kSICnWPE0xmMGpxsUZWVMwL9448FliQ2Za9x5xhKnsGREJOwsM
 r89-iRiYjAdsMmXx4c>
X-ME-Received: <xmr:C2vbYKybSFLErWOPTBTDTGFeXGEyE1OLnCfYaGNwcVYnIrhhN8qw3DPHEYBpKfchvxnTYDw5Peo8nXBQzcmDfVhYRi3Ti2bsEWm3EHWvlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:C2vbYGM8OjQqMaayejdedD8cSKC_U-pZQNrIMMSPdgJc7jtd5b81IQ>
 <xmx:C2vbYH9slFC-eZeL0VMTN5WEfAq5jDkTLh3VyA_Gkn2xOCATX76K5g>
 <xmx:C2vbYGXoplAJYEEp3ohjtJMVbcYYSSXhUgPl8N-eXGco1o-_vXO2cw>
 <xmx:DGvbYI0ce_hr3-7TWHe135NWmwTIpREWqgX2R1q_rGmE98aeEKSWhowB1Eg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:42 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/23] hw/nvme: reimplement zone reset to allow cancellation
Date: Tue, 29 Jun 2021 20:47:36 +0200
Message-Id: <20210629184743.230173-17-its@irrelevant.dk>
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

Prior to this patch, the aios associated with zone reset are submitted
anonymously (no reference saved to the aiocb from the blk_aio call).

Fix this by resetting the zones one after another, saving a reference to
the aiocb for each reset.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c       | 288 +++++++++++++++++++++++++------------------
 hw/nvme/trace-events |   2 +-
 2 files changed, 169 insertions(+), 121 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index b0cc8c44d271..5b550ec1a1b4 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1691,6 +1691,29 @@ static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
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
@@ -2020,79 +2043,6 @@ out:
     nvme_verify_cb(ctx, ret);
 }
 
-struct nvme_zone_reset_ctx {
-    NvmeRequest *req;
-    NvmeZone    *zone;
-};
-
-static void nvme_aio_zone_reset_complete_cb(void *opaque, int ret)
-{
-    struct nvme_zone_reset_ctx *ctx = opaque;
-    NvmeRequest *req = ctx->req;
-    NvmeNamespace *ns = req->ns;
-    NvmeZone *zone = ctx->zone;
-    uintptr_t *resets = (uintptr_t *)&req->opaque;
-
-    if (ret) {
-        nvme_aio_err(req, ret);
-        goto out;
-    }
-
-    switch (nvme_get_zone_state(zone)) {
-    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_aor_dec_open(ns);
-        /* fall through */
-    case NVME_ZONE_STATE_CLOSED:
-        nvme_aor_dec_active(ns);
-        /* fall through */
-    case NVME_ZONE_STATE_FULL:
-        zone->w_ptr = zone->d.zslba;
-        zone->d.wp = zone->w_ptr;
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
-        /* fall through */
-    default:
-        break;
-    }
-
-out:
-    g_free(ctx);
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
-static void nvme_aio_zone_reset_cb(void *opaque, int ret)
-{
-    struct nvme_zone_reset_ctx *ctx = opaque;
-    NvmeRequest *req = ctx->req;
-    NvmeNamespace *ns = req->ns;
-    NvmeZone *zone = ctx->zone;
-
-    trace_pci_nvme_aio_zone_reset_cb(nvme_cid(req), zone->d.zslba);
-
-    if (ret) {
-        goto out;
-    }
-
-    if (ns->lbaf.ms) {
-        int64_t offset = nvme_moff(ns, zone->d.zslba);
-
-        blk_aio_pwrite_zeroes(ns->blkconf.blk, offset,
-                              nvme_m2b(ns, ns->zone_size), BDRV_REQ_MAY_UNMAP,
-                              nvme_aio_zone_reset_complete_cb, ctx);
-        return;
-    }
-
-out:
-    nvme_aio_zone_reset_complete_cb(opaque, ret);
-}
-
 struct nvme_compare_ctx {
     struct {
         QEMUIOVector iov;
@@ -3395,41 +3345,6 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
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
@@ -3558,12 +3473,144 @@ out:
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
+    int idx;
+    NvmeZone *zone;
+} NvmeZoneResetAIOCB;
+
+static void nvme_zone_reset_cancel(BlockAIOCB *aiocb)
+{
+    NvmeZoneResetAIOCB *iocb = container_of(aiocb, NvmeZoneResetAIOCB, common);
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+
+    iocb->idx = ns->num_zones;
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
+static void nvme_zone_reset_cb(void *opaque, int ret);
+
+static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
+{
+    NvmeZoneResetAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = req->ns;
+    int64_t moff;
+    int count;
+
+    if (ret < 0) {
+        nvme_zone_reset_cb(iocb, ret);
+        return;
+    }
+
+    if (!ns->lbaf.ms) {
+        nvme_zone_reset_cb(iocb, 0);
+        return;
+    }
+
+    moff = nvme_moff(ns, iocb->zone->d.zslba);
+    count = nvme_m2b(ns, ns->zone_size);
+
+    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, moff, count,
+                                        BDRV_REQ_MAY_UNMAP,
+                                        nvme_zone_reset_cb, iocb);
+    return;
+}
+
+static void nvme_zone_reset_cb(void *opaque, int ret)
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
+    if (iocb->zone) {
+        nvme_zrm_reset(ns, iocb->zone);
+
+        if (!iocb->all) {
+            goto done;
+        }
+    }
+
+    while (iocb->idx < ns->num_zones) {
+        NvmeZone *zone = &ns->zone_array[iocb->idx++];
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
+            iocb->zone = zone;
+            break;
+
+        default:
+            continue;
+        }
+
+        trace_pci_nvme_zns_zone_reset(zone->d.zslba);
+
+        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk,
+                                            nvme_l2b(ns, zone->d.zslba),
+                                            nvme_l2b(ns, ns->zone_size),
+                                            BDRV_REQ_MAY_UNMAP,
+                                            nvme_zone_reset_epilogue_cb,
+                                            iocb);
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
@@ -3574,7 +3621,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     enum NvmeZoneProcessingMask proc_mask = NVME_PROC_CURRENT_ZONE;
 
     action = dw13 & 0xff;
-    all = dw13 & 0x100;
+    all = !!(dw13 & 0x100);
 
     req->status = NVME_SUCCESS;
 
@@ -3618,21 +3665,22 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
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
+        iocb->idx = zone_idx;
+        iocb->zone = NULL;
 
-        (*resets)--;
+        req->aiocb = &iocb->common;
+        nvme_zone_reset_cb(iocb, 0);
 
-        return *resets ? NVME_NO_COMPLETE : req->status;
+        return NVME_NO_COMPLETE;
 
     case NVME_ZONE_ACTION_OFFLINE:
         if (all) {
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index cd65f8b28895..dc00c2860db7 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -44,7 +44,6 @@ pci_nvme_compare_data_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_compare_mdata_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
 pci_nvme_aio_flush_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
@@ -100,6 +99,7 @@ pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%
 pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_reset_zone(uint64_t slba, uint32_t zone_idx, int all) "reset zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
+pci_nvme_zns_zone_reset(uint64_t zslba) "zslba 0x%"PRIx64""
 pci_nvme_offline_zone(uint64_t slba, uint32_t zone_idx, int all) "offline zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone descriptor extension, slba=%"PRIu64", idx=%"PRIu32""
 pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
-- 
2.32.0


