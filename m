Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD633248F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:56:36 +0100 (CET)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJayZ-0006Be-MW
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanu-0008Ge-1v; Tue, 09 Mar 2021 06:45:34 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanr-0000Cj-4d; Tue, 09 Mar 2021 06:45:33 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 07C9D2768;
 Tue,  9 Mar 2021 06:45:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VPe5sHsPPOJzS
 wPbwz3cH2Q6hptoAZSww7aXtvF6un0=; b=rMJTK114YS/YwpxiEXo3NTqR/UzRL
 u75K0J+32mfr6BSzPeHTDY2r6+EKDL18QociWzWs/Ztd1nkc8Cfk+1pfRsrVEzQM
 aZoaWS9bK/JW7cqjPdy93KtUQE55NZFvsx5XYhILIRb/lPYK1Nnw44A89nvqRK2W
 YDh9WH946o35fO7WGlkd5+DpewNnrycXlHgu44WC232c4RO3FWlpauzLSfWy3Q1k
 pv0rX+/6SUYH7DB6B30zrKj6AgWk6552zLIWxn4gVLrj2CDN4uXnUzmhYcLDphGY
 lh/IwBTUjXMYPxB0Izy3EI2aDda1ZtOZZ23xFfdcNN7XbKNBpb3jl+cSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VPe5sHsPPOJzSwPbwz3cH2Q6hptoAZSww7aXtvF6un0=; b=c9ZZMRpI
 QFkQei1NfsXGO9a8OIblPnikziAMtDyULRmfH8/2l1iMK5sAs537EYo2rUp6HOHm
 a73b9htQL6nxyv8u/iarN13VIHN87ZB0jcoa3huat8Y3Jtte2HdiratXewSEukC3
 hhu92luRQ6WJJdDMqCoWIKCh/soy824K/kwYuYpHcsPFFr+EG0GVU6fF4piU8aq0
 FOPlHUBJSe9ggJznbHyiE/Q5DBjRqNYQb75m8W0QSxA965HLIoxFrLM+paH0yNQk
 pqs0IPJMkcCW67XQ1GwlcdYdzw7FrambN8Frzv7fKfjwV/cmpi0O8wgErjX7fuBi
 y3b5B/MyGxFD0Q==
X-ME-Sender: <xms:2F9HYI04knWEgcvx8nSv1jRadKgT9MYjjhG98q4YE2xOmLn7Np_rKg>
 <xme:2F9HYDHeAh4bb_Za9SXrw9Y5UkehSrVkOWrOwZ4r9PKmfk7OkBO4BdDs9-KRdbEJq
 Zl2iGHfTyBKQAULo8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2F9HYA75ZKXsDVB-jKMN7mW1q1luE-oekOANO9qrLarb25SaG5qwow>
 <xmx:2F9HYB0LjCVerZ6Pol-vRuqnEzIrIL_UmKjz0Gh5rUXhe_dH2Zrr-Q>
 <xmx:2F9HYLGNnG8VN6w2HMK81nfONJ9p3QzNi816vo4-nRl0m_70xX8V7A>
 <xmx:2F9HYK1WFKW0yTcrUwqnsjojxU3YS0Qh4SfwxZAcjWrMXKdvBACVJw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59825240054;
 Tue,  9 Mar 2021 06:45:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 08/38] hw/block/nvme: refactor zone resource management
Date: Tue,  9 Mar 2021 12:44:42 +0100
Message-Id: <20210309114512.536489-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 220 +++++++++++++++++++++++-------------------------
 1 file changed, 103 insertions(+), 117 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f39be1961e04..7897390b6d74 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1292,7 +1292,46 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
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
 
@@ -1304,34 +1343,74 @@ static void nvme_auto_transition_zone(NvmeNamespace *ns)
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
 
@@ -1341,47 +1420,8 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
 
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
 
@@ -1406,7 +1446,7 @@ static void nvme_rw_cb(void *opaque, int ret)
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
     if (ns->params.zoned && nvme_is_write(req)) {
-        nvme_finalize_zoned_write(ns, req, ret != 0);
+        nvme_finalize_zoned_write(ns, req);
     }
 
     if (!ret) {
@@ -1782,12 +1822,12 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
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
@@ -1873,73 +1913,19 @@ enum NvmeZoneProcessingMask {
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
2.30.1


