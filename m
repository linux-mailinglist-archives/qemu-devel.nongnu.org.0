Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87B39B3D9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:26:05 +0200 (CEST)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4DU-0006lz-3e
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hU-0005oo-IN; Fri, 04 Jun 2021 02:53:00 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hS-0007Rs-Bd; Fri, 04 Jun 2021 02:53:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8EF095C0125;
 Fri,  4 Jun 2021 02:52:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Jun 2021 02:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=eXoNzefnSLE0h
 rggIq+TpJSf3MzkeP+DxA5YcbuFbb4=; b=fGhSUWZ+f4T4RLMn/Lfqb+L3JtjC3
 D6+9XREfGBSUUExw8nhua0yBR8nKbyL5Oru+fUoX6MbxYLHqqKkewuhPTHlJpTSJ
 BdLnZkunmjguDa4qqjyzhKtRkpErlqkEy8Vg9IdltVZ4fXt8MBiUl3OjA7wd6akm
 vnyjpoC8z4neNrr4sygO/JUXkyItIDKxJsYPkDpa4QUJfWiBpFXubAYWO//kA48E
 KVgzhAsms+KvOFavmlvpVHbK8eW1E1XBx4s0q0M3nOc3OUwsXi69ZVZiCOULuubf
 ogovx+judKFAQCVyCzxB9SUhe20YibDhkTClrX6aU+rL9BILysGTGYeog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eXoNzefnSLE0hrggIq+TpJSf3MzkeP+DxA5YcbuFbb4=; b=vfvMG+B2
 1K9lV5AZqgaMQfVR02bv+NNcPWwZgQ1G/6utdaVu14yEvWPhQzHhz5xkbcvVNXtv
 ru80Dpc1TJs1+dvAgyWu1itxxxX18pRSXfffjMcvMd5P9nZ/EYZTGpNqsxo6GubG
 rGHsd8qwiVTg96o/m50sbplC8jvww7zcdSs4uIAG6GAram8Dvgdi/X7H1RHFUA66
 DbLbc4tcMooAa0qE4jF9EX39Q/JhU5hNf0vyi89vYhJvkgnQcuz7wIP5k2qnTNKL
 VKcHPO6jpJ2BBmETuuD8ZIGRK5qSz4O2/+u7D//4B8wbQcQq6f9+iNp/NTUQ0VRH
 lb0lM90LmjvrxA==
X-ME-Sender: <xms:yc25YGdXrtZuhY5EzU2_Ke2aXFzHjdba4QIhhgQbD7AYyr9ju_8GJQ>
 <xme:yc25YAPdqzeJkKltaTzkASohTeKj6Cy4ssgaJigarI4_eLZDtnyGLcBMvXBK84cEF
 p7ErrlFBM6EjS0lnX4>
X-ME-Received: <xmr:yc25YHgk4mxZAp46L3pBTRUTgXNh65L4FoWDFo-GOE9okS1HQpD6JaBT5j8PVsj_Wo-qszpazBeUeKbK-Gbkc4p7miI02LCa-xKpx0fDow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yc25YD_DkHyD26RH3jcA-Z7FB2QIp8n3WPma5Oug5-CgS2jlcDh1sQ>
 <xmx:yc25YCuAZfUzD5jrE4O-OeFW6DYk8jqeHQUAf-h5N7nU5Xss3mhGOA>
 <xmx:yc25YKHQ6J9HnT1_XPeZ4vSNqTcHNHsXBwf025B6qIyXajUEsmi7PA>
 <xmx:yc25YP-tIrL4NOEZKyZce5iNLIwIccYbf3U0BeT9zY28ECcV7rhm4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/11] hw/nvme: reimplement zone reset to allow
 cancellation
Date: Fri,  4 Jun 2021 08:52:35 +0200
Message-Id: <20210604065237.873228-10-its@irrelevant.dk>
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

Prior to this patch, the aios associated with zone reset are submitted
anonymously (no reference saved to the aiocb from the blk_aio call).

Fix this by resetting the zones one after another, saving a reference to
the aiocb for each reset.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 288 +++++++++++++++++++++++++------------------
 hw/nvme/trace-events |   2 +-
 2 files changed, 169 insertions(+), 121 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fb65a4f12d1f..f430a75a3fc5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1685,6 +1685,29 @@ static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
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
@@ -2005,79 +2028,6 @@ out:
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
@@ -3363,41 +3313,6 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
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
@@ -3526,12 +3441,144 @@ out:
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
@@ -3542,7 +3589,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     enum NvmeZoneProcessingMask proc_mask = NVME_PROC_CURRENT_ZONE;
 
     action = dw13 & 0xff;
-    all = dw13 & 0x100;
+    all = !!(dw13 & 0x100);
 
     req->status = NVME_SUCCESS;
 
@@ -3586,21 +3633,22 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
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
2.31.1


