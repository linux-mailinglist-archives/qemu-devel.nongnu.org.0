Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE9308757
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:27:12 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Q3b-0003iZ-G0
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psi-0006Tz-Io; Fri, 29 Jan 2021 04:15:56 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psb-0003ck-HP; Fri, 29 Jan 2021 04:15:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 178A15C01E5;
 Fri, 29 Jan 2021 04:15:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 04:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wcsi0gEeXD5s7
 4/npc840Eno5B8IE2vnOkxkaHOeBis=; b=jwdpuBo1bAkt2pXXKP3Q5qRmbmTSa
 FE43m5b4ZzyIqJx7ijQXcD97EgUFPHuPGEoUNa6lJGIu335deRRnwMqs3ecknePx
 4UC6iKWLNgwB027V7hlQcyFTz9oTnOdLjlDR6zbDjQKexsHwdeeGb3P0rQAf39L2
 dSCR301T40DjbMzkLtKRyDFpCaSgeDi44zEHq/HhTgyETMDYxo71fCObLfCdj13/
 1hPmBBFfHiTKIMiNVhVTPB7Ms3sUgvYXAJNa61y3H05YEs6JxBsbbHXZiHC7721X
 ntiKoyX8d09v5M12M5fhdAOEknP4hkl2cI1cLRcJ79q2bJXUZ/E8sV/Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wcsi0gEeXD5s74/npc840Eno5B8IE2vnOkxkaHOeBis=; b=oW7UJLKQ
 tbsPRtURXneivw8tTeLK94aRUzVrZlkVC0ncCAws2fH3sfLrk6w+cb+2BY7NL2MD
 ULNeXC0Q+GK1Y5HCC6RA3mr6UNP5DbdxSsKt+wbnVlWrc6QucMDIbVfORfBfLwnN
 ARBnfOcVlvXT6q24ZLAeIy/+q39wn/HkckAPlnkp17/HJQRox5rvInLXmgOX1ci5
 xCdefurZILh9DN9/sw1NYem00ycY8w/6QgCCA55qRdFnOub+vC2TWCFfMrGz+KP5
 OilYUJdW5O9LTwbJZTy1uRSj01B2Juu4xRfCMk1c5DYeDw7Z+0f7StX5Zx0BaCFy
 hh+sWEb0dv2wUQ==
X-ME-Sender: <xms:RNITYPl9nRiLW-lIGUbRSu89El6NlTqZrLJeo_bIUiJsEpDURrewGA>
 <xme:RNITYKPP0Bf3JT-iPrjzN-NftuefYKOjYyiuowUhqOKhjl5c26aV-jyYZBWiBQ_F2
 tL5kmcKamDZmA3yEaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucflvghn
 shgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrhhnpe
 euleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefgkeenucfk
 phepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RNITYLPehoFHwt0q76n2yWmt1F5Zdkl9tP2Pjoh-wad6arJFrMCZcw>
 <xmx:RNITYDiAycTejxG3kLvrVACfP4FRQVU4McdLI-pkX6990oq_AGDMNw>
 <xmx:RNITYAtWTSWHL8Rnbfsrg4VcI-JBjrmi5_XqkPgkdjGD4xVfpKyyEg>
 <xmx:RNITYMyaRpeDPHmtmkzbmxsMwZK-R-pJsdg_nJAz6JOV1mG3Wte5_g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD70E24005B;
 Fri, 29 Jan 2021 04:15:46 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/5] hw/block/nvme: refactor zone resource management
Date: Fri, 29 Jan 2021 10:15:38 +0100
Message-Id: <20210129091541.566330-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129091541.566330-1-its@irrelevant.dk>
References: <20210129091541.566330-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Zone transition handling and resource management is open coded (and
semi-duplicated in the case of open, close and finish).

In preparation for Simple Copy command support (which also needs to open
zones for writing), consolidate into a set of 'nvme_zrm' functions and
in the process fix a bug with the controller not closing an open zone to
allow another zone to be explicitly opened.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 220 +++++++++++++++++++++++-------------------------
 1 file changed, 103 insertions(+), 117 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 79d9563a17bd..01d3801a3cd2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1262,7 +1262,46 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
     return status;
 }
 
-static void nvme_auto_transition_zone(NvmeNamespace *ns)
+static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
+{
+    switch (nvme_get_zone_state(zone)) {
+    case NVME_ZONE_STATE_FULL:
+        return NVME_SUCCESS;
+
+    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fallthrough */
+    case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fallthrough */
+    case NVME_ZONE_STATE_EMPTY:
+        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
+        return NVME_SUCCESS;
+
+    default:
+        return NVME_ZONE_INVAL_TRANSITION;
+    }
+}
+
+static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
+{
+    switch (nvme_get_zone_state(zone)) {
+    case NVME_ZONE_STATE_CLOSED:
+        return NVME_SUCCESS;
+
+    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+        /* fall through */
+
+    default:
+        return NVME_ZONE_INVAL_TRANSITION;
+    }
+}
+
+static void nvme_zrm_auto_transition_zone(NvmeNamespace *ns)
 {
     NvmeZone *zone;
 
@@ -1274,34 +1313,74 @@ static void nvme_auto_transition_zone(NvmeNamespace *ns)
              * Automatically close this implicitly open zone.
              */
             QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
-            nvme_aor_dec_open(ns);
-            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+            nvme_zrm_close(ns, zone);
         }
     }
 }
 
