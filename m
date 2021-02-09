Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47594314A22
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:19:23 +0100 (CET)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OF0-0004yu-7Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVY-0005J4-PR; Tue, 09 Feb 2021 02:32:24 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVL-0005fN-Ve; Tue, 09 Feb 2021 02:32:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4E69998E;
 Tue,  9 Feb 2021 02:31:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=xnDESdD+bm8lD
 JNMqjcMPRLI+W7S+9/cGJaoXJkwYbs=; b=S8upkLELSQicDswTOu7ZRKIq5rIft
 IiQxOsVbp+BzFcMGe8LuvCeWFd1iiEO5v0/Ghj+UWHiIphRUmT3R14WSjrhrnQgc
 z1QBOe4OCCO3Y1rT50VU/uYLaF2JH7ICCm2pMNNgyxrN1Abr67nPEpSmpSf7ocWK
 m6A1/sWLJo5/iZ/DVQbY8ECLEVDzdJQO/Tgf8+PkckJlVyI5io6jVc8berv3HfhM
 jJkykZ8Or4cKm9XzI+ao7VOLQ+ZpCKp1raVhZzy1+c0qb4zyYrGkk/kzSCnQB2fl
 /Y6N+VSTCVhhOQwngkuUpVcmQeziZ3l/9FIcCt0I4J9L06iUCrVofyYnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=xnDESdD+bm8lDJNMqjcMPRLI+W7S+9/cGJaoXJkwYbs=; b=qhHZnvaa
 GtQL6+URgYC5mR0Q/NbiNcNKaXtzcMLkbY2EzpKKYAqJDXUFRIHvnRNbd0i31i7G
 GD8Nq+TfzGgR5pkfkSgyhQLOgAMT67CTPnYUqN3sxdEeR76PxPBtxFjavUHBwmFv
 3JjY+SaKu5zyi72RyjsJObvURY+kPqzFp1jOrT8/m01qGdiwUmqEJ8RSmIwzr4ee
 xt9l9Qmo6xgfo7iSg2ln7ILviu1RJ2X9/j5rdZ49ZqXzQvwiv4DZBTLu6OecxeZn
 dTqL+4iIvEoD7QB4zA7jdpq99peZgBUDU4EUNf7804HfHsICzRnTkyQLvbOQQV+j
 a7jTDFij2Ff6Dw==
X-ME-Sender: <xms:ZDoiYHtS59JTqv3czmXS7K2cnBimMusQBUY3pH0Pfl1xL94CT2btqg>
 <xme:ZDoiYIe88puDGR4y3vQeMw_cNT-ZIuLzKgLe6aFZbonxoqfD9UI2jMsnJDz1Ou4_4
 -DEw2uWTL4BkARK0ZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedufe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZDoiYKznj1H7mBP1_SsZI71SO2SbVMK68j1LcYq-HD51MivSEfQ3PQ>
 <xmx:ZDoiYGOY3QNNqyqJ99Z9SK5WgaF1niLDH7_0gFOz_mOiZNaq7AjibA>
 <xmx:ZDoiYH-Yyk2s9wnuHFIpGDdibTth3EUsKgh7L0QWVf00b4jGgVns0g>
 <xmx:ZDoiYI1IlJ9-hO-KN96m6l8pHBt9bBKVwfMW9ZuWHK9-HYo9r2KMMSrqJlg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F738108005C;
 Tue,  9 Feb 2021 02:31:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/56] hw/block/nvme: Introduce max active and open zone limits
