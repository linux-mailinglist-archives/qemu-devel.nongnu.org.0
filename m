Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A363149ED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:04:48 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9O0t-0005Nu-OE
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVf-0005Or-SG; Tue, 09 Feb 2021 02:32:33 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVV-0005iT-Cr; Tue, 09 Feb 2021 02:32:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 07F93BA1;
 Tue,  9 Feb 2021 02:31:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 09 Feb 2021 02:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Mlk0y9wyEEH+F
 fDrruesoeHuT5jNnMCFryCD1HQlUYE=; b=zCnAucFrymH+FMv5ZA2YvwdyG0UKT
 C0GiGk3LYa7ICH7XT2ZK8gasPGuqx5jcZCSPa/AON3VZLZKli9LuF03G58Ms9LGr
 +3Cal6zzDuEepVyV4yWzz4NBGgwwmC7DKz5nc86MkJLObFIYvugqUmqfg7I4jzj8
 t0jyS+magETaUvlyFnAjL3arpWN39KVAmp+PBiCQbtIlVB/dEdjYa7c4o8Tebv5H
 FH8DOL3Y9uLH7GZ6Ow1HtV7gSN8D2TzSePfz4+ktcVGL3J8OUCKOBSrFAt8aEwvz
 A0QTnR/S5wsBUsxF/Ll+gYkXPnCtLxNK8B9z1TPiz+ldulRz/USdL8Bdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Mlk0y9wyEEH+FfDrruesoeHuT5jNnMCFryCD1HQlUYE=; b=adZXqUhD
 8zsYuZqIMTlYL9tNTr1SUsQfYrczhmUAQyi2/YUcASQ71bBHedwSGQJFq69DPq7M
 tZ6e9S8NYJoaqsYIiVA78EpNBUGlHgW1tY347UC9OqCfIHVSGSciz+hNJeUqK+WL
 ZK/1TuXDrbb34fdYxes/r5Yut/YakV5aUPV0pSFk7dF0Gw4XIBSg5xK0M4qutTnM
 GYRZ2iDZm/T6WTNzjpE17hLM+P84N7K/N0+FoWxpVCXfXsC1yH9Q79NTr8rqMPet
 BSGxj3B3EQJLP0oIIvcKYdcqaeFXZYugahZQGm3AvLouPqYYHDqXOHBq7u0XfnRU
 KKcq3SHPcAwFcg==
X-ME-Sender: <xms:bjoiYIM7X-nrPazYv8dh4bvylNsUL4BUX8wapGBvgCihgyIK8jRqYA>
 <xme:bjoiYH5ixGe_tM5Nijd-E8kDJ8eOdNCsm9TgMnvHK7MfnYu0_Bghwc2OV7iOtZYy-
 kGRw-6d7nVaDGS8OpU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bjoiYK1rfAUhznXMrnSnjvgyLON7tFFI7GoHawGJULFPFOAgK5IU8A>
 <xmx:bjoiYAyIpF_IW9Ng5cMiUq8tP1OzmpqyTrdT9KEFflOnHCpjBiEDng>
 <xmx:bjoiYMsPHKcyERexPJCkUOfTLTlWn8kg_ZtcVdyymylYRk30BN5aUQ>
 <xmx:bjoiYGAEL5RK7mYFntSzRmrbWst7kaxn-JOcnIoPgBm3HuxkZeFFKpRfQW0>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 176F8108005B;
 Tue,  9 Feb 2021 02:31:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 23/56] hw/block/nvme: merge implicitly/explicitly opened
 processing masks
Date: Tue,  9 Feb 2021 08:30:28 +0100
Message-Id: <20210209073101.548811-24-its@irrelevant.dk>
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

Implicitly and explicitly opended zones are always bulk processed
together, so merge the two processing masks.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 551878338e5d..a7245a7e05a1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1740,11 +1740,10 @@ typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *,
 
 enum NvmeZoneProcessingMask {
     NVME_PROC_CURRENT_ZONE    = 0,
-    NVME_PROC_IMP_OPEN_ZONES  = 1 << 0,
-    NVME_PROC_EXP_OPEN_ZONES  = 1 << 1,
-    NVME_PROC_CLOSED_ZONES    = 1 << 2,
-    NVME_PROC_READ_ONLY_ZONES = 1 << 3,
-    NVME_PROC_FULL_ZONES      = 1 << 4,
+    NVME_PROC_OPENED_ZONES    = 1 << 0,
+    NVME_PROC_CLOSED_ZONES    = 1 << 1,
+    NVME_PROC_READ_ONLY_ZONES = 1 << 2,
+    NVME_PROC_FULL_ZONES      = 1 << 3,
 };
 
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
@@ -1885,10 +1884,8 @@ static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
 
     switch (zs) {
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        proc_zone = proc_mask & NVME_PROC_IMP_OPEN_ZONES;
-        break;
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        proc_zone = proc_mask & NVME_PROC_EXP_OPEN_ZONES;
+        proc_zone = proc_mask & NVME_PROC_OPENED_ZONES;
         break;
     case NVME_ZONE_STATE_CLOSED:
         proc_zone = proc_mask & NVME_PROC_CLOSED_ZONES;
@@ -1929,15 +1926,14 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
                 }
             }
         }
-        if (proc_mask & NVME_PROC_IMP_OPEN_ZONES) {
+        if (proc_mask & NVME_PROC_OPENED_ZONES) {
             QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
                 status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
                 if (status != NVME_SUCCESS) {
                     goto out;
                 }
             }
-        }
-        if (proc_mask & NVME_PROC_EXP_OPEN_ZONES) {
+
             QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
                 status = nvme_bulk_proc_zone(ns, zone, proc_mask, op_hndlr);
                 if (status != NVME_SUCCESS) {
@@ -2012,7 +2008,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 
     case NVME_ZONE_ACTION_CLOSE:
         if (all) {
-            proc_mask = NVME_PROC_IMP_OPEN_ZONES | NVME_PROC_EXP_OPEN_ZONES;
+            proc_mask = NVME_PROC_OPENED_ZONES;
         }
         trace_pci_nvme_close_zone(slba, zone_idx, all);
         status = nvme_do_zone_op(ns, zone, proc_mask, nvme_close_zone);
@@ -2020,8 +2016,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 
     case NVME_ZONE_ACTION_FINISH:
         if (all) {
-            proc_mask = NVME_PROC_IMP_OPEN_ZONES | NVME_PROC_EXP_OPEN_ZONES |
-                        NVME_PROC_CLOSED_ZONES;
+            proc_mask = NVME_PROC_OPENED_ZONES | NVME_PROC_CLOSED_ZONES;
         }
         trace_pci_nvme_finish_zone(slba, zone_idx, all);
         status = nvme_do_zone_op(ns, zone, proc_mask, nvme_finish_zone);
@@ -2029,8 +2024,8 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 
     case NVME_ZONE_ACTION_RESET:
         if (all) {
-            proc_mask = NVME_PROC_IMP_OPEN_ZONES | NVME_PROC_EXP_OPEN_ZONES |
-                        NVME_PROC_CLOSED_ZONES | NVME_PROC_FULL_ZONES;
+            proc_mask = NVME_PROC_OPENED_ZONES | NVME_PROC_CLOSED_ZONES |
+                NVME_PROC_FULL_ZONES;
         }
         trace_pci_nvme_reset_zone(slba, zone_idx, all);
         status = nvme_do_zone_op(ns, zone, proc_mask, nvme_reset_zone);
-- 
2.30.0


