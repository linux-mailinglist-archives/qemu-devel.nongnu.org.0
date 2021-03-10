Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48DA3339FA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:29:29 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw5o-000127-JA
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXh-0007fr-VT; Wed, 10 Mar 2021 04:54:13 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXd-0005Ed-Pp; Wed, 10 Mar 2021 04:54:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 008E05C0160;
 Wed, 10 Mar 2021 04:54:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=L/feqfyPV5BO1
 kaBDO9LPqVkh3KJYYGE+O2L+ea2RuA=; b=BcVh5QDGNIeqkI6h/PuQj6ApExScX
 QtcMyLVVXCTngOYmKuxctVQg34I1doD0R3F88m1DThMC5abnMZL/LkINiIdNHiXF
 ekVh17j60cSyoRvAzu96SX8WrBBWPeuBC9fQMfhYiPDJpqa7e2waYvnpzvsdyrd0
 dYSURpl9qdqnnC2pPa3kGe9f+HXgTRDNaUUHglKyVaUpm1Wz2D1uVWstV98L7zwI
 MtKE6rX4YKUefWDisbqAR+BxiyxdRQM5wJFP/NiwwKQSEUz/HMdm0rvroPHjBCdM
 l3wd6ydoSGjy7/dggFWxa6Z4VsTSPGy98QmkHNG9vIaKU69y+XGjCaYyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=L/feqfyPV5BO1kaBDO9LPqVkh3KJYYGE+O2L+ea2RuA=; b=pA8UOO7O
 3o/26TIjFupJzJowbJP0LjuoXrwuAeX78/bxuP3t1T/epTigIEoV8/Z0GzOtiN2B
 mUH6TJgSiRlatyNgIyXRVZgBUG0AySU8EARY/Tu6VlpbJvxCdiL+tc7oToDomVZ9
 sZiEZezYeKkdB32T+LJRMjbH/v0uLTPkLuQPFYh9gwUkPVVQ0ELebs5Dz+0qI9Zc
 qoz1RECaE92t/utUNqvoLX2gj4q8uAp0J7cc6Rmgd3BffYStmHjh3ayIVgcrw697
 nQWpyl06IBBRo8wwlJfISPskRKz8NBkIiADtbyBJi9RcktL3Or7j7hC0fTpFKtDp
 r7qpRnKyCrA2YQ==
X-ME-Sender: <xms:QJdIYI3i_llhYz7vAvWsJfbevNIQ8QRJu5BFa07iZ4YHw955Y1djMQ>
 <xme:QJdIYDFAA7l2TfCndO-NgqjvLYkCkAm57YN_iLyGIn06oAkfQ9dUCK7lK1xjd88tZ
 GFlVWex1Jb3dYaswS0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QJdIYA6zmlTxf11EXM4t4u9mij1DTQcoKQahe3yKfGBgBW49h-yQqw>
 <xmx:QJdIYB09iHxP7AXE4kb6kgPI3KMDDx_58FiZydc7MGLHr1pvyYmuOQ>
 <xmx:QJdIYLHX6SV8ZR6CM7bJO0kz-XyAzW9GdWrA_mnBmka_gTnCDbmswA>
 <xmx:QJdIYK048WjAoz0WYdBYdZE6uIZvPlk_6zrWBaxW6h1bTUMAmxw6Gg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A2F3240057;
 Wed, 10 Mar 2021 04:54:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/13] hw/block/nvme: split zone check/set geometry