-static uint16_t nvme_auto_open_zone(NvmeNamespace *ns, NvmeZone *zone)
+static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
+                                bool implicit)
 {
-    uint16_t status = NVME_SUCCESS;
-    uint8_t zs = nvme_get_zone_state(zone);
+    int act = 0;
+    uint16_t status;
 
-    if (zs == NVME_ZONE_STATE_EMPTY) {
-        nvme_auto_transition_zone(ns);
-        status = nvme_aor_check(ns, 1, 1);
-    } else if (zs == NVME_ZONE_STATE_CLOSED) {
-        nvme_auto_transition_zone(ns);
-        status = nvme_aor_check(ns, 0, 1);
+    switch (nvme_get_zone_state(zone)) {
+    case NVME_ZONE_STATE_EMPTY:
+        act = 1;
+
+        /* fallthrough */
+
+    case NVME_ZONE_STATE_CLOSED:
+        nvme_zrm_auto_transition_zone(ns);
+        status = nvme_aor_check(ns, act, 1);
+        if (status) {
+            return status;
+        }
+
+        if (act) {
+            nvme_aor_inc_active(ns);
+        }
+
+        nvme_aor_inc_open(ns);
+
+        if (implicit) {
+            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
+            return NVME_SUCCESS;
+        }
+
+        /* fallthrough */
+
+    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        if (implicit) {
+            return NVME_SUCCESS;
+        }
+
+        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
+
+        /* fallthrough */
+
+    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+        return NVME_SUCCESS;
+
+    default:
+        return NVME_ZONE_INVAL_TRANSITION;
     }
-
-    return status;
 }
 
-static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
-                                      bool failed)
+static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
+{
+    return __nvme_zrm_open(ns, zone, true);
+}
+
+static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
+{
+    return __nvme_zrm_open(ns, zone, false);
+}
+
+static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeZone *zone;
-    NvmeZonedResult *res = (NvmeZonedResult *)&req->cqe;
     uint64_t slba;
     uint32_t nlb;
 
@@ -1311,47 +1390,8 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
 
     zone->d.wp += nlb;
 
-    if (failed) {
-        res->slba = 0;
-    }
-
     if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
-        switch (nvme_get_zone_state(zone)) {
-        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-            nvme_aor_dec_open(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_CLOSED:
-            nvme_aor_dec_active(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_EMPTY:
-            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
-            /* fall through */
-        case NVME_ZONE_STATE_FULL:
-            break;
-        default:
-            assert(false);
-        }
-    }
-}
-
-static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
-                                 uint32_t nlb)
-{
-    uint8_t zs;
-
-    zone->w_ptr += nlb;
-
-    if (zone->w_ptr < nvme_zone_wr_boundary(zone)) {
-        zs = nvme_get_zone_state(zone);
-        switch (zs) {
-        case NVME_ZONE_STATE_EMPTY:
-            nvme_aor_inc_active(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_CLOSED:
-            nvme_aor_inc_open(ns);
-            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
-        }
+        nvme_zrm_finish(ns, zone);
     }
 }
 
@@ -1376,7 +1416,7 @@ static void nvme_rw_cb(void *opaque, int ret)
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
     if (ns->params.zoned && nvme_is_write(req)) {
-        nvme_finalize_zoned_write(ns, req, ret != 0);
+        nvme_finalize_zoned_write(ns, req);
     }
 
     if (!ret) {
@@ -1752,12 +1792,12 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
-        status = nvme_auto_open_zone(ns, zone);
+        status = nvme_zrm_auto(ns, zone);
         if (status) {
             goto invalid;
         }
 
-        nvme_advance_zone_wp(ns, zone, nlb);
+        zone->w_ptr += nlb;
     }
 
     data_offset = nvme_l2b(ns, slba);
@@ -1843,73 +1883,19 @@ enum NvmeZoneProcessingMask {
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
                                NvmeZoneState state, NvmeRequest *req)
 {
-    uint16_t status;
-
-    switch (state) {
-    case NVME_ZONE_STATE_EMPTY:
-        status = nvme_aor_check(ns, 1, 0);
-        if (status) {
-            return status;
-        }
-        nvme_aor_inc_active(ns);
-        /* fall through */
-    case NVME_ZONE_STATE_CLOSED:
-        status = nvme_aor_check(ns, 0, 1);
-        if (status) {
-            if (state == NVME_ZONE_STATE_EMPTY) {
-                nvme_aor_dec_active(ns);
-            }
-            return status;
-        }
-        nvme_aor_inc_open(ns);
-        /* fall through */
-    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
-        /* fall through */
-    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        return NVME_SUCCESS;
-    default:
-        return NVME_ZONE_INVAL_TRANSITION;
-    }
+    return nvme_zrm_open(ns, zone);
 }
 
 static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
                                 NvmeZoneState state, NvmeRequest *req)
 {
-    switch (state) {
-    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_aor_dec_open(ns);
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
-        /* fall through */
-    case NVME_ZONE_STATE_CLOSED:
-        return NVME_SUCCESS;
-    default:
-        return NVME_ZONE_INVAL_TRANSITION;
-    }
+    return nvme_zrm_close(ns, zone);
 }
 
 static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
                                  NvmeZoneState state, NvmeRequest *req)
 {
-    switch (state) {
-    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_aor_dec_open(ns);
-        /* fall through */
-    case NVME_ZONE_STATE_CLOSED:
-        nvme_aor_dec_active(ns);
-        /* fall through */
-    case NVME_ZONE_STATE_EMPTY:
-        zone->w_ptr = nvme_zone_wr_boundary(zone);
-        zone->d.wp = zone->w_ptr;
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
-        /* fall through */
-    case NVME_ZONE_STATE_FULL:
-        return NVME_SUCCESS;
-    default:
-        return NVME_ZONE_INVAL_TRANSITION;
-    }
+    return nvme_zrm_finish(ns, zone);
 }
 
 static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
-- 
2.30.0


