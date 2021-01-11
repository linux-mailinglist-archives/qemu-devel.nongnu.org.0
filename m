Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D142F129E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:55:56 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywjj-0005Qn-Pw
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywNA-0002RU-0H; Mon, 11 Jan 2021 07:32:36 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN7-0006sU-Lm; Mon, 11 Jan 2021 07:32:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A68D526C4;
 Mon, 11 Jan 2021 07:32:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 07:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ePvMZoBzNKl6e
 ZVdPmHVjKZAWcJtNto4CxVA71C71jY=; b=QjUDicMfN4WUahdwRCuF7vhLWa1QX
 lVXsfy/zJHyABqhgw1kcR4dSoyLfsq+xU1EVIJ4GnXwcG5Aq3FWGildmHEM/qQYl
 RTBXkK/Mfepe10fHpM8Juur99qgxM8QH3cupNhgi+uuAj0gFWcJKPP7paJyv8qto
 4RbEjT87sBtaD7e51bECwHILflWZsebjvyOVYs8AefkSMHRI+to8p79Rl0fcHM5P
 eSC5Im00xqqFOruvZ+vwp3walrvhpLNLKtDbybUAGybjp69kf3fcnOrRJY3hltaG
 LXTU3qa6S0EiTTQ9xW8Zbfwtgk2VWuSPGHLeNX85k8xsznvnmJaqoQhZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ePvMZoBzNKl6eZVdPmHVjKZAWcJtNto4CxVA71C71jY=; b=gLcFVymw
 NmIu4l3EdKGOGiwI5NNxaQ6498RA6MS/6eCi+UPCupp9nPXhaB6++PygzYPjFraS
 FfeDy2f5lgm0pFhg/Vc3nBzxaE0AO4QyARL4GkJqvPQq4J6V6BzeUBDbLoh/tgfj
 v5sLJYji9X8MQH6k8veJF2mTwO2oN8zPjzFHaPKJ6YD2T0V5Vzj292/2QMJRZKK0
 bPjc+PThj9MWLylgn30os0eRFpRLRCQGlw71ZuJq3w39x+Wc2hgL31NdiQi8bSMG
 /JSZqSQhmRwHZiwGOh6uAgBcITFXEj7y1ENsU53fXgz+HiSGRVvsRASdzzrbPa9S
 cb37lkzDxazRDg==
X-ME-Sender: <xms:X0X8X6mZM8hXoiCEp1YanSkJKvuubJTWsv1PfnlPx_NFnsWDJPAVlw>
 <xme:X0X8Xx1fyBemWSqcb-XukqxSHlU220sh3Bc8DXcZ3kBA0RMyAzz-L-1WbFABSxDi6
 vMlpTIzLyBfMIAH6I4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:X0X8X4rl4PFGNAY4J0PKUWGuJKG8H4_naVVRLcpouz3LR2oVsfZlbg>
 <xmx:X0X8X-kjF5end7h_TormWGRrxahCFxJYuFgs-V4Zy4lFb4NnXYWfvg>
 <xmx:X0X8X41kLYQIOHwqmqKDXZrGCpGTneDuEas6HNXvn4yXR8OkdzY4Tw>
 <xmx:X0X8X8-gKoVDlWAWOnAR8XrMPOAfhttO8g6WIhRxeLCS23zCQHyqGQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 221E4108005C;
 Mon, 11 Jan 2021 07:32:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/block/nvme: zero out zones on reset
