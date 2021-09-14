Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780140B980
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:52:12 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFPX-0007CI-33
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBq-0005cD-VV; Tue, 14 Sep 2021 16:38:03 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:51319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBi-0004hO-HC; Tue, 14 Sep 2021 16:38:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7819432009E9;
 Tue, 14 Sep 2021 16:37:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 16:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zVs+nIMaUBztE
 XI1v+kDNQEGe+FkvovkVxRVx1KTR7c=; b=paChx/uwj9/2QhGt2uo91yp7WL+v3
 pCiS7aAdnJ8Tjs6i3ZwXhf+Zl0zI4Y+wUrHt8rvH+nYl3B96DmmH+2h1MkOwy1Pc
 zoxLRhS0ECYZJt36+LkefKx7YCCQDdZ4F2Q4WwVYluGC4ohfOYHSkhrjZOS78Ucx
 xrJnYEiJvZLtoFWkAwyxQkgyGoTn1knyldnAChqEL9XDiXRr8iDiNKuOMmBGivC9
 Qbbd/vOn+gor4H6rn6Yt7X1OWFdzWh6X88dSo8GOw5m4hjRrn7YMv/hOUwXwrQde
 5MuXvWgYBaG3tjKi3wAY9ox5zOIXfiRHbuV/K4tWtAiAqjEubkCcltpNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zVs+nIMaUBztEXI1v+kDNQEGe+FkvovkVxRVx1KTR7c=; b=ayrVMEYF
 Pyj6RwIiQKpnsc73+ExVCJEkPxowhQlBT0t5cJ0ouiGkReYQM6jXSSX7PGeub15E
 QTpgwPKbRDoKNwfV1J5z+SmW1crxTO6yEFBrqzxLlzJZAQQXXjk7CYov/f7pqy9O
 RQCMIyejDkl2o2T3SryAvU/DCR1Fz0uWclD0nb/Z/TkppgnKb4kal/RWRd0KIBlL
 GF7lMk/0qbzbwJP2RPNMHMrGATbrO23M9vhyJPngt0Rc9IsUVx5ph3pnzI3+a8bf
 cA16FGkoikcs2AfzFYQp0UEWt2yx0pJ9Vw9EEZ3OQma7ccRlhRdUqbXRhYJacxXf
 mqrLnUQjQlLAeg==
X-ME-Sender: <xms:HwhBYdrtwxlDASI4lFIGifOQS6VwMn_oYYOWTW44BZn8JxGGLfPKCQ>
 <xme:HwhBYfo9DJnEjQtYdKNa_V3cp_HQXN02pgBxS0iELZB90LIqAioJFdBid5mkNUDsx
 4CaMm3fUlQX2MzoJ4k>
X-ME-Received: <xmr:HwhBYaNXvQ_JQ_sGEkRVAi9dXmzaEF9gWgQlOVT1k_05Lg_y7OFp3r3yvC6dgD5tvnoi6b1lwiFblV___zKS5F7E5iKBHVpX37poBAYH3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IAhBYY4ugjns9DVHI3E5qv-kdY5XmtJ6GiZhhhlHLoCAfE_WOStYNA>
 <xmx:IAhBYc4qbb1pEQN5ImkcjWJvvqIXNHr6fUT02EYZ4V1ZF-iejNGE0w>
 <xmx:IAhBYQjqvlYBnyPYVj6JAD17a_IsuTnzd7SjrDUBHU9oU1K3xx4-Hg>
 <xmx:IAhBYetuTYcp7RozhI2EwIGVRMJS7bZoHGYkMeF2hLrF0wOxA0_ikw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:37:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 03/13] hw/nvme: move zoned namespace members to separate
 struct
Date: Tue, 14 Sep 2021 22:37:27 +0200
Message-Id: <20210914203737.182571-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In preparation for nvm and zoned namespace separation, move zoned
related members from NvmeNamespace into NvmeNamespaceZoned.

There are no functional changes here, basically just a
s/NvmeNamespace/NvmeNamespaceZoned and s/ns/zoned where applicable.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 276 +++++++++++++++++++++++--------------------
 hw/nvme/ns.c         | 134 +++++++++++----------
 hw/nvme/nvme.h       |  66 +++++++----
 hw/nvme/zoned.h      |  68 +++++------
 include/block/nvme.h |   4 +
 5 files changed, 304 insertions(+), 244 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 778a2689481d..4c30823d389f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -260,22 +260,22 @@ static uint16_t nvme_sqid(NvmeRequest *req)
     return le16_to_cpu(req->sq->sqid);
 }
 
