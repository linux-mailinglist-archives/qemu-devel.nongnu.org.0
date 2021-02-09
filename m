Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77339314A4A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:31:45 +0100 (CET)
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OQy-0002Ym-CT
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVw-0005RO-HY; Tue, 09 Feb 2021 02:32:49 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVi-0005mQ-BQ; Tue, 09 Feb 2021 02:32:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E83B9C38;
 Tue,  9 Feb 2021 02:32:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fkbEWCcJFDY3e
 JA/05OmGhF1QduVdpY4+TpoKE7X6SU=; b=J+LYQ4rpyXPcNqNl6anyrgvepjrea
 AYV6vxmWksjQZ/B6+kfn2s4m4MIotHLeYIYoH58ncOwp3yEWkUek3U+Aida0kk0k
 ndMupg+Y6apJPdORGu4NgEsYK2IrSpG2BOC1Q5iuRV88uohqPqwFn0I8Q/z/zglA
 tV4UyvTD1k2NaOI1a5Weq7SqoYJm2YD/q7YnI54Efbsp69CiYJNl6iAwlskNY+O3
 WzTuVbm9WGO45Nm3HxOpUnu14vVjblXk5cImbeE5TE0huWEJ+D+jKYcApxEcWRDp
 aZNlEsDNzy4T4UQnOPiJrwPxKW113hynQm8pHngBeBv9FL5UzwKohfXyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fkbEWCcJFDY3eJA/05OmGhF1QduVdpY4+TpoKE7X6SU=; b=nOWPjhMz
 EQlXSXpvwveh7z1BC1VlBilOzM+iznkEVf20jqO2ggJYTDdnnTk6T6mq6r/MYenA
 FIOyaOatoJ3/hEYKPt+l3McSbOloMDy5YgbiCHW+0Sarv5K6mQOr51VqDCl6Q+K0
 Ili2o/3riy65GS98/IbfhZC3vVCyFn5EfsJ5BRaJiKCWSGU7mZDXQIHuGcJHs0ai
 bx6F5RhZ1p7cEwuyLAeeSHld2Dfc/g0hS7nmsGdONi75GHpwvrJyjRinl5J0TaRh
 SJM1IxYyTL8M8Rntyrx+A/Gqb7NGVChNUrCuUxMDUKAdVM+Y1oLh2uduGZG5F1z/
 qjFI4++NcZiAIw==
X-ME-Sender: <xms:cToiYL0AMeWD1v4oJyi22upQ9F2fuQf6c_TRgNTlDlYCXDLrFIE-fw>
 <xme:cToiYBVsOvghhNkl7iQeQtbjht6O1LwZXon-glZ8R6jGA6i0RNfSXcO-hb6uaK1tV
 LZMWhUH-f4KaCk9mfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:cToiYGwq1zdZL4aD3cy1Kt8LdZiQ-EhpJOK5UlO3HRAeRwMuw0oBYA>
 <xmx:cToiYAygtPmuR3e25lCqtCgkeSyBO0i7MYm7e08LjRCngBUN3e3DAg>
 <xmx:cToiYD0s4So7OZUOx0PamOqFmVFf_UmYttAs5J40vCpXzYtzE1SqxQ>
 <xmx:cToiYH3h6TkYUgtP0cbEk-V0TWAF6QhW3t3HUOfiKWLBrEFPcEgCBCiYZnE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FD88108005C;
 Tue,  9 Feb 2021 02:32:00 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 25/56] hw/block/nvme: zero out zones on reset
Date: Tue,  9 Feb 2021 08:30:30 +0100
Message-Id: <20210209073101.548811-26-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
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
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c       | 150 +++++++++++++++++++++++++++++++-----------
 hw/block/trace-events |   1 +
 2 files changed, 113 insertions(+), 38 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a5cf798bbbaa..7222eff755ee 100644
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
index a455979e5911..6d1686e6dc9d 100644
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