Date: Mon, 11 Jan 2021 13:32:21 +0100
Message-Id: <20210111123223.76248-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111123223.76248-1-its@irrelevant.dk>
References: <20210111123223.76248-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The zoned command set specification states that "All logical blocks in a
zone *shall* be marked as deallocated when [the zone is reset]". Since
the device guarantees 0x00 to be read from deallocated blocks we have to
issue a pwrite_zeroes since we cannot be sure that a discard will do
anything. But typically, this will be achieved with an efficient
unmap/discard operation.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 150 +++++++++++++++++++++++++++++++-----------
 hw/block/trace-events |   1 +
 2 files changed, 113 insertions(+), 38 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7c2ec17ad7d9..b3658595fe1b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1371,6 +1371,53 @@ static void nvme_aio_discard_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_zone_reset_ctx {
+    NvmeRequest *req;
+    NvmeZone    *zone;
+};
+
+static void nvme_aio_zone_reset_cb(void *opaque, int ret)
+{
+    struct nvme_zone_reset_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = ctx->zone;
+    uintptr_t *resets = (uintptr_t *)&req->opaque;
+
+    g_free(ctx);
+
+    trace_pci_nvme_aio_zone_reset_cb(nvme_cid(req), zone->d.zslba);
+
+    if (!ret) {
+        switch (nvme_get_zone_state(zone)) {
+        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+            nvme_aor_dec_open(ns);
+            /* fall through */
+        case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_dec_active(ns);
+            /* fall through */
+        case NVME_ZONE_STATE_FULL:
+            zone->w_ptr = zone->d.zslba;
+            zone->d.wp = zone->w_ptr;
+            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
+            /* fall through */
+        default:
+            break;
+        }
+    } else {
+        nvme_aio_err(req, ret);
+    }
+
+    (*resets)--;
+
+    if (*resets) {
+        return;
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
@@ -1735,7 +1782,8 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
     return NVME_SUCCESS;
 }
 
-typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *, NvmeZoneState);
+typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *, NvmeZoneState,
+                                 NvmeRequest *);
 
 enum NvmeZoneProcessingMask {
     NVME_PROC_CURRENT_ZONE    = 0,
@@ -1746,7 +1794,7 @@ enum NvmeZoneProcessingMask {
 };
 
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
-                               NvmeZoneState state)
+                               NvmeZoneState state, NvmeRequest *req)
 {
     uint16_t status;
 
@@ -1779,7 +1827,7 @@ static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                NvmeZoneState state)
+                                NvmeZoneState state, NvmeRequest *req)
 {
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1795,7 +1843,7 @@ static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                 NvmeZoneState state)
+                                 NvmeZoneState state, NvmeRequest *req)
 {
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1818,30 +1866,42 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                NvmeZoneState state)
+                                NvmeZoneState state, NvmeRequest *req)
 {
+    uintptr_t *resets = (uintptr_t *)&req->opaque;
+    struct nvme_zone_reset_ctx *ctx;
+
     switch (state) {
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
     case NVME_ZONE_STATE_EMPTY:
         return NVME_SUCCESS;
+    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+    case NVME_ZONE_STATE_CLOSED:
+    case NVME_ZONE_STATE_FULL:
+        break;
     default:
         return NVME_ZONE_INVAL_TRANSITION;
     }
+
+    /*
+     * The zone reset aio callback needs to know the zone that is being reset
+     * in order to transition the zone on completion.
+     */
+    ctx = g_new(struct nvme_zone_reset_ctx, 1);
+    ctx->req = req;
+    ctx->zone = zone;
+
+    (*resets)++;
+
+    blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_l2b(ns, zone->d.zslba),
+                          nvme_l2b(ns, ns->zone_size), BDRV_REQ_MAY_UNMAP,
+                          nvme_aio_zone_reset_cb, ctx);
+
+    return NVME_NO_COMPLETE;
 }
 
 static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                  NvmeZoneState state)
+                                  NvmeZoneState state, NvmeRequest *req)
 {
     switch (state) {
     case NVME_ZONE_STATE_READ_ONLY:
@@ -1875,7 +1935,7 @@ static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
 
 static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
                                     enum NvmeZoneProcessingMask proc_mask,
-                                    op_handler_t op_hndlr)
+                                    op_handler_t op_hndlr, NvmeRequest *req)
 {
     uint16_t status = NVME_SUCCESS;
     NvmeZoneState zs = nvme_get_zone_state(zone);
@@ -1900,7 +1960,7 @@ static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
     }
 
     if (proc_zone) {
-        status = op_hndlr(ns, zone, zs);
+        status = op_hndlr(ns, zone, zs, req);
     }
 
     return status;
