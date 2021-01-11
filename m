Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF72F127C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:44:14 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywYP-0006sq-C6
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN8-0002QC-9D; Mon, 11 Jan 2021 07:32:34 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:52653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN6-0006s0-8n; Mon, 11 Jan 2021 07:32:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F0992625;
 Mon, 11 Jan 2021 07:32:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 07:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yaC//JjLJmIFT
 bBrZW4NBVptvALMn2zsj/kaY44uCII=; b=jGfYZHL4Tz6lOSmM4XVYr84E3xrXM
 UZYwXwd0NmQRj3YHWNd3aGoTUVpdkEzMOgTh4e26ZAfv5v7ItaKvRmnCCpeHjcw0
 RVf4pc5CjDtdkxgN1M+zTq4n7wc+pKol9/CoWazfzZani2YAnyfcPCD/IxpFzgpE
 DTR08C9/xjjhvc+ccewQGf2UTfbZoPM5ZoD5ktjt0sVpKljXrNIP9HPrE/QY+6VV
 tnwOXqqiqfs3mo7FqMPxyxIQW0M58U8RsU8Y65bP9goCl5jrpbiPkeSJR5cTO//W
 9kNMV/lNAH1cREBxrFDqyMv1e+hqmgi21TZy2XoyocfWYuqPYBowkES5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yaC//JjLJmIFTbBrZW4NBVptvALMn2zsj/kaY44uCII=; b=IGyK6Ked
 I2xFqdeawX3i8eIx8kMvhd3L80eFrIowwF2AQhaPAB40cZtAMv6Sz4OkDjzX0aF/
 1qfVZ/3MdiiYIYUVoSrvSOlageVmEyZzdmuTNUuoGsNZ227JpMWYx5VngeQULuq8
 urhOANFiDRYu81DJ6/7i8H18Nzqxbe6P3m5DVBjuzHhcosB79nJe9nkVBYhraVzf
 ht1+ym3Ii83MSKikyqnL+1ieXOvtSwMtJ0ESKHZX+yzKyqEzLQ5nWognyYzXdPXn
 ywtnTNOi25FaV1/OYDzoAVY+/sTvZ2/UVC/6T97JMRb5SSDV9/z173GU1Zrak37w
 k3Q+tGOL3IzMdA==
X-ME-Sender: <xms:XUX8Xy2P44lR9LBLnv2teIH2H2lGJwbokeNIRunVpJJtSpKSgFHRmw>
 <xme:XUX8X8EkMY_OmphzWE8Zzuc0MsEZTr8TngGEKpkXNPFRFjRQC1TdRgAGLHybRpan7
 lYpJ3grXbTvEb64hkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XUX8X_4ZyMwdbsUu8IrhT7EDLeSZKqncdJQlvHSv8EtxR2EUY2q-jw>
 <xmx:XUX8XytT1QsQ6gbX24XGmXDFK403-_BsU8xtugvTFF9noiv7eBxo4g>
 <xmx:XUX8Xw5BclV60KeKjMuoHNCNQu75d5pzM5x186ZotTXRZw1itiQ3eA>
 <xmx:XUX8X-BZBRDMjwhz0f3rMMevk_zdY_Ud11M8YuHHL0mkGAA7tr9HEA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D94611080057;
 Mon, 11 Jan 2021 07:32:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/block/nvme: enum style fix
Date: Mon, 11 Jan 2021 13:32:20 +0100
Message-Id: <20210111123223.76248-4-its@irrelevant.dk>
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

Align with existing style and use a typedef for header-file enums.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h   |  4 ++--
 include/block/nvme.h |  4 ++--
 hw/block/nvme.c      | 19 +++++++++----------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index f8f3c28c360b..a0baa5f6d44c 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -102,12 +102,12 @@ static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
 
 typedef struct NvmeCtrl NvmeCtrl;
 
-static inline enum NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
+static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
 {
     return zone->d.zs >> 4;
 }
 
-static inline void nvme_set_zone_state(NvmeZone *zone, enum NvmeZoneState state)
+static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
 {
     zone->d.zs = state << 4;
 }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9494246f1f59..45b2678db1f0 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1212,7 +1212,7 @@ typedef struct QEMU_PACKED NvmeZoneDescr {
     uint8_t     rsvd32[32];
 } NvmeZoneDescr;
 
-enum NvmeZoneState {
+typedef enum NvmeZoneState {
     NVME_ZONE_STATE_RESERVED         = 0x00,
     NVME_ZONE_STATE_EMPTY            = 0x01,
     NVME_ZONE_STATE_IMPLICITLY_OPEN  = 0x02,
@@ -1221,7 +1221,7 @@ enum NvmeZoneState {
     NVME_ZONE_STATE_READ_ONLY        = 0x0D,
     NVME_ZONE_STATE_FULL             = 0x0E,
     NVME_ZONE_STATE_OFFLINE          = 0x0F,
-};
+} NvmeZoneState;
 
 static inline void _nvme_check_size(void)
 {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8b25c509c6b5..7c2ec17ad7d9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -198,7 +198,7 @@ static uint16_t nvme_sqid(NvmeRequest *req)
 }
 
 static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
-                                   enum NvmeZoneState state)
+                                   NvmeZoneState state)
 {
     if (QTAILQ_IN_USE(zone, entry)) {
         switch (nvme_get_zone_state(zone)) {
@@ -1735,8 +1735,7 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
     return NVME_SUCCESS;
 }
 
-typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *,
-                                 enum NvmeZoneState);
+typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *, NvmeZoneState);
 
 enum NvmeZoneProcessingMask {
     NVME_PROC_CURRENT_ZONE    = 0,
@@ -1747,7 +1746,7 @@ enum NvmeZoneProcessingMask {
 };
 
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
-                               enum NvmeZoneState state)
+                               NvmeZoneState state)
 {
     uint16_t status;
 
@@ -1780,7 +1779,7 @@ static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                enum NvmeZoneState state)
+                                NvmeZoneState state)
 {
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1796,7 +1795,7 @@ static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                 enum NvmeZoneState state)
+                                 NvmeZoneState state)
 {
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1819,7 +1818,7 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                enum NvmeZoneState state)
+                                NvmeZoneState state)
 {
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1842,7 +1841,7 @@ static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
 }
 
 static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
-                                  enum NvmeZoneState state)
+                                  NvmeZoneState state)
 {
     switch (state) {
     case NVME_ZONE_STATE_READ_ONLY:
@@ -1879,7 +1878,7 @@ static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
                                     op_handler_t op_hndlr)
 {
     uint16_t status = NVME_SUCCESS;
-    enum NvmeZoneState zs = nvme_get_zone_state(zone);
+    NvmeZoneState zs = nvme_get_zone_state(zone);
     bool proc_zone;
 
     switch (zs) {
@@ -2077,7 +2076,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 
 static bool nvme_zone_matches_filter(uint32_t zafs, NvmeZone *zl)
 {
-    enum NvmeZoneState zs = nvme_get_zone_state(zl);
+    NvmeZoneState zs = nvme_get_zone_state(zl);
 
     switch (zafs) {
     case NVME_ZONE_REPORT_ALL:
-- 
2.30.0