-static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
+static void nvme_assign_zone_state(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                    NvmeZoneState state)
 {
     if (QTAILQ_IN_USE(zone, entry)) {
         switch (nvme_zoned_zs(zone)) {
         case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-            QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
+            QTAILQ_REMOVE(&zoned->exp_open_zones, zone, entry);
             break;
         case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-            QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
+            QTAILQ_REMOVE(&zoned->imp_open_zones, zone, entry);
             break;
         case NVME_ZONE_STATE_CLOSED:
-            QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
+            QTAILQ_REMOVE(&zoned->closed_zones, zone, entry);
             break;
         case NVME_ZONE_STATE_FULL:
-            QTAILQ_REMOVE(&ns->full_zones, zone, entry);
+            QTAILQ_REMOVE(&zoned->full_zones, zone, entry);
         default:
             ;
         }
@@ -285,16 +285,16 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
 
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        QTAILQ_INSERT_TAIL(&ns->exp_open_zones, zone, entry);
+        QTAILQ_INSERT_TAIL(&zoned->exp_open_zones, zone, entry);
         break;
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        QTAILQ_INSERT_TAIL(&ns->imp_open_zones, zone, entry);
+        QTAILQ_INSERT_TAIL(&zoned->imp_open_zones, zone, entry);
         break;
     case NVME_ZONE_STATE_CLOSED:
-        QTAILQ_INSERT_TAIL(&ns->closed_zones, zone, entry);
+        QTAILQ_INSERT_TAIL(&zoned->closed_zones, zone, entry);
         break;
     case NVME_ZONE_STATE_FULL:
-        QTAILQ_INSERT_TAIL(&ns->full_zones, zone, entry);
+        QTAILQ_INSERT_TAIL(&zoned->full_zones, zone, entry);
     case NVME_ZONE_STATE_READ_ONLY:
         break;
     default:
@@ -306,17 +306,17 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
  * Check if we can open a zone without exceeding open/active limits.
  * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
  */
-static int nvme_ns_zoned_aor_check(NvmeNamespace *ns, uint32_t act,
+static int nvme_ns_zoned_aor_check(NvmeNamespaceZoned *zoned, uint32_t act,
                                    uint32_t opn)
 {
-    if (ns->params.max_active_zones != 0 &&
-        ns->nr_active_zones + act > ns->params.max_active_zones) {
-        trace_pci_nvme_err_insuff_active_res(ns->params.max_active_zones);
+    if (zoned->max_active_zones != 0 &&
+        zoned->nr_active_zones + act > zoned->max_active_zones) {
+        trace_pci_nvme_err_insuff_active_res(zoned->max_active_zones);
         return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
     }
-    if (ns->params.max_open_zones != 0 &&
-        ns->nr_open_zones + opn > ns->params.max_open_zones) {
-        trace_pci_nvme_err_insuff_open_res(ns->params.max_open_zones);
+    if (zoned->max_open_zones != 0 &&
+        zoned->nr_open_zones + opn > zoned->max_open_zones) {
+        trace_pci_nvme_err_insuff_open_res(zoned->max_open_zones);
         return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
     }
 
@@ -1581,8 +1581,8 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
     return NVME_INTERNAL_DEV_ERROR;
 }
 
-static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
-                                      uint64_t slba, uint32_t nlb)
+static uint16_t nvme_check_zone_write(NvmeZone *zone, uint64_t slba,
+                                      uint32_t nlb)
 {
     uint64_t zcap = nvme_zoned_zone_wr_boundary(zone);
     uint16_t status;
@@ -1625,24 +1625,24 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     return NVME_INTERNAL_DEV_ERROR;
 }
 
-static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
+static uint16_t nvme_check_zone_read(NvmeNamespaceZoned *zoned, uint64_t slba,
                                      uint32_t nlb)
 {
     NvmeZone *zone;
     uint64_t bndry, end;
     uint16_t status;
 
-    zone = nvme_ns_zoned_get_by_slba(ns, slba);
+    zone = nvme_ns_zoned_get_by_slba(zoned, slba);
     assert(zone);
 
-    bndry = nvme_zoned_zone_rd_boundary(ns, zone);
+    bndry = nvme_zoned_zone_rd_boundary(zoned, zone);
     end = slba + nlb;
 
     status = nvme_check_zone_state_for_read(zone);
     if (status) {
         ;
     } else if (unlikely(end > bndry)) {
-        if (!ns->params.cross_zone_read) {
+        if (!(zoned->flags & NVME_NS_ZONED_CROSS_READ)) {
             status = NVME_ZONE_BOUNDARY_ERROR;
         } else {
             /*
@@ -1655,14 +1655,14 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                 if (status) {
                     break;
                 }
-            } while (end > nvme_zoned_zone_rd_boundary(ns, zone));
+            } while (end > nvme_zoned_zone_rd_boundary(zoned, zone));
         }
     }
 
     return status;
 }
 
-static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
+static uint16_t nvme_zrm_finish(NvmeNamespaceZoned *zoned, NvmeZone *zone)
 {
     switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_FULL:
@@ -1670,13 +1670,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        nvme_ns_zoned_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_open(zoned);
         /* fallthrough */
     case NVME_ZONE_STATE_CLOSED:
-        nvme_ns_zoned_aor_dec_active(ns);
+        nvme_ns_zoned_aor_dec_active(zoned);
         /* fallthrough */
     case NVME_ZONE_STATE_EMPTY:
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
+        nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_FULL);
         return NVME_SUCCESS;
 
     default:
@@ -1684,13 +1684,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
     }
 }
 
-static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
+static uint16_t nvme_zrm_close(NvmeNamespaceZoned *zoned, NvmeZone *zone)
 {
     switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_ns_zoned_aor_dec_open(ns);
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+        nvme_ns_zoned_aor_dec_open(zoned);
+        nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
         return NVME_SUCCESS;
@@ -1700,20 +1700,20 @@ static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
     }
 }
 
-static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
+static uint16_t nvme_zrm_reset(NvmeNamespaceZoned *zoned, NvmeZone *zone)
 {
     switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_ns_zoned_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_open(zoned);
         /* fallthrough */
     case NVME_ZONE_STATE_CLOSED:
-        nvme_ns_zoned_aor_dec_active(ns);
+        nvme_ns_zoned_aor_dec_active(zoned);
         /* fallthrough */
     case NVME_ZONE_STATE_FULL:
         zone->w_ptr = zone->d.zslba;
         zone->d.wp = zone->w_ptr;
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
+        nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_EMPTY);
         /* fallthrough */
     case NVME_ZONE_STATE_EMPTY:
         return NVME_SUCCESS;
@@ -1723,19 +1723,19 @@ static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
     }
 }
 
-static void nvme_zrm_auto_transition_zone(NvmeNamespace *ns)
+static void nvme_zrm_auto_transition_zone(NvmeNamespaceZoned *zoned)
 {
     NvmeZone *zone;
 
-    if (ns->params.max_open_zones &&
-        ns->nr_open_zones == ns->params.max_open_zones) {
-        zone = QTAILQ_FIRST(&ns->imp_open_zones);
+    if (zoned->max_open_zones &&
+        zoned->nr_open_zones == zoned->max_open_zones) {
+        zone = QTAILQ_FIRST(&zoned->imp_open_zones);
         if (zone) {
             /*
              * Automatically close this implicitly open zone.
              */
-            QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
-            nvme_zrm_close(ns, zone);
+            QTAILQ_REMOVE(&zoned->imp_open_zones, zone, entry);
+            nvme_zrm_close(zoned, zone);
         }
     }
 }
@@ -1744,7 +1744,7 @@ enum {
     NVME_ZRM_AUTO = 1 << 0,
 };
 
-static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
+static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
                                     NvmeZone *zone, int flags)
 {
     int act = 0;
@@ -1758,21 +1758,21 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
 
     case NVME_ZONE_STATE_CLOSED:
         if (n->params.auto_transition_zones) {
-            nvme_zrm_auto_transition_zone(ns);
+            nvme_zrm_auto_transition_zone(zoned);
         }
-        status = nvme_ns_zoned_aor_check(ns, act, 1);
+        status = nvme_ns_zoned_aor_check(zoned, act, 1);
         if (status) {
             return status;
         }
 
         if (act) {
-            nvme_ns_zoned_aor_inc_active(ns);
+            nvme_ns_zoned_aor_inc_active(zoned);
         }
 
-        nvme_ns_zoned_aor_inc_open(ns);
+        nvme_ns_zoned_aor_inc_open(zoned);
 
         if (flags & NVME_ZRM_AUTO) {
-            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
+            nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
             return NVME_SUCCESS;
         }
 
@@ -1783,7 +1783,7 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
             return NVME_SUCCESS;
         }
 
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
+        nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
 
         /* fallthrough */
 
@@ -1795,29 +1795,30 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
     }
 }
 