@@ -1908,42 +1968,46 @@ static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
 
 static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
                                 enum NvmeZoneProcessingMask proc_mask,
-                                op_handler_t op_hndlr)
+                                op_handler_t op_hndlr, NvmeRequest *req)
 {
     NvmeZone *next;
     uint16_t status = NVME_SUCCESS;
     int i;
 
     if (!proc_mask) {
-        status = op_hndlr(ns, zone, nvme_get_zone_state(zone));
+        status = op_hndlr(ns, zone, nvme_get_zone_state(zone), req);
     } else {
         if (proc_mask & NVME_PROC_CLOSED_ZONES) {
             QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
-                if (status != NVME_SUCCESS) {
+                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+                                             req);
+                if (status && status != NVME_NO_COMPLETE) {
                     goto out;
                 }
             }
         }
         if (proc_mask & NVME_PROC_OPENED_ZONES) {
             QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
-                if (status != NVME_SUCCESS) {
+                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+                                             req);
+                if (status && status != NVME_NO_COMPLETE) {
                     goto out;
                 }
             }
 
             QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
-                if (status != NVME_SUCCESS) {
+                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+                                             req);
+                if (status && status != NVME_NO_COMPLETE) {
                     goto out;
                 }
             }
         }
         if (proc_mask & NVME_PROC_FULL_ZONES) {
             QTAILQ_FOREACH_SAFE(zone, &ns->full_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
-                if (status != NVME_SUCCESS) {
+                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+                                             req);
+                if (status && status != NVME_NO_COMPLETE) {
                     goto out;
                 }
             }
@@ -1951,8 +2015,9 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
 
         if (proc_mask & NVME_PROC_READ_ONLY_ZONES) {
             for (i = 0; i < ns->num_zones; i++, zone++) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
-                if (status != NVME_SUCCESS) {
+                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+                                             req);
+                if (status && status != NVME_NO_COMPLETE) {
                     goto out;
                 }
             }
@@ -1968,6 +2033,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeZone *zone;
+    uintptr_t *resets;
     uint8_t *zd_ext;
     uint32_t dw13 = le32_to_cpu(cmd->cdw13);
     uint64_t slba = 0;
@@ -2002,7 +2068,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_CLOSED_ZONES;
         }
         trace_pci_nvme_open_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_open_zone);
+        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_open_zone, req);
         break;
 
     case NVME_ZONE_ACTION_CLOSE:
@@ -2010,7 +2076,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_OPENED_ZONES;
         }
         trace_pci_nvme_close_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_close_zone);
+        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_close_zone, req);
         break;
 
     case NVME_ZONE_ACTION_FINISH:
@@ -2018,24 +2084,32 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_OPENED_ZONES | NVME_PROC_CLOSED_ZONES;
         }
         trace_pci_nvme_finish_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_finish_zone);
+        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_finish_zone, req);
         break;
 
     case NVME_ZONE_ACTION_RESET:
+        resets = (uintptr_t *)&req->opaque;
+
         if (all) {
             proc_mask = NVME_PROC_OPENED_ZONES | NVME_PROC_CLOSED_ZONES |
                 NVME_PROC_FULL_ZONES;
         }
         trace_pci_nvme_reset_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_reset_zone);
-        break;
+
+        *resets = 1;
+
+        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_reset_zone, req);
+
+        (*resets)--;
+
+        return *resets ? NVME_NO_COMPLETE : req->status;
 
     case NVME_ZONE_ACTION_OFFLINE:
         if (all) {
             proc_mask = NVME_PROC_READ_ONLY_ZONES;
         }
         trace_pci_nvme_offline_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_offline_zone);
+        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_offline_zone, req);
         break;
 
     case NVME_ZONE_ACTION_SET_ZD_EXT:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index deaacdae5097..78d76b0a71c1 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -49,6 +49,7 @@ pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
-- 
2.30.0


