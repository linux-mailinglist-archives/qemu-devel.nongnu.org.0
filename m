Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCA2F1263
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:39:35 +0100 (CET)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywTt-0004cI-B5
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN7-0002PF-3w; Mon, 11 Jan 2021 07:32:33 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN5-0006rO-0O; Mon, 11 Jan 2021 07:32:32 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1843B25D4;
 Mon, 11 Jan 2021 07:32:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 07:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hMXrkCHmnF210
 sq0C9gh99fzq712fpTo7ozj3Lht6EE=; b=y28r4WEhrFv07B25gWyLjlkEha7vn
 KjkIyFtd9oyVdlojiNudSb2c/i3uhIeeI28LvjcXNskIVnIyZjxB0kMQsxRjtC2U
 jPhjPu9Wb1Nq9lsPddo3U3bKexN/znIyF8QFaBStPYBZP9BXn+dS62htHCI5MXUj
 Xf6b2Mt64kSvP0D+iS+ECEv2n09q3qXx2EEpAC1MGIGryyySVepfCMEbwo2yMTgx
 7VUugoWwzBoPLE3cxmSd5S/5HC/P2iIk9GPK24YmIw3CO/YRs9WHAFg8H1UerofX
 S4EWGaewfnXSbXeq+wghcraEFijwq3GCX0IxVmmYVtNy0TItig2vVsoig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hMXrkCHmnF210sq0C9gh99fzq712fpTo7ozj3Lht6EE=; b=lWuFgtUm
 etr+4+3BwM+ac+8M++XL5AxjKDiK8t9G5fPb6gDsFRZAlBXXXwr46G1bwNHLdzQc
 qi2Jf60F0yPt3tXxd4Ry17BkefL3W6qSGREBVXzkdlpqqi8l8B1eXPyRkISqGuIC
 PJAaq2WouslTAvvYNH4iJxWr/XjeD7Y8FkEmjkSZBr9e+ox81SG0ZWJkCZ/EZ6BO
 SW986NgYei5pBdXoAS+SBBQSaRLMnhdWFDxAG9FA4huzoD2JVAe3REq3WQIVmHb1
 EsgwEpr7qQXQdvj75yX+coJzreJ3fclZyAP+Y9rRV+o1bdZiVynyNQ76w6joKLCd
 406TOOu3yiEj7w==
X-ME-Sender: <xms:XEX8Xwg78awX_pbO8LtGn6-DECUIZuvS9tb_gnKyPGkCxklwLTV8EQ>
 <xme:XEX8X4_TlCEaUAIlejV8LHSjxnhRvcd3DtpQVtvTI9xKDeJPZhcRbFoTgEbtXvoMS
 tUgLJJhn3Dw4Z2ACHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XEX8X0-Daa15U8hbSx85wRRbSjWyPV_YpNlu-DU7KeSbQ0MSE0SZnA>
 <xmx:XEX8X5DPZPI8n3h-rg4YOdp7GO_Qe_-wjaKkmskbwKIm27px_gMLKw>
 <xmx:XEX8X8zJJg-tsm0880Ennqg6uyVfTrPVzmrfldF0P2SMFIulyY523g>
 <xmx:XEX8X1MQZ_UDhnHOwOMTCzDiMaCqfZHArfafGfUVJ0GLcrRzJ_2h-Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AAD8108006B;
 Mon, 11 Jan 2021 07:32:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/block/nvme: merge implicitly/explicitly opened
 processing masks
Date: Mon, 11 Jan 2021 13:32:19 +0100
Message-Id: <20210111123223.76248-3-its@irrelevant.dk>
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

Implicitly and explicitly opended zones are always bulk processed
together, so merge the two processing masks.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cba509e90537..8b25c509c6b5 100644
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