-static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
+static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
                                      NvmeZone *zone)
 {
-    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
+    return nvme_zrm_open_flags(n, zoned, zone, NVME_ZRM_AUTO);
 }
 
-static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
+static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
                                      NvmeZone *zone)
 {
-    return nvme_zrm_open_flags(n, ns, zone, 0);
+    return nvme_zrm_open_flags(n, zoned, zone, 0);
 }
 
-static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
+static void nvme_advance_zone_wp(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                  uint32_t nlb)
 {
     zone->d.wp += nlb;
 
     if (zone->d.wp == nvme_zoned_zone_wr_boundary(zone)) {
-        nvme_zrm_finish(ns, zone);
+        nvme_zrm_finish(zoned, zone);
     }
 }
 
-static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
+static void nvme_finalize_zoned_write(NvmeNamespaceZoned *zoned,
+                                      NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeZone *zone;
@@ -1826,10 +1827,10 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
 
     slba = le64_to_cpu(rw->slba);
     nlb = le16_to_cpu(rw->nlb) + 1;
-    zone = nvme_ns_zoned_get_by_slba(ns, slba);
+    zone = nvme_ns_zoned_get_by_slba(zoned, slba);
     assert(zone);
 
-    nvme_advance_zone_wp(ns, zone, nlb);
+    nvme_advance_zone_wp(zoned, zone, nlb);
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
@@ -1876,8 +1877,8 @@ void nvme_rw_complete_cb(void *opaque, int ret)
         block_acct_done(stats, acct);
     }
 
