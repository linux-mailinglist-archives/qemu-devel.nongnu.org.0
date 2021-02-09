Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F7314A30
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:23:49 +0100 (CET)
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OJI-0006iS-LH
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVb-0005N5-RW; Tue, 09 Feb 2021 02:32:28 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVX-0005iv-54; Tue, 09 Feb 2021 02:32:27 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EDFBAC2E;
 Tue,  9 Feb 2021 02:32:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 09 Feb 2021 02:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=OrI9N2v1tR7iW
 7V4b/bdRZ4q67GU1Cyn22dC51/UFLs=; b=QBFwTBXAE2J2XCBHt2l2gP2pVtk13
 VKMbB5kAONmKHduoBb3CMktloYmOPT+gj/j9YfVZ12yb9UkfmJJTX31g2p8ix9zM
 ja9M/eTBFK+hPgj5ZZzDRFKV4oZEnSnHBfBnMuNWTB3n6EODasfgbxm3dFUTqG5q
 6KReZEjUx7kyI58uhk+AEmpDW3HJ2ta9LfP7hi3Fl7Rhm3dP6fjuZ6UlwOjP7j2b
 KgCr5xYuh1sr5cB2pAI1gZwZFVI/CORfGKJNkeZ27yVLInfYLgJ5ZexRge3We/z1
 JZcmdGa8bXEsaItRLAfRWL4TTXvsEkRupOXO1dyb5vSoCUVKsLci1TNPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=OrI9N2v1tR7iW7V4b/bdRZ4q67GU1Cyn22dC51/UFLs=; b=EsOu550w
 WnJXD+nntn6ri/KceOCfZy1TsRQ0CLne0ewm0DewB8WhHor/t64HQL4iqE9NfIvf
 wgr1KrMHJsieWUOil1OHc6G2wzyn+tX7yzoaKDE2UZahVoLHAaa2M8YbueDnFRTV
 lU3Zoh8mt3+m5MpNv1/DLELN5owOg4DjUlmNKurSXMIsm/TSuaDwbeC7qiywdw8h
 R/tsAKq1UNltOD1b3yRpGLtydrZpiqxmxASr2pA2CKUVDSk2Sghe2nKhUiqLXpQj
 JgHcFoQaVpnGZESUyeOnXvlGHtqHQ5vaYaloKdpAHOiQ5YRPCZMd3pymkSXKFWsH
 c7FcV+JhcmI4qg==
X-ME-Sender: <xms:bzoiYNVnifmwJiTdUfGSULBZ8b6yF-uH-5tlzqY_0ES4yjsrDse0cQ>
 <xme:bzoiYLjbX3dgc4JDv7yMzG8NUg9QZ_1zbDi2DQm3RzKxvwB2RqQmMcEPntXBwWLZ4
 -xmRDjYALt6coiiD6Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:cDoiYLseSQg4ngfYkn2NA-dI8jO3rOLv9qGvLFkPQuuzxen2FRCWtg>
 <xmx:cDoiYE5y5f-7NkuURHN_KI4ag9appDYo_wFaopv-M99nncM6a5C5YQ>
 <xmx:cDoiYPMuOQFfjh94SYnFjmjzxqlyJ7dFlnlcX-vpH9-w5tDuiD21Yw>
 <xmx:cDoiYDe7boFQ9P8XD5RkSljpMXuGcYXKtsePUn974pGuCFH0mDuSLcpnT9M>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BFA91080057;
 Tue,  9 Feb 2021 02:31:58 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 24/56] hw/block/nvme: enum style fix
Date: Tue,  9 Feb 2021 08:30:29 +0100
Message-Id: <20210209073101.548811-25-its@irrelevant.dk>
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

Align with existing style and use a typedef for header-file enums.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
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
index a7245a7e05a1..a5cf798bbbaa 100644
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