Date: Wed, 10 Mar 2021 10:53:46 +0100
Message-Id: <20210310095347.682395-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In preparation for Format NVM support, split zone geometry check from
the zone geometry set function.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 76 ++++++++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 192c6c923ab4..1ef2ad4ae273 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -166,38 +166,59 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
+static int nvme_verify_zone_geometry(size_t ns_size, uint8_t lbads,
+                                     uint16_t ms, uint64_t zone_size,
+                                     uint64_t zone_cap, Error **errp)
 {
-    uint64_t zone_size, zone_cap;
-    uint32_t lbasz = nvme_lsize(ns);
+    size_t lbasz = 1 << lbads;
 
-    /* Make sure that the values of ZNS properties are sane */
-    if (ns->params.zone_size_bs) {
-        zone_size = ns->params.zone_size_bs;
-    } else {
-        zone_size = NVME_DEFAULT_ZONE_SIZE;
-    }
-    if (ns->params.zone_cap_bs) {
-        zone_cap = ns->params.zone_cap_bs;
-    } else {
+    if (!zone_cap) {
         zone_cap = zone_size;
     }
+
     if (zone_cap > zone_size) {
         error_setg(errp, "zone capacity %"PRIu64"B exceeds "
                    "zone size %"PRIu64"B", zone_cap, zone_size);
         return -1;
     }
+
     if (zone_size < lbasz) {
         error_setg(errp, "zone size %"PRIu64"B too small, "
-                   "must be at least %"PRIu32"B", zone_size, lbasz);
-        return -1;
-    }
-    if (zone_cap < lbasz) {
-        error_setg(errp, "zone capacity %"PRIu64"B too small, "
-                   "must be at least %"PRIu32"B", zone_cap, lbasz);
+                   "must be at least %zuB", zone_size, lbasz);
         return -1;
     }
 
+    if (zone_cap < lbasz) {
+        error_setg(errp, "zone capacity %"PRIu64"B too small, "
+                   "must be at least %zuB", zone_cap, lbasz);
+        return -1;
+    }
+
+    if (!(__nvme_nlbas(ns_size, lbads, ms) / (zone_size / lbasz))) {
+        error_setg(errp, "insufficient drive capacity, must be at least the "
+                   "size of one zone (%"PRIu64"B)", zone_size);
+        return -1;
+    }
+
+    return 0;
+}
+
+
+static int nvme_ns_zoned_set_geometry(NvmeNamespace *ns, Error **errp)
+{
+    uint64_t zone_size, zone_cap;
+    uint32_t lbasz = nvme_lsize(ns);
+
+    zone_size = zone_cap = ns->params.zone_size_bs;
+
+    if (ns->params.zone_cap_bs) {
+        zone_cap = ns->params.zone_cap_bs;
+    }
+
+    if (nvme_verify_zone_geometry(ns->size, nvme_ns_lbads(ns), nvme_msize(ns),
+                                  zone_size, zone_cap, errp)) {
+        return -1;
+    }
     /*
      * Save the main zone geometry values to avoid
      * calculating them later again.
@@ -206,14 +227,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
     ns->zone_capacity = zone_cap / lbasz;
     ns->num_zones = nvme_ns_nlbas(ns) / ns->zone_size;
 
-    /* Do a few more sanity checks of ZNS properties */
-    if (!ns->num_zones) {
-        error_setg(errp,
-                   "insufficient drive capacity, must be at least the size "
-                   "of one zone (%"PRIu64"B)", zone_size);
-        return -1;
-    }
-
     return 0;
 }
 
@@ -256,11 +269,15 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     }
 }
 
-static void nvme_ns_init_zoned(NvmeNamespace *ns)
+static int nvme_ns_init_zoned(NvmeNamespace *ns, Error **errp)
 {
     NvmeIdNsZoned *id_ns_z;
     int i;
 
+    if (nvme_ns_zoned_set_geometry(ns, errp)) {
+        return -1;
+    }
+
     nvme_ns_zoned_init_state(ns);
 
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
@@ -299,6 +316,8 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
     }
 
     ns->id_ns_zoned = id_ns_z;
+
+    return 0;
 }
 
 static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
@@ -407,10 +426,9 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         return -1;
     }
     if (ns->params.zoned) {
-        if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
+        if (nvme_ns_init_zoned(ns, errp)) {
             return -1;
         }
-        nvme_ns_init_zoned(ns);
     }
 
     return 0;
-- 
2.30.1