-    if (ns->params.zoned && nvme_is_write(req)) {
-        nvme_finalize_zoned_write(ns, req);
+    if (nvme_ns_zoned(ns) && nvme_is_write(req)) {
+        nvme_finalize_zoned_write(NVME_NAMESPACE_ZONED(ns), req);
     }
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
@@ -2503,8 +2504,8 @@ static void nvme_copy_out_completed_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (ns->params.zoned) {
-        nvme_advance_zone_wp(ns, iocb->zone, nlb);
+    if (nvme_ns_zoned(ns)) {
+        nvme_advance_zone_wp(NVME_NAMESPACE_ZONED(ns), iocb->zone, nlb);
     }
 
     iocb->idx++;
@@ -2623,8 +2624,8 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         goto invalid;
     }
 
-    if (ns->params.zoned) {
-        status = nvme_check_zone_write(ns, iocb->zone, iocb->slba, nlb);
+    if (nvme_ns_zoned(ns)) {
+        status = nvme_check_zone_write(iocb->zone, iocb->slba, nlb);
         if (status) {
             goto invalid;
         }
@@ -2737,8 +2738,8 @@ static void nvme_copy_cb(void *opaque, int ret)
         }
     }
 
-    if (ns->params.zoned) {
-        status = nvme_check_zone_read(ns, slba, nlb);
+    if (nvme_ns_zoned(ns)) {
+        status = nvme_check_zone_read(NVME_NAMESPACE_ZONED(ns), slba, nlb);
         if (status) {
             goto invalid;
         }
@@ -2806,14 +2807,16 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     iocb->slba = le64_to_cpu(copy->sdlba);
 
-    if (ns->params.zoned) {
-        iocb->zone = nvme_ns_zoned_get_by_slba(ns, iocb->slba);
+    if (nvme_ns_zoned(ns)) {
+        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+
+        iocb->zone = nvme_ns_zoned_get_by_slba(zoned, iocb->slba);
         if (!iocb->zone) {
             status = NVME_LBA_RANGE | NVME_DNR;
             goto invalid;
         }
 
-        status = nvme_zrm_auto(n, ns, iocb->zone);
+        status = nvme_zrm_auto(n, zoned, iocb->zone);
         if (status) {
             goto invalid;
         }
@@ -3081,8 +3084,8 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    if (ns->params.zoned) {
-        status = nvme_check_zone_read(ns, slba, nlb);
+    if (nvme_ns_zoned(ns)) {
+        status = nvme_check_zone_read(NVME_NAMESPACE_ZONED(ns), slba, nlb);
         if (status) {
             trace_pci_nvme_err_zone_read_not_ok(slba, nlb, status);
             goto invalid;
@@ -3161,8 +3164,10 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         goto invalid;
     }
 
-    if (ns->params.zoned) {
-        zone = nvme_ns_zoned_get_by_slba(ns, slba);
+    if (nvme_ns_zoned(ns)) {
+        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+
+        zone = nvme_ns_zoned_get_by_slba(zoned, slba);
         assert(zone);
 
         if (append) {
@@ -3209,12 +3214,12 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             }
         }
 
-        status = nvme_check_zone_write(ns, zone, slba, nlb);
+        status = nvme_check_zone_write(zone, slba, nlb);
         if (status) {
             goto invalid;
         }
 
-        status = nvme_zrm_auto(n, ns, zone);
+        status = nvme_zrm_auto(n, zoned, zone);
         if (status) {
             goto invalid;
         }
@@ -3268,14 +3273,18 @@ static inline uint16_t nvme_zone_append(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
                                             uint64_t *slba, uint32_t *zone_idx)
 {
+    NvmeNamespaceZoned *zoned;
+
     uint32_t dw10 = le32_to_cpu(c->cdw10);
     uint32_t dw11 = le32_to_cpu(c->cdw11);
 
-    if (!ns->params.zoned) {
+    if (!nvme_ns_zoned(ns)) {
         trace_pci_nvme_err_invalid_opc(c->opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
+    zoned = NVME_NAMESPACE_ZONED(ns);
+
     *slba = ((uint64_t)dw11) << 32 | dw10;
     if (unlikely(*slba >= ns->id_ns.nsze)) {
         trace_pci_nvme_err_invalid_lba_range(*slba, 0, ns->id_ns.nsze);
@@ -3283,14 +3292,14 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
         return NVME_LBA_RANGE | NVME_DNR;
     }
 
-    *zone_idx = nvme_ns_zoned_zidx(ns, *slba);
-    assert(*zone_idx < ns->num_zones);
+    *zone_idx = nvme_ns_zoned_zidx(zoned, *slba);
+    assert(*zone_idx < zoned->num_zones);
 
     return NVME_SUCCESS;
 }
 
-typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *, NvmeZoneState,
-                                 NvmeRequest *);
+typedef uint16_t (*op_handler_t)(NvmeNamespaceZoned *, NvmeZone *,
+                                 NvmeZoneState, NvmeRequest *);
 
 enum NvmeZoneProcessingMask {
     NVME_PROC_CURRENT_ZONE    = 0,
@@ -3300,30 +3309,30 @@ enum NvmeZoneProcessingMask {
     NVME_PROC_FULL_ZONES      = 1 << 3,
 };
 
-static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
+static uint16_t nvme_open_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                NvmeZoneState state, NvmeRequest *req)
 {
-    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
+    return nvme_zrm_open(nvme_ctrl(req), zoned, zone);
 }
 
-static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
+static uint16_t nvme_close_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                 NvmeZoneState state, NvmeRequest *req)
 {
-    return nvme_zrm_close(ns, zone);
+    return nvme_zrm_close(zoned, zone);
 }
 
-static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
+static uint16_t nvme_finish_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                  NvmeZoneState state, NvmeRequest *req)
 {
-    return nvme_zrm_finish(ns, zone);
+    return nvme_zrm_finish(zoned, zone);
 }
 
-static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
+static uint16_t nvme_offline_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                   NvmeZoneState state, NvmeRequest *req)
 {
     switch (state) {
     case NVME_ZONE_STATE_READ_ONLY:
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_OFFLINE);
+        nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_OFFLINE);
         /* fall through */
     case NVME_ZONE_STATE_OFFLINE:
         return NVME_SUCCESS;
@@ -3332,26 +3341,26 @@ static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
-static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
+static uint16_t nvme_set_zd_ext(NvmeNamespaceZoned *zoned, NvmeZone *zone)
 {
     uint16_t status;
     uint8_t state = nvme_zoned_zs(zone);
 
     if (state == NVME_ZONE_STATE_EMPTY) {
-        status = nvme_ns_zoned_aor_check(ns, 1, 0);
+        status = nvme_ns_zoned_aor_check(zoned, 1, 0);
         if (status) {
             return status;
         }
-        nvme_ns_zoned_aor_inc_active(ns);
+        nvme_ns_zoned_aor_inc_active(zoned);
         zone->d.za |= NVME_ZA_ZD_EXT_VALID;
-        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+        nvme_assign_zone_state(zoned, zone, NVME_ZONE_STATE_CLOSED);
         return NVME_SUCCESS;
     }
 
     return NVME_ZONE_INVAL_TRANSITION;
 }
 
-static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
+static uint16_t nvme_bulk_proc_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                     enum NvmeZoneProcessingMask proc_mask,
                                     op_handler_t op_hndlr, NvmeRequest *req)
 {
@@ -3378,13 +3387,13 @@ static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
     }
 
     if (proc_zone) {
-        status = op_hndlr(ns, zone, zs, req);
+        status = op_hndlr(zoned, zone, zs, req);
     }
 
     return status;
 }
 
-static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
+static uint16_t nvme_do_zone_op(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                 enum NvmeZoneProcessingMask proc_mask,
                                 op_handler_t op_hndlr, NvmeRequest *req)
 {
@@ -3393,11 +3402,11 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
     int i;
 
     if (!proc_mask) {
-        status = op_hndlr(ns, zone, nvme_zoned_zs(zone), req);
+        status = op_hndlr(zoned, zone, nvme_zoned_zs(zone), req);
     } else {
         if (proc_mask & NVME_PROC_CLOSED_ZONES) {
-            QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+            QTAILQ_FOREACH_SAFE(zone, &zoned->closed_zones, entry, next) {
+                status = nvme_bulk_proc_zone(zoned, zone, proc_mask, op_hndlr,
                                              req);
                 if (status && status != NVME_NO_COMPLETE) {
                     goto out;
@@ -3405,16 +3414,16 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
             }
         }
         if (proc_mask & NVME_PROC_OPENED_ZONES) {
-            QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+            QTAILQ_FOREACH_SAFE(zone, &zoned->imp_open_zones, entry, next) {
+                status = nvme_bulk_proc_zone(zoned, zone, proc_mask, op_hndlr,
                                              req);
                 if (status && status != NVME_NO_COMPLETE) {
                     goto out;
                 }
             }
 
-            QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+            QTAILQ_FOREACH_SAFE(zone, &zoned->exp_open_zones, entry, next) {
+                status = nvme_bulk_proc_zone(zoned, zone, proc_mask, op_hndlr,
                                              req);
                 if (status && status != NVME_NO_COMPLETE) {
                     goto out;
@@ -3422,8 +3431,8 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
             }
         }
         if (proc_mask & NVME_PROC_FULL_ZONES) {
-            QTAILQ_FOREACH_SAFE(zone, &ns->full_zones, entry, next) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+            QTAILQ_FOREACH_SAFE(zone, &zoned->full_zones, entry, next) {
+                status = nvme_bulk_proc_zone(zoned, zone, proc_mask, op_hndlr,
                                              req);
                 if (status && status != NVME_NO_COMPLETE) {
                     goto out;
@@ -3432,8 +3441,8 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
         }
 
         if (proc_mask & NVME_PROC_READ_ONLY_ZONES) {
-            for (i = 0; i < ns->num_zones; i++, zone++) {
-                status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr,
+            for (i = 0; i < zoned->num_zones; i++, zone++) {
+                status = nvme_bulk_proc_zone(zoned, zone, proc_mask, op_hndlr,
                                              req);
                 if (status && status != NVME_NO_COMPLETE) {
                     goto out;
@@ -3464,7 +3473,7 @@ static void nvme_zone_reset_cancel(BlockAIOCB *aiocb)
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
 
-    iocb->idx = ns->num_zones;
+    iocb->idx = NVME_NAMESPACE_ZONED(ns)->num_zones;
 
     iocb->ret = -ECANCELED;
 
@@ -3511,7 +3520,7 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     }
 
     moff = nvme_moff(ns, iocb->zone->d.zslba);
-    count = nvme_m2b(ns, ns->zone_size);
+    count = nvme_m2b(ns, NVME_NAMESPACE_ZONED(ns)->zone_size);
 
     iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, moff, count,
                                         BDRV_REQ_MAY_UNMAP,
@@ -3524,6 +3533,7 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     NvmeZoneResetAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
 
     if (ret < 0) {
         iocb->ret = ret;
@@ -3531,15 +3541,15 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     }
 
     if (iocb->zone) {
-        nvme_zrm_reset(ns, iocb->zone);
+        nvme_zrm_reset(zoned, iocb->zone);
 
         if (!iocb->all) {
             goto done;
         }
     }
 
-    while (iocb->idx < ns->num_zones) {
-        NvmeZone *zone = &ns->zone_array[iocb->idx++];
+    while (iocb->idx < zoned->num_zones) {
+        NvmeZone *zone = &zoned->zone_array[iocb->idx++];
 
         switch (nvme_zoned_zs(zone)) {
         case NVME_ZONE_STATE_EMPTY:
@@ -3564,7 +3574,7 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
 
         iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk,
                                             nvme_l2b(ns, zone->d.zslba),
-                                            nvme_l2b(ns, ns->zone_size),
+                                            nvme_l2b(ns, zoned->zone_size),
                                             BDRV_REQ_MAY_UNMAP,
                                             nvme_zone_reset_epilogue_cb,
                                             iocb);
@@ -3582,6 +3592,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
     NvmeZone *zone;
     NvmeZoneResetAIOCB *iocb;
     uint8_t *zd_ext;
@@ -3605,7 +3616,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    zone = &ns->zone_array[zone_idx];
+    zone = &zoned->zone_array[zone_idx];
     if (slba != zone->d.zslba) {
         trace_pci_nvme_err_unaligned_zone_cmd(action, slba, zone->d.zslba);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -3618,7 +3629,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_CLOSED_ZONES;
         }
         trace_pci_nvme_open_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_open_zone, req);
+        status = nvme_do_zone_op(zoned, zone, proc_mask, nvme_open_zone, req);
         break;
 
     case NVME_ZONE_ACTION_CLOSE:
@@ -3626,7 +3637,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_OPENED_ZONES;
         }
         trace_pci_nvme_close_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_close_zone, req);
+        status = nvme_do_zone_op(zoned, zone, proc_mask, nvme_close_zone, req);
         break;
 
     case NVME_ZONE_ACTION_FINISH:
@@ -3634,7 +3645,8 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_OPENED_ZONES | NVME_PROC_CLOSED_ZONES;
         }
         trace_pci_nvme_finish_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_finish_zone, req);
+        status = nvme_do_zone_op(zoned, zone, proc_mask, nvme_finish_zone,
+                                 req);
         break;
 
     case NVME_ZONE_ACTION_RESET:
@@ -3660,22 +3672,23 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             proc_mask = NVME_PROC_READ_ONLY_ZONES;
         }
         trace_pci_nvme_offline_zone(slba, zone_idx, all);
-        status = nvme_do_zone_op(ns, zone, proc_mask, nvme_offline_zone, req);
+        status = nvme_do_zone_op(zoned, zone, proc_mask, nvme_offline_zone,
+                                 req);
         break;
 
     case NVME_ZONE_ACTION_SET_ZD_EXT:
         trace_pci_nvme_set_descriptor_extension(slba, zone_idx);
-        if (all || !ns->params.zd_extension_size) {
+        if (all || !zoned->zd_extension_size) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
-        zd_ext = nvme_ns_zoned_zde(ns, zone_idx);
-        status = nvme_h2c(n, zd_ext, ns->params.zd_extension_size, req);
+        zd_ext = nvme_ns_zoned_zde(zoned, zone_idx);
+        status = nvme_h2c(n, zd_ext, zoned->zd_extension_size, req);
         if (status) {
             trace_pci_nvme_err_zd_extension_map_error(zone_idx);
             return status;
         }
 
-        status = nvme_set_zd_ext(ns, zone);
+        status = nvme_set_zd_ext(zoned, zone);
         if (status == NVME_SUCCESS) {
             trace_pci_nvme_zd_extension_set(zone_idx);
             return status;
@@ -3728,6 +3741,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
     /* cdw12 is zero-based number of dwords to return. Convert to bytes */
     uint32_t data_size = (le32_to_cpu(cmd->cdw12) + 1) << 2;
     uint32_t dw13 = le32_to_cpu(cmd->cdw13);
@@ -3753,7 +3767,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     if (zra != NVME_ZONE_REPORT && zra != NVME_ZONE_REPORT_EXTENDED) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
-    if (zra == NVME_ZONE_REPORT_EXTENDED && !ns->params.zd_extension_size) {
+    if (zra == NVME_ZONE_REPORT_EXTENDED && !zoned->zd_extension_size) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -3775,14 +3789,14 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
     zone_entry_sz = sizeof(NvmeZoneDescr);
     if (zra == NVME_ZONE_REPORT_EXTENDED) {
-        zone_entry_sz += ns->params.zd_extension_size;
+        zone_entry_sz += zoned->zd_extension_size;
     }
 
     max_zones = (data_size - sizeof(NvmeZoneReportHeader)) / zone_entry_sz;
     buf = g_malloc0(data_size);
 
-    zone = &ns->zone_array[zone_idx];
-    for (i = zone_idx; i < ns->num_zones; i++) {
+    zone = &zoned->zone_array[zone_idx];
+    for (i = zone_idx; i < zoned->num_zones; i++) {
         if (partial && nr_zones >= max_zones) {
             break;
         }
@@ -3794,8 +3808,8 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     header->nr_zones = cpu_to_le64(nr_zones);
 
     buf_p = buf + sizeof(NvmeZoneReportHeader);
-    for (; zone_idx < ns->num_zones && max_zones > 0; zone_idx++) {
-        zone = &ns->zone_array[zone_idx];
+    for (; zone_idx < zoned->num_zones && max_zones > 0; zone_idx++) {
+        zone = &zoned->zone_array[zone_idx];
         if (nvme_zone_matches_filter(zrasf, zone)) {
             z = (NvmeZoneDescr *)buf_p;
             buf_p += sizeof(NvmeZoneDescr);
@@ -3814,10 +3828,10 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
             if (zra == NVME_ZONE_REPORT_EXTENDED) {
                 if (zone->d.za & NVME_ZA_ZD_EXT_VALID) {
-                    memcpy(buf_p, nvme_ns_zoned_zde(ns, zone_idx),
-                           ns->params.zd_extension_size);
+                    memcpy(buf_p, nvme_ns_zoned_zde(zoned, zone_idx),
+                           zoned->zd_extension_size);
                 }
-                buf_p += ns->params.zd_extension_size;
+                buf_p += zoned->zd_extension_size;
             }
 
             max_zones--;
@@ -4538,8 +4552,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
     if (c->csi == NVME_CSI_NVM) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
-        return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
-                        req);
+        return nvme_c2h(n, (uint8_t *)&NVME_NAMESPACE_ZONED(ns)->id_ns,
+                        sizeof(NvmeIdNsZoned), req);
     }
 
     return NVME_INVALID_FIELD | NVME_DNR;
@@ -5339,7 +5353,7 @@ done:
 
 static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
 {
-    if (ns->params.zoned) {
+    if (nvme_ns_zoned(ns)) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8cdcaec99880..419e501239da 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -167,6 +167,8 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 
 static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
 {
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+
     uint64_t zone_size, zone_cap;
 
     /* Make sure that the values of ZNS properties are sane */
@@ -200,12 +202,12 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
      * Save the main zone geometry values to avoid
      * calculating them later again.
      */
-    ns->zone_size = zone_size / ns->lbasz;
-    ns->zone_capacity = zone_cap / ns->lbasz;
-    ns->num_zones = le64_to_cpu(ns->id_ns.nsze) / ns->zone_size;
+    zoned->zone_size = zone_size / ns->lbasz;
+    zoned->zone_capacity = zone_cap / ns->lbasz;
+    zoned->num_zones = le64_to_cpu(ns->id_ns.nsze) / zoned->zone_size;
 
     /* Do a few more sanity checks of ZNS properties */
-    if (!ns->num_zones) {
+    if (!zoned->num_zones) {
         error_setg(errp,
                    "insufficient drive capacity, must be at least the size "
                    "of one zone (%"PRIu64"B)", zone_size);
@@ -215,68 +217,70 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
+static void nvme_ns_zoned_init_state(NvmeNamespaceZoned *zoned)
 {
-    uint64_t start = 0, zone_size = ns->zone_size;
-    uint64_t capacity = ns->num_zones * zone_size;
+    uint64_t start = 0, zone_size = zoned->zone_size;
+    uint64_t capacity = zoned->num_zones * zone_size;
     NvmeZone *zone;
     int i;
 
-    ns->zone_array = g_new0(NvmeZone, ns->num_zones);
-    if (ns->params.zd_extension_size) {
-        ns->zd_extensions = g_malloc0(ns->params.zd_extension_size *
-                                      ns->num_zones);
+    zoned->zone_array = g_new0(NvmeZone, zoned->num_zones);
+    if (zoned->zd_extension_size) {
+        zoned->zd_extensions = g_malloc0(zoned->zd_extension_size *
+                                         zoned->num_zones);
     }
 
-    QTAILQ_INIT(&ns->exp_open_zones);
-    QTAILQ_INIT(&ns->imp_open_zones);
-    QTAILQ_INIT(&ns->closed_zones);
-    QTAILQ_INIT(&ns->full_zones);
+    QTAILQ_INIT(&zoned->exp_open_zones);
+    QTAILQ_INIT(&zoned->imp_open_zones);
+    QTAILQ_INIT(&zoned->closed_zones);
+    QTAILQ_INIT(&zoned->full_zones);
 
-    zone = ns->zone_array;
-    for (i = 0; i < ns->num_zones; i++, zone++) {
+    zone = zoned->zone_array;
+    for (i = 0; i < zoned->num_zones; i++, zone++) {
         if (start + zone_size > capacity) {
             zone_size = capacity - start;
         }
         zone->d.zt = NVME_ZONE_TYPE_SEQ_WRITE;
         nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
         zone->d.za = 0;
-        zone->d.zcap = ns->zone_capacity;
+        zone->d.zcap = zoned->zone_capacity;
         zone->d.zslba = start;
         zone->d.wp = start;
         zone->w_ptr = start;
         start += zone_size;
     }
 
-    ns->zone_size_log2 = 0;
-    if (is_power_of_2(ns->zone_size)) {
-        ns->zone_size_log2 = 63 - clz64(ns->zone_size);
+    zoned->zone_size_log2 = 0;
+    if (is_power_of_2(zoned->zone_size)) {
+        zoned->zone_size_log2 = 63 - clz64(zoned->zone_size);
     }
 }
 
 static void nvme_ns_zoned_init(NvmeNamespace *ns)
 {
-    NvmeIdNsZoned *id_ns_z;
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+    NvmeIdNsZoned *id_ns_z = &zoned->id_ns;
     int i;
 
-    nvme_ns_zoned_init_state(ns);
-
-    id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
+    nvme_ns_zoned_init_state(zoned);
 
     /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
-    id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
-    id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
+    id_ns_z->mar = cpu_to_le32(zoned->max_active_zones - 1);
+    id_ns_z->mor = cpu_to_le32(zoned->max_open_zones - 1);
     id_ns_z->zoc = 0;
-    id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
+
+    if (zoned->flags & NVME_NS_ZONED_CROSS_READ) {
+        id_ns_z->ozcs |= NVME_ID_NS_ZONED_OZCS_CROSS_READ;
+    }
 
     for (i = 0; i <= ns->id_ns.nlbaf; i++) {
-        id_ns_z->lbafe[i].zsze = cpu_to_le64(ns->zone_size);
+        id_ns_z->lbafe[i].zsze = cpu_to_le64(zoned->zone_size);
         id_ns_z->lbafe[i].zdes =
-            ns->params.zd_extension_size >> 6; /* Units of 64B */
+            zoned->zd_extension_size >> 6; /* Units of 64B */
     }
 
     ns->csi = NVME_CSI_ZONED;
-    ns->id_ns.nsze = cpu_to_le64(ns->num_zones * ns->zone_size);
+    ns->id_ns.nsze = cpu_to_le64(zoned->num_zones * zoned->zone_size);
     ns->id_ns.ncap = ns->id_ns.nsze;
     ns->id_ns.nuse = ns->id_ns.ncap;
 
@@ -287,19 +291,17 @@ static void nvme_ns_zoned_init(NvmeNamespace *ns)
      * we can only support DULBE if the zone size is a multiple of the
      * calculated NPDG.
      */
-    if (ns->zone_size % (ns->id_ns.npdg + 1)) {
+    if (zoned->zone_size % (ns->id_ns.npdg + 1)) {
         warn_report("the zone size (%"PRIu64" blocks) is not a multiple of "
                     "the calculated deallocation granularity (%d blocks); "
                     "DULBE support disabled",
-                    ns->zone_size, ns->id_ns.npdg + 1);
+                    zoned->zone_size, ns->id_ns.npdg + 1);
 
         ns->id_ns.nsfeat &= ~0x4;
     }
-
-    ns->id_ns_zoned = id_ns_z;
 }
 
-static void nvme_ns_zoned_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
+static void nvme_ns_zoned_clear_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone)
 {
     uint8_t state;
 
@@ -311,8 +313,8 @@ static void nvme_ns_zoned_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
             trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
             nvme_zoned_set_zs(zone, NVME_ZONE_STATE_CLOSED);
         }
-        nvme_ns_zoned_aor_inc_active(ns);
-        QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
+        nvme_ns_zoned_aor_inc_active(zoned);
+        QTAILQ_INSERT_HEAD(&zoned->closed_zones, zone, entry);
     } else {
         trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
         nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
@@ -322,29 +324,29 @@ static void nvme_ns_zoned_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
 /*
  * Close all the zones that are currently open.
  */
-static void nvme_ns_zoned_shutdown(NvmeNamespace *ns)
+static void nvme_ns_zoned_shutdown(NvmeNamespaceZoned *zoned)
 {
     NvmeZone *zone, *next;
 
-    QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
-        QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
-        nvme_ns_zoned_aor_dec_active(ns);
-        nvme_ns_zoned_clear_zone(ns, zone);
+    QTAILQ_FOREACH_SAFE(zone, &zoned->closed_zones, entry, next) {
+        QTAILQ_REMOVE(&zoned->closed_zones, zone, entry);
+        nvme_ns_zoned_aor_dec_active(zoned);
+        nvme_ns_zoned_clear_zone(zoned, zone);
     }
-    QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
-        QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
-        nvme_ns_zoned_aor_dec_open(ns);
-        nvme_ns_zoned_aor_dec_active(ns);
-        nvme_ns_zoned_clear_zone(ns, zone);
+    QTAILQ_FOREACH_SAFE(zone, &zoned->imp_open_zones, entry, next) {
+        QTAILQ_REMOVE(&zoned->imp_open_zones, zone, entry);
+        nvme_ns_zoned_aor_dec_open(zoned);
+        nvme_ns_zoned_aor_dec_active(zoned);
+        nvme_ns_zoned_clear_zone(zoned, zone);
     }
-    QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
-        QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
-        nvme_ns_zoned_aor_dec_open(ns);
-        nvme_ns_zoned_aor_dec_active(ns);
-        nvme_ns_zoned_clear_zone(ns, zone);
+    QTAILQ_FOREACH_SAFE(zone, &zoned->exp_open_zones, entry, next) {
+        QTAILQ_REMOVE(&zoned->exp_open_zones, zone, entry);
+        nvme_ns_zoned_aor_dec_open(zoned);
+        nvme_ns_zoned_aor_dec_active(zoned);
+        nvme_ns_zoned_clear_zone(zoned, zone);
     }
 
-    assert(ns->nr_open_zones == 0);
+    assert(zoned->nr_open_zones == 0);
 }
 
 static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
@@ -411,9 +413,20 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         return -1;
     }
     if (ns->params.zoned) {
+        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+
         if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
             return -1;
         }
+
+        /* copy device parameters */
+        zoned->zd_extension_size = ns->params.zd_extension_size;
+        zoned->max_open_zones = ns->params.max_open_zones;
+        zoned->max_active_zones = ns->params.max_open_zones;
+        if (ns->params.cross_zone_read) {
+            zoned->flags |= NVME_NS_ZONED_CROSS_READ;
+        }
+
         nvme_ns_zoned_init(ns);
     }
 
@@ -428,17 +441,18 @@ void nvme_ns_drain(NvmeNamespace *ns)
 void nvme_ns_shutdown(NvmeNamespace *ns)
 {
     blk_flush(ns->blkconf.blk);
-    if (ns->params.zoned) {
-        nvme_ns_zoned_shutdown(ns);
+    if (nvme_ns_zoned(ns)) {
+        nvme_ns_zoned_shutdown(NVME_NAMESPACE_ZONED(ns));
     }
 }
 
 void nvme_ns_cleanup(NvmeNamespace *ns)
 {
-    if (ns->params.zoned) {
-        g_free(ns->id_ns_zoned);
-        g_free(ns->zone_array);
-        g_free(ns->zd_extensions);
+    if (nvme_ns_zoned(ns)) {
+        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+
+        g_free(zoned->zone_array);
+        g_free(zoned->zd_extensions);
     }
 }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 99d8b9066cc9..9cfb172101a9 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -84,12 +84,6 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
 #define NVME_NS(obj) \
     OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
 
-typedef struct NvmeZone {
-    NvmeZoneDescr   d;
-    uint64_t        w_ptr;
-    QTAILQ_ENTRY(NvmeZone) entry;
-} NvmeZone;
-
 typedef struct NvmeNamespaceParams {
     bool     detached;
     bool     shared;
@@ -116,6 +110,43 @@ typedef struct NvmeNamespaceParams {
     uint32_t zd_extension_size;
 } NvmeNamespaceParams;
 
+typedef struct NvmeZone {
+    NvmeZoneDescr   d;
+    uint64_t        w_ptr;
+    QTAILQ_ENTRY(NvmeZone) entry;
+} NvmeZone;
+
+enum {
+    NVME_NS_ZONED_CROSS_READ = 1 << 0,
+};
+
+typedef struct NvmeNamespaceZoned {
+    NvmeIdNsZoned id_ns;
+
+    uint32_t num_zones;
+    NvmeZone *zone_array;
+
+    uint64_t zone_size;
+    uint32_t zone_size_log2;
+
+    uint64_t zone_capacity;
+
+    uint32_t zd_extension_size;
+    uint8_t  *zd_extensions;
+
+    uint32_t max_open_zones;
+    int32_t  nr_open_zones;
+    uint32_t max_active_zones;
+    int32_t  nr_active_zones;
+
+    unsigned long flags;
+
+    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) closed_zones;
+    QTAILQ_HEAD(, NvmeZone) full_zones;
+} NvmeNamespaceZoned;
+
 typedef struct NvmeNamespace {
     DeviceState  parent_obj;
     BlockConf    blkconf;
@@ -132,27 +163,17 @@ typedef struct NvmeNamespace {
 
     QTAILQ_ENTRY(NvmeNamespace) entry;
 
-    NvmeIdNsZoned   *id_ns_zoned;
-    NvmeZone        *zone_array;
-    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) closed_zones;
-    QTAILQ_HEAD(, NvmeZone) full_zones;
-    uint32_t        num_zones;
-    uint64_t        zone_size;
-    uint64_t        zone_capacity;
-    uint32_t        zone_size_log2;
-    uint8_t         *zd_extensions;
-    int32_t         nr_open_zones;
-    int32_t         nr_active_zones;
-
     NvmeNamespaceParams params;
 
     struct {
         uint32_t err_rec;
     } features;
+
+    NvmeNamespaceZoned zoned;
 } NvmeNamespace;
 
+#define NVME_NAMESPACE_ZONED(ns) (&(ns)->zoned)
+
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
@@ -188,6 +209,11 @@ void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
 
+static inline bool nvme_ns_zoned(NvmeNamespace *ns)
+{
+    return ns->csi == NVME_CSI_ZONED;
+}
+
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
     NvmeAerResult result;
diff --git a/hw/nvme/zoned.h b/hw/nvme/zoned.h
index e98b282cb615..277d70aee5c7 100644
--- a/hw/nvme/zoned.h
+++ b/hw/nvme/zoned.h
@@ -17,10 +17,10 @@ static inline void nvme_zoned_set_zs(NvmeZone *zone, NvmeZoneState state)
     zone->d.zs = state << 4;
 }
 
-static inline uint64_t nvme_zoned_zone_rd_boundary(NvmeNamespace *ns,
+static inline uint64_t nvme_zoned_zone_rd_boundary(NvmeNamespaceZoned *zoned,
                                                    NvmeZone *zone)
 {
-    return zone->d.zslba + ns->zone_size;
+    return zone->d.zslba + zoned->zone_size;
 }
 
 static inline uint64_t nvme_zoned_zone_wr_boundary(NvmeZone *zone)
@@ -37,61 +37,63 @@ static inline bool nvme_zoned_wp_valid(NvmeZone *zone)
            st != NVME_ZONE_STATE_OFFLINE;
 }
 
-static inline uint32_t nvme_ns_zoned_zidx(NvmeNamespace *ns, uint64_t slba)
+static inline uint32_t nvme_ns_zoned_zidx(NvmeNamespaceZoned *zoned,
+                                          uint64_t slba)
 {
-    return ns->zone_size_log2 > 0 ? slba >> ns->zone_size_log2 :
-                                    slba / ns->zone_size;
+    return zoned->zone_size_log2 > 0 ?
+        slba >> zoned->zone_size_log2 : slba / zoned->zone_size;
 }
 
-static inline NvmeZone *nvme_ns_zoned_get_by_slba(NvmeNamespace *ns, uint64_t slba)
+static inline NvmeZone *nvme_ns_zoned_get_by_slba(NvmeNamespaceZoned *zoned,
+                                                  uint64_t slba)
 {
-    uint32_t zone_idx = nvme_ns_zoned_zidx(ns, slba);
+    uint32_t zone_idx = nvme_ns_zoned_zidx(zoned, slba);
 
-    assert(zone_idx < ns->num_zones);
-    return &ns->zone_array[zone_idx];
+    assert(zone_idx < zoned->num_zones);
+    return &zoned->zone_array[zone_idx];
 }
 
-static inline uint8_t *nvme_ns_zoned_zde(NvmeNamespace *ns, uint32_t zone_idx)
+static inline uint8_t *nvme_ns_zoned_zde(NvmeNamespaceZoned *zoned,
+                                         uint32_t zone_idx)
 {
-    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
+    return &zoned->zd_extensions[zone_idx * zoned->zd_extension_size];
 }
 
-static inline void nvme_ns_zoned_aor_inc_open(NvmeNamespace *ns)
+static inline void nvme_ns_zoned_aor_inc_open(NvmeNamespaceZoned *zoned)
 {
-    assert(ns->nr_open_zones >= 0);
-    if (ns->params.max_open_zones) {
-        ns->nr_open_zones++;
-        assert(ns->nr_open_zones <= ns->params.max_open_zones);
+    assert(zoned->nr_open_zones >= 0);
+    if (zoned->max_open_zones) {
+        zoned->nr_open_zones++;
+        assert(zoned->nr_open_zones <= zoned->max_open_zones);
     }
 }
 
-static inline void nvme_ns_zoned_aor_dec_open(NvmeNamespace *ns)
+static inline void nvme_ns_zoned_aor_dec_open(NvmeNamespaceZoned *zoned)
 {
-    if (ns->params.max_open_zones) {
-        assert(ns->nr_open_zones > 0);
-        ns->nr_open_zones--;
+    if (zoned->max_open_zones) {
+        assert(zoned->nr_open_zones > 0);
+        zoned->nr_open_zones--;
     }
-    assert(ns->nr_open_zones >= 0);
+    assert(zoned->nr_open_zones >= 0);
 }
 
-static inline void nvme_ns_zoned_aor_inc_active(NvmeNamespace *ns)
+static inline void nvme_ns_zoned_aor_inc_active(NvmeNamespaceZoned *zoned)
 {
-    assert(ns->nr_active_zones >= 0);
-    if (ns->params.max_active_zones) {
-        ns->nr_active_zones++;
-        assert(ns->nr_active_zones <= ns->params.max_active_zones);
+    assert(zoned->nr_active_zones >= 0);
+    if (zoned->max_active_zones) {
+        zoned->nr_active_zones++;
+        assert(zoned->nr_active_zones <= zoned->max_active_zones);
     }
 }
 
-static inline void nvme_ns_zoned_aor_dec_active(NvmeNamespace *ns)
+static inline void nvme_ns_zoned_aor_dec_active(NvmeNamespaceZoned *zoned)
 {
-    if (ns->params.max_active_zones) {
-        assert(ns->nr_active_zones > 0);
-        ns->nr_active_zones--;
-        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    if (zoned->max_active_zones) {
+        assert(zoned->nr_active_zones > 0);
+        zoned->nr_active_zones--;
+        assert(zoned->nr_active_zones >= zoned->nr_open_zones);
     }
-    assert(ns->nr_active_zones >= 0);
+    assert(zoned->nr_active_zones >= 0);
 }
 
-
 #endif /* HW_NVME_ZONED_H */
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e3bd47bf76ab..2bcabe561589 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1338,6 +1338,10 @@ enum NvmeCsi {
 
 #define NVME_SET_CSI(vec, csi) (vec |= (uint8_t)(1 << (csi)))
 
+enum NvmeIdNsZonedOzcs {
+    NVME_ID_NS_ZONED_OZCS_CROSS_READ = 1 << 0,
+};
+
 typedef struct QEMU_PACKED NvmeIdNsZoned {
     uint16_t    zoc;
     uint16_t    ozcs;
-- 
2.33.0