Date: Tue,  9 Feb 2021 08:30:22 +0100
Message-Id: <20210209073101.548811-18-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hans Holmberg <hans.holmberg@wdc.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Add two module properties, "zoned.max_active" and "zoned.max_open"
to control the maximum number of zones that can be active or open.
Once these variables are set to non-default values, these limits are
checked during I/O and Too Many Active or Too Many Open command status
is returned if they are exceeded.

Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    | 41 +++++++++++++++++++
 hw/block/nvme-ns.c    | 31 ++++++++++++++-
 hw/block/nvme.c       | 92 +++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  2 +
 4 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 388381dda0df..7e1fd26909ba 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -33,6 +33,8 @@ typedef struct NvmeNamespaceParams {
     bool     cross_zone_read;
     uint64_t zone_size_bs;
     uint64_t zone_cap_bs;
+    uint32_t max_active_zones;
+    uint32_t max_open_zones;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -54,6 +56,8 @@ typedef struct NvmeNamespace {
     uint64_t        zone_size;
     uint64_t        zone_capacity;
     uint32_t        zone_size_log2;
+    int32_t         nr_open_zones;
+    int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
 
@@ -125,6 +129,43 @@ static inline bool nvme_wp_is_valid(NvmeZone *zone)
            st != NVME_ZONE_STATE_OFFLINE;
 }
 
+static inline void nvme_aor_inc_open(NvmeNamespace *ns)
+{
+    assert(ns->nr_open_zones >= 0);
+    if (ns->params.max_open_zones) {
+        ns->nr_open_zones++;
+        assert(ns->nr_open_zones <= ns->params.max_open_zones);
+    }
+}
+
+static inline void nvme_aor_dec_open(NvmeNamespace *ns)
+{
+    if (ns->params.max_open_zones) {
+        assert(ns->nr_open_zones > 0);
+        ns->nr_open_zones--;
+    }
+    assert(ns->nr_open_zones >= 0);
+}
+
+static inline void nvme_aor_inc_active(NvmeNamespace *ns)
+{
+    assert(ns->nr_active_zones >= 0);
+    if (ns->params.max_active_zones) {
+        ns->nr_active_zones++;
+        assert(ns->nr_active_zones <= ns->params.max_active_zones);
+    }
+}
+
+static inline void nvme_aor_dec_active(NvmeNamespace *ns)
+{
+    if (ns->params.max_active_zones) {
+        assert(ns->nr_active_zones > 0);
+        ns->nr_active_zones--;
+        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    }
+    assert(ns->nr_active_zones >= 0);
+}
+
 int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index d79452c627cf..c55afc1920a3 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -135,6 +135,21 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
     ns->zone_size = zone_size / lbasz;
     ns->zone_capacity = zone_cap / lbasz;
     ns->num_zones = ns->size / lbasz / ns->zone_size;
+
+    /* Do a few more sanity checks of ZNS properties */
+    if (ns->params.max_open_zones > ns->num_zones) {
+        error_setg(errp,
+                   "max_open_zones value %u exceeds the number of zones %u",
+                   ns->params.max_open_zones, ns->num_zones);
+        return -1;
+    }
+    if (ns->params.max_active_zones > ns->num_zones) {
+        error_setg(errp,
+                   "max_active_zones value %u exceeds the number of zones %u",
+                   ns->params.max_active_zones, ns->num_zones);
+        return -1;
+    }
+
     return 0;
 }
 
@@ -182,8 +197,8 @@ static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
 
     /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
-    id_ns_z->mar = 0xffffffff;
-    id_ns_z->mor = 0xffffffff;
+    id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
+    id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
     id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
 
@@ -209,6 +224,7 @@ static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
             trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
             nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
         }
+        nvme_aor_inc_active(ns);
         QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
     } else {
         trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
@@ -225,16 +241,23 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
 
     QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
         QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
+        nvme_aor_dec_active(ns);
         nvme_clear_zone(ns, zone);
     }
     QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
         QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
+        nvme_aor_dec_open(ns);
+        nvme_aor_dec_active(ns);
         nvme_clear_zone(ns, zone);
     }
     QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
         QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
+        nvme_aor_dec_open(ns);
+        nvme_aor_dec_active(ns);
         nvme_clear_zone(ns, zone);
     }
+
+    assert(ns->nr_open_zones == 0);
 }
 
 static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
@@ -320,6 +343,10 @@ static Property nvme_ns_props[] = {
                      0),
     DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespace,
                      params.cross_zone_read, false),
