Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A834B4496
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:44:34 +0100 (CET)
Received: from localhost ([::1]:43290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWyG-0007gt-2V
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPW-0003B8-9T; Mon, 14 Feb 2022 03:08:38 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPG-0007Xl-Si; Mon, 14 Feb 2022 03:08:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1AE382B001D9;
 Mon, 14 Feb 2022 03:08:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Feb 2022 03:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=szWnx2TgghT4kr
 anW41Qedy8ps34nmWCXbpWfNleVnw=; b=LL13hrNktttnqjLY7UYnLKloK3XxmS
 hTsubAF7U6/DRIKP+rHcDnBc96wsZeYph+cDk/Hq8zLrtXnXncWW2aGfZ96CQIxh
 UEFGb762kMoX34hxj2yaCzHPiWAzvCb+Ey91hwvxsErSq8FkgwBbsdfBd4icJH2k
 QOb4DEqysM9xjo5ZJOoj5bobjo7x+Z35mlkAHEoGI3+l2WfMlvn4QEGVW0AcSTkN
 w1yzpg0EUlydKfUqaaYztOdF/APE9EQIKnxK2PDLGsgUEV5FY9xqd6m46YOngQUs
 jwH6eq51nlWRbA1+U1dzJyxM8jg0wblxt4SI2sx4K8kT7adwyOYi/Mhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=szWnx2
 TgghT4kranW41Qedy8ps34nmWCXbpWfNleVnw=; b=St4yHfPRrAB/xPQPmKw2wg
 CN5U0pPQK/FEmo5/zclHWGBnrzKRJatfR1sxpTXZ9UXei6JJEMn5TY+w6fymwr5Y
 b+tzs/GVBMmA1Hk4c8nwcn1oK1UCkG/yU3+R1QSckfr7Ajoh2QBZXCNZmqrAzrfu
 rxqkl+fDPZiU1Sd5TMpd/oovCgzVAi7pEOSvlAV0hRc9yHjP50dSHmrX+ws33EyU
 qk5Z9JcEQyjf8Qhy4/NZK9y9OWjqINnQK7Ok1YS+IyCu6R0I9/wYgBusuNAtE4Q4
 +qMgSkrt1bESoq+iD9mzX+2WAZ27WberUp5WQ3RkA8BH1HG/J4H0opy8e+Hpc0tg
 ==
X-ME-Sender: <xms:8w0KYtE0IGQUMgGyVL_YaceD62El4nIPpr7DYOpSXqrrGhLBd4gc4g>
 <xme:8w0KYiVfzMc2QtePATX7_7iAPP0hTF1eiUID6Jd_0Vt9mJFOaS1okCyV5VT2Tygfe
 gR4pqLvcDAt34AS9wU>
X-ME-Received: <xmr:8w0KYvIY_HKP5zr544ICv__4Kgb24w1psUVzw87ZU0VS-9X4oE0dVRv-1j-picoqeboD5f2kpA7kDgx157HZpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:8w0KYjF3u5MhQv9fZY1_wcH66MSIMEZWg6sls8pVQ_lLWf8bfl8WLQ>
 <xmx:8w0KYjWKV-9HxpdjzGqly4BFjrZ7NTA8DyI19flHpxML5c1OSkPY1w>
 <xmx:8w0KYuMSNG5pUmv-0DEbVHlNzEoCfWg4DPaXUi64eTECivN11BzJwA>
 <xmx:8w0KYjTG0HhE4f30Aa_PW_yLvEGhT-DB5gMS8Jcjj88Hl0i3hK5dx8XW1ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 03:08:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/6] hw/nvme: add struct for zone management send
Date: Mon, 14 Feb 2022 09:07:59 +0100
Message-Id: <20220214080801.13627-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214080801.13627-1-its@irrelevant.dk>
References: <20220214080801.13627-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add struct for Zone Management Send in preparation for more zone send
flags.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 10 ++++------
 include/block/nvme.h | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4344405e5939..7cb4974c5e83 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3616,26 +3616,24 @@ done:
 
 static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
+    NvmeZoneSendCmd *cmd = (NvmeZoneSendCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeZone *zone;
     NvmeZoneResetAIOCB *iocb;
     uint8_t *zd_ext;
-    uint32_t dw13 = le32_to_cpu(cmd->cdw13);
     uint64_t slba = 0;
     uint32_t zone_idx = 0;
     uint16_t status;
-    uint8_t action;
+    uint8_t action = cmd->zsa;
     bool all;
     enum NvmeZoneProcessingMask proc_mask = NVME_PROC_CURRENT_ZONE;
 
-    action = dw13 & 0xff;
-    all = !!(dw13 & 0x100);
+    all = cmd->zsflags & NVME_ZSFLAG_SELECT_ALL;
 
     req->status = NVME_SUCCESS;
 
     if (!all) {
-        status = nvme_get_mgmt_zone_slba_idx(ns, cmd, &slba, &zone_idx);
+        status = nvme_get_mgmt_zone_slba_idx(ns, &req->cmd, &slba, &zone_idx);
         if (status) {
             return status;
         }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e3bd47bf76ab..709d491c70d8 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1433,6 +1433,21 @@ enum NvmeZoneType {
     NVME_ZONE_TYPE_SEQ_WRITE         = 0x02,
 };
 
+typedef struct QEMU_PACKED NvmeZoneSendCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint32_t    rsvd8[4];
+    NvmeCmdDptr dptr;
+    uint64_t    slba;
+    uint32_t    rsvd48;
+    uint8_t     zsa;
+    uint8_t     zsflags;
+    uint8_t     rsvd54[2];
+    uint32_t    rsvd56[2];
+} NvmeZoneSendCmd;
+
 enum NvmeZoneSendAction {
     NVME_ZONE_ACTION_RSD             = 0x00,
     NVME_ZONE_ACTION_CLOSE           = 0x01,
@@ -1443,6 +1458,10 @@ enum NvmeZoneSendAction {
     NVME_ZONE_ACTION_SET_ZD_EXT      = 0x10,
 };
 
+enum {
+    NVME_ZSFLAG_SELECT_ALL = 1 << 0,
+};
+
 typedef struct QEMU_PACKED NvmeZoneDescr {
     uint8_t     zt;
     uint8_t     zs;
-- 
2.35.1