+    DEFINE_PROP_UINT32("zoned.max_active", NvmeNamespace,
+                       params.max_active_zones, 0),
+    DEFINE_PROP_UINT32("zoned.max_open", NvmeNamespace,
+                       params.max_open_zones, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index be83be3fb5d4..c07dbcd2a809 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -206,6 +206,26 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
+/*
+ * Check if we can open a zone without exceeding open/active limits.
+ * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
+ */
+static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
+{
+    if (ns->params.max_active_zones != 0 &&
+        ns->nr_active_zones + act > ns->params.max_active_zones) {
+        trace_pci_nvme_err_insuff_active_res(ns->params.max_active_zones);
+        return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
+    }
+    if (ns->params.max_open_zones != 0 &&
+        ns->nr_open_zones + opn > ns->params.max_open_zones) {
+        trace_pci_nvme_err_insuff_open_res(ns->params.max_open_zones);
+        return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
     hwaddr low = n->ctrl_mem.addr;
@@ -1168,6 +1188,40 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
     return status;
 }
 
+static void nvme_auto_transition_zone(NvmeNamespace *ns)
+{
+    NvmeZone *zone;
+
+    if (ns->params.max_open_zones &&
+        ns->nr_open_zones == ns->params.max_open_zones) {
+        zone = QTAILQ_FIRST(&ns->imp_open_zones);
+        if (zone) {
+            /*
+             * Automatically close this implicitly open zone.
+             */
+            QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
+            nvme_aor_dec_open(ns);
+            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+        }
+    }
+}
+
+static uint16_t nvme_auto_open_zone(NvmeNamespace *ns, NvmeZone *zone)
+{
+    uint16_t status = NVME_SUCCESS;
+    uint8_t zs = nvme_get_zone_state(zone);
+
+    if (zs == NVME_ZONE_STATE_EMPTY) {
+        nvme_auto_transition_zone(ns);
+        status = nvme_aor_check(ns, 1, 1);
+    } else if (zs == NVME_ZONE_STATE_CLOSED) {
+        nvme_auto_transition_zone(ns);
+        status = nvme_aor_check(ns, 0, 1);
+    }
+
+    return status;
+}
+
 static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
                                       bool failed)
 {
@@ -1188,7 +1242,11 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
         switch (nvme_get_zone_state(zone)) {
         case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+            nvme_aor_dec_open(ns);
+            /* fall through */
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_dec_active(ns);
+            /* fall through */
         case NVME_ZONE_STATE_EMPTY:
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
             /* fall through */
@@ -1215,7 +1273,10 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
         zs = nvme_get_zone_state(zone);
         switch (zs) {
         case NVME_ZONE_STATE_EMPTY:
+            nvme_aor_inc_active(ns);
+            /* fall through */
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_inc_open(ns);
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
         }
     }
@@ -1556,6 +1617,11 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
+        status = nvme_auto_open_zone(ns, zone);
+        if (status != NVME_SUCCESS) {
+            goto invalid;
+        }
+
         if (append) {
             slba = zone->w_ptr;
         }
@@ -1651,9 +1717,26 @@ enum NvmeZoneProcessingMask {
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
                                enum NvmeZoneState state)
 {
+    uint16_t status;
+
     switch (state) {
     case NVME_ZONE_STATE_EMPTY:
+        status = nvme_aor_check(ns, 1, 0);
+        if (status != NVME_SUCCESS) {
+            return status;
+        }
+        nvme_aor_inc_active(ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        status = nvme_aor_check(ns, 0, 1);
+        if (status != NVME_SUCCESS) {
+            if (state == NVME_ZONE_STATE_EMPTY) {
+                nvme_aor_dec_active(ns);
+            }
+            return status;
+        }
+        nvme_aor_inc_open(ns);
+        /* fall through */
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
         /* fall through */
@@ -1670,6 +1753,7 @@ static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
@@ -1685,7 +1769,11 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fall through */
     case NVME_ZONE_STATE_EMPTY:
         zone->w_ptr = nvme_zone_wr_boundary(zone);
         zone->d.wp = zone->w_ptr;
@@ -1704,7 +1792,11 @@ static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fall through */
     case NVME_ZONE_STATE_FULL:
         zone->w_ptr = zone->d.zslba;
         zone->d.wp = zone->w_ptr;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 64366d89366c..bbc10bc7371a 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -128,6 +128,8 @@ pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slb
 pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint16_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint16_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
+pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=%"PRIu32" zone limit exceeded"
+pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=%"PRIu32" zone limit exceeded"
 pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combination index %"PRIu32""
 pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
-- 
2.30.0


